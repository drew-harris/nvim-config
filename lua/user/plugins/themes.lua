return {
	{
		"loctvl842/monokai-pro.nvim",
		opts = {
			transparent_background = true,
			-- filter = "machine",
			inc_search = "underline",
		},
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({
				options = {
					transparent = true,
				},
				-- ...
			})
		end,
	},
	{ "askfiy/visual_studio_code" },
	{ "rebelot/kanagawa.nvim" },
	{ "olimorris/onedarkpro.nvim" },
	{ "metalelf0/jellybeans-nvim", dependencies = "rktjmp/lush.nvim" },

	{ "jacoborus/tender.vim" },
}
