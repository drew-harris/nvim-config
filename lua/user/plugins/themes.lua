return {
	{ "rose-pine/neovim", name = "rose-pine" },
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
		lazy = true, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		opts = {
			options = {
				transparent = true,
			},
		},
	},
	{ "askfiy/visual_studio_code" },
	{ "olimorris/onedarkpro.nvim", opts = {
		options = {
			transparency = true,
		},
	} },
	{ "metalelf0/jellybeans-nvim", dependencies = "rktjmp/lush.nvim" },
}
