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
		})
	end,
	dependencies = {
		{ "kyazdani42/nvim-web-devicons" },
		{ "nvim-treesitter/nvim-treesitter" },
	},
}
