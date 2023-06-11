require("neo-tree").setup({
	buffers = {
		window = {
			mappings = {
				["x"] = "buffer_delete",
			},
		},
	},

	window = {
		position = "right",
		mappings = {
			["<esc>"] = "close_window",
		},
	},
	source_selector = {
		winbar = true,
		-- statusline = true,
		sources = { -- table
			{
				source = "filesystem", -- string
				display_name = "  Files ", -- string | nil
			},
			{
				source = "buffers", -- string
				display_name = "  Buffers ", -- string | nil
			},
			{
				source = "git_status", -- string
				display_name = "  Git ", -- string | nil
			},
			{
				source = "document_symbols",
				display_name = "  Symbols ",
			},
		},
	},
	sources = {
		"filesystem",
		"buffers",
		"git_status",
		"document_symbols",
	},
})
