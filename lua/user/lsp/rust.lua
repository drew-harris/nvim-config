local M = {}

-- Keep track of cargo check status
M.is_checking = false

local function setup_lsp_progress()
	-- Store the original progress handler
	local original_handler = vim.lsp.handlers["$/progress"]

	-- Attach to the rust_analyzer client when it starts
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)

			if client and client.name == "rust-analyzer" then
				client.server_capabilities.window = client.server_capabilities.window or {}
				client.server_capabilities.window.workDoneProgress = true

				---@diagnostic disable-next-line: duplicate-set-field
				vim.lsp.handlers["$/progress"] = function(err, result, ctx, ...)
					-- Call original handler first if it exists
					if original_handler then
						original_handler(err, result, ctx, ...)
					end

					if ctx.client_id == client.id then
						local value = result.value

						if value.kind == "begin" then
							if value.title and value.title:match("cargo check") then
								M.is_checking = true
								vim.cmd("hi Normal guibg=#2c1c1c")
							end
						elseif value.kind == "end" then
							if value.title and value.title:match("cargo check") then
								M.is_checking = false
								vim.cmd("hi Normal guibg=#1c1c1c")
							end
						end
					end
				end
			end
		end,
	})
end

function M.setup()
	setup_lsp_progress()
end

return M
