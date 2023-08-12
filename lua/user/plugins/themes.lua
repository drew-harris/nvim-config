return {
	{ "rose-pine/neovim", name = "rose-pine", opts = {
		disable_background = true,
	} },
	{
		"loctvl842/monokai-pro.nvim",
		opts = {
			transparent_background = true,
			-- filter = "machine",
			inc_search = "underline",
		},
	},
	{ "askfiy/visual_studio_code" },
	{ "olimorris/onedarkpro.nvim", opts = {
		options = {
			transparency = true,
		},
	} },
	{ "metalelf0/jellybeans-nvim", dependencies = "rktjmp/lush.nvim" },
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
}
