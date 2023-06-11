local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Install your plugins here
require("lazy").setup({
	"nvim-lua/plenary.nvim",
	"windwp/nvim-autopairs",
	{ "windwp/nvim-ts-autotag", lazy = true, config = true, ft = { "js", "tsx", "ts", "tsx" } },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "numToStr/Comment.nvim" },
	"kyazdani42/nvim-web-devicons",
	"kyazdani42/nvim-tree.lua",
	"akinsho/bufferline.nvim",
	"nvim-lualine/lualine.nvim",
	"akinsho/toggleterm.nvim",
	"lewis6991/impatient.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"goolord/alpha-nvim",

	"folke/which-key.nvim",

	-- Colorschemes
	{ "folke/tokyonight.nvim" },
	{ "Shatur/neovim-ayu" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "sainnhe/everforest" },
	{ "tanvirtin/monokai.nvim" },
	{ "catppuccin/nvim" },
	{ "NLKNguyen/papercolor-theme" },
	{ "ishan9299/nvim-solarized-lua" },
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
	{ "sainnhe/sonokai" },
	{ "EdenEast/nightfox.nvim" },
	{ "rafamadriz/neon" },
	{ "glepnir/zephyr-nvim" },
	{ "ishan9299/modus-theme-vim" },
	"askfiy/visual_studio_code",
	{ "titanzero/zephyrium" },
	{ "rebelot/kanagawa.nvim" },
	{ "Mofiqul/adwaita.nvim" },
	{ "olimorris/onedarkpro.nvim" },
	{ "metalelf0/jellybeans-nvim", dependencies = "rktjmp/lush.nvim" },

	-- Utils
	{ "norcalli/nvim-colorizer.lua", opts = {} },
	{ "themaxmarchuk/tailwindcss-colors.nvim", opts = {} },

	-- Cmp
	{ "hrsh7th/nvim-cmp", event = "InsertEnter", dependencies = "hrsh7th/cmp-buffer" },
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",

	-- Snippets
	-- TODO: Learn LuaSnip
	-- https://www.youtube.com/watch?v=Dn800rlPIho
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"jay-babu/mason-null-ls.nvim",
	{ "RRethy/vim-illuminate", event = "VeryLazy" },
	"folke/neodev.nvim",
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
		},
	},
	-- FLUTTER
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
	},

	-- Test Runner
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"marilari88/neotest-vitest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-vitest"),
				},
				quickfix = {
					open = false,
				},
			})
		end,
	},

	-- Task Runner
	"jedrzejboczar/toggletasks.nvim",

	"weilbith/nvim-code-action-menu",

	-- Debugging
	"mfussenegger/nvim-dap",
	"leoluz/nvim-dap-go",
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	"jayp0521/mason-nvim-dap.nvim",

	-- Rust
	"simrat39/rust-tools.nvim",
	"simrat39/inlay-hints.nvim",

	{ "kevinhwang91/nvim-bqf", ft = "qf" },
	"ray-x/lsp_signature.nvim",

	-- Telescope
	{ "nvim-telescope/telescope.nvim", dependencies = "nvim-telescope/telescope-live-grep-args.nvim" },
	{ "molecule-man/telescope-menufacture" },

	-- Treesitter
	"nvim-treesitter/nvim-treesitter",

	"nvim-treesitter/nvim-treesitter-context",

	-- UI Improvements
	{ "stevearc/dressing.nvim", event = "VeryLazy" },

	-- Git
	"lewis6991/gitsigns.nvim",

	{
		"akinsho/git-conflict.nvim",
		config = function()
			---@diagnostic disable-next-line: missing-parameter
			require("git-conflict").setup()
		end,
	},

	-- Drew's Motions
	"ggandor/leap.nvim",
	"tpope/vim-repeat",
	"tpope/vim-sleuth",

	-- Todo Highlighting
	"folke/todo-comments.nvim",

	"ThePrimeagen/harpoon",

	{ "zbirenbaum/copilot.lua", cmd = "Copilot", event = "InsertEnter" },
	"zbirenbaum/copilot-cmp",

	-- Markdown
	{
		"ellisonleao/glow.nvim",
		---@diagnostic disable-next-line: assign-type-mismatch
		config = {
			function()
				require("glow").setup({
					width_ratio = 0.9, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
					height_ratio = 0.9,
				})
			end,
		},
	},
	{ "JellyApple102/flote.nvim", opts = {} },

	-- Fun
	"eandrju/cellular-automaton.nvim",
	"wakatime/vim-wakatime",

	{
		"m4xshen/hardtime.nvim",
		opts = {
			disable_mouse = false,
			max_count = 4,
			disabled_filetypes = {
				"qf",
				"netrw",
				"NvimTree",
				"lazy",
				"mason",
				"dbui",
				"code-action-menu-menu",
				"flutterToolsOutline",
			},
		},
	},
})
