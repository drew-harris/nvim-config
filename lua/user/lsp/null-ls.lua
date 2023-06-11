local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- local formatting = null_ls.builtins.formatting
-- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("mason-null-ls").setup({
	ensure_installed = { "stylua", "jq" },
	handlers = {
		function(source_name, methods)
			-- all sources with no handler get passed here

			-- To keep the original functionality of `automatic_setup = true`,
			-- please add the below.
			require("mason-null-ls.automatic_setup")(source_name, methods)
		end,
		prettierd = function(source_name, methods)
			null_ls.register(null_ls.builtins.formatting.prettierd)
		end,
		clang_format = function(source_name, methods)
			null_ls.register(null_ls.builtins.formatting.clang_format.with({
				extra_args = { "{IndentWidth: 4}" },
			}))
		end,
	},
})

null_ls.setup({
	debug = false,
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.gofmt,
		-- formatting.black.with({ extra_args = { "--fast" } }),
		-- formatting.stylua,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})

local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	notify(msg, ...)
end
