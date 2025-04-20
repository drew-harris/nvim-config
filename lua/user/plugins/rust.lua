return {
	"mrcjkb/rustaceanvim",
	-- TODO: Update to latest version
	version = "^6", -- Recommended
	enabled = false,
	lazy = false, -- This plugin is already lazy
	config = function()
		vim.g.rustaceanvim = {
			tools = {
				enable_clippy = false,
			},
			server = {
				on_attach = function(client, bufnr)
					-- Set keybindings, etc. here.
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

					vim.keymap.set("n", "<leader>I", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, { desc = "Toggle inlay hints" })

					require("user.lsp.handlers").on_attach(client, bufnr)
				end,
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {
						-- checkOnSave = false,
					},
				},
				-- ...
			},
			dap = {
				-- ...
			},
		}
	end,
}
