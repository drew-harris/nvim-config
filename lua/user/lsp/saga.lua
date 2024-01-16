return {
	"glepnir/lspsaga.nvim",
	event = "LspAttach",
	config = function()
		require("lspsaga").setup({
			beacon = {
				enable = true,
			},
			outline = {
				win_position = "left",
				preview_width = 0.4,
				auto_preview = true,
				auto_refresh = true,
				auto_close = true,
				custom_sort = nil,
				keys = {
					expand_or_collapse = "o",
					quit = "q",
				},
			},
			lightbulb = {
				enable = false,
			},

			-- Disable code actions
			code_action = {
				enable = false,
			},

			symbol_in_winbar = {
				enable = false,
				folder_level = 0,
				show_file = false,
			},
		})
	end,
	dependencies = {
		{ "kyazdani42/nvim-web-devicons" },
		{ "nvim-treesitter/nvim-treesitter" },
	},
}
