return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			disable_background = true,
		},
	},
	{ "EdenEast/nightfox.nvim", opts = {
		options = {
			transparent = true,
		},
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
	{
		"olimorris/onedarkpro.nvim",
		opts = {
			-- options = {
			-- 	transparency = true,
			-- },
		},
	},
	{
		"metalelf0/jellybeans-nvim",
		dependencies = "rktjmp/lush.nvim",
	},
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = { transparent = true },
	},
	{
		"kartikp10/noctis.nvim",
	},
	-- {
	-- 	"jacoborus/tender.vim",
	-- },
	{
		"Shatur/neovim-ayu",
	},
	{
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				options = {
					transparent = true,
					transparent_background = true,
				},
			})
		end,
	},

	{
		"doums/darcula",
	},

	{
		"briones-gabriel/darcula-solid.nvim",
	},
	-- { "Mofiqul/dracula.nvim" },
	-- "RRethy/nvim-base16",
}
