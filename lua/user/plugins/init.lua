---@diagnostic disable: missing-fields
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
	{ "windwp/nvim-ts-autotag" },
	{ "JoosepAlviste/nvim-ts-context-commentstring", opts = {} },
	{ "numToStr/Comment.nvim" },
	"kyazdani42/nvim-web-devicons",

	"tpope/vim-vinegar",
	require("user.plugins.oil"),
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		branch = "v3.x",
	},

	"famiu/bufdelete.nvim",
	-- require("user.plugins.bufferline"),
	"akinsho/toggleterm.nvim",
	"lewis6991/impatient.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"goolord/alpha-nvim",

	-- require("user.plugins.lualine"),

	"folke/which-key.nvim",

	-- Colorschemes
	require("user.plugins.themes"),

	-- Utils
	{ "norcalli/nvim-colorizer.lua", opts = {} },
	{ "themaxmarchuk/tailwindcss-colors.nvim", opts = {} },
	require("user.plugins.tw-values"),

	require("user.lsp.saga"),
	require("user.plugins.glance"),
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
	{ "mfussenegger/nvim-jdtls" },

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
	"vrischmann/tree-sitter-templ",
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
	"joerdav/templ.vim",

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
	require("user.plugins.crates"),

	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		opts = {
			auto_enable = true,
			auto_resize_height = true, -- highly recommended enable
		},
	},

	"ray-x/lsp_signature.nvim",

	-- Telescope
	{ "nvim-telescope/telescope.nvim", dependencies = "nvim-telescope/telescope-live-grep-args.nvim" },
	{ "molecule-man/telescope-menufacture" },

	-- Treesitter
	"nvim-treesitter/nvim-treesitter",

	"nvim-treesitter/nvim-treesitter-context",

	-- UI Improvements
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	-- require("user.plugins.block"),

	-- Git
	"lewis6991/gitsigns.nvim",
	require("user.plugins.diffs"),
	require("user.plugins.neogit"),

	{
		"sustech-data/wildfire.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("wildfire").setup({
				surrounds = {
					{ "(", ")" },
					{ "{", "}" },
					{ "<", ">" },
					{ "[", "]" },
				},
				keymaps = {
					init_selection = ",",
					node_incremental = ",",
				},
			})
		end,
	},

	{
		"akinsho/git-conflict.nvim",
		config = function()
			---@diagnostic disable-next-line: missing-parameter
			require("git-conflict").setup()
		end,
	},

	-- Drew's Motions
	-- "ggandor/leap.nvim",
	"tpope/vim-repeat",
	"tpope/vim-sleuth",
	require("user.leap"),

	-- Todo Highlighting
	"folke/todo-comments.nvim",

	require("user.plugins.leetcode"),

	{
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup({
				tabline = true,
				tabline_prefix = "   ",
				tabline_suffix = "   ",
				enter_on_sendcmd = true,
				global_settings = {
					tabline = true,
					tabline_prefix = "   ",
					tabline_suffix = "   ",
					enter_on_sendcmd = true,
				},
			})
		end,
	},

	-- AI
	{ "zbirenbaum/copilot.lua", cmd = "Copilot", event = "InsertEnter" },
	"zbirenbaum/copilot-cmp",
	require("user.plugins.chatgpt"),

	-- Markdown
	{
		"ellisonleao/glow.nvim",
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

	-- { "echasnovski/mini.animate", opts = {} },

	-- {
	-- 	"m4xshen/hardtime.nvim",
	-- 	opts = {
	-- 		disable_mouse = false,
	-- 		max_count = 4,
	-- 		disabled_filetypes = {
	-- 			"qf",
	-- 			"netrw",
	-- 			"NvimTree",
	-- 			"lazy",
	-- 			"mason",
	-- 			"dbui",
	-- 			"code-action-menu-menu",
	-- 			"flutterToolsOutline",
	-- 			"neo-tree",
	-- 			"help",
	-- 		},
	-- 	},
	-- },
})
