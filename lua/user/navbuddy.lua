local navbuddy = require("nvim-navbuddy")

navbuddy.setup({
	lsp = {
		auto_attach = true,
		preference = { "tsserver", "rust_analyzer", "pyright", "gopls", "clangd", "lua_ls" },
	},
})
