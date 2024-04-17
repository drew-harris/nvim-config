return {
	"SmiteshP/nvim-navbuddy",
	dependencies = {
		"neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local navbuddy = require("nvim-navbuddy")
		navbuddy.setup({
			window = {
				size = "70%",
			},
			lsp = {
				auto_attach = true,
				preference = { "tsserver", "rust_analyzer", "pyright", "gopls", "clangd", "lua_ls" },
			},
		})

		vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>Navbuddy<cr>", { desc = "Navbuddy" })
	end,
}
