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
	"wbthomason/packer.nvim",
	"nvim-lua/plenary.nvim",
	"windwp/nvim-autopairs",
	{ "windwp/nvim-ts-autotag", lazy = true, config = true, ft = { "js", "tsx", "ts", "tsx" } },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "numToStr/Comment.nvim" },
	"kyazdani42/nvim-web-devicons",
	"kyazdani42/nvim-tree.lua",
	"akinsho/bufferline.nvim",
	"moll/vim-bbye",
	"nvim-lualine/lualine.nvim",
	"akinsho/toggleterm.nvim",
	"lewis6991/impatient.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"goolord/alpha-nvim",

	"folke/which-key.nvim",

	-- Colorschemes
	{ "folke/tokyonight.nvim", lazy = true },
	{ "Shatur/neovim-ayu", lazy = true },
	{ "dracula/vim", lazy = true },
	{ "ellisonleao/gruvbox.nvim", lazy = true },
	{ "sainnhe/everforest", lazy = true },
	{ "tanvirtin/monokai.nvim", lazy = true },
	{ "catppuccin/nvim", lazy = true },
	{ "NLKNguyen/papercolor-theme", lazy = true },
	{ "ishan9299/nvim-solarized-lua", lazy = true },
	{ "projekt0n/github-nvim-theme", lazy = true },
	{ "bluz71/vim-nightfly-colors", lazy = true },
	{ "sainnhe/sonokai", lazy = true },
	{ "EdenEast/nightfox.nvim", lazy = true },
	{ "rafamadriz/neon", lazy = true },
	{ "glepnir/zephyr-nvim", lazy = true },
	{ "ishan9299/modus-theme-vim", lazy = true },
	{ "titanzero/zephyrium", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true },
	{ "Mofiqul/adwaita.nvim", lazy = true },
	{ "olimorris/onedarkpro.nvim" },
	{ "phha/zenburn.nvim", lazy = true },
	{ "echasnovski/mini.base16", version = "*" },

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
	"arkav/lualine-lsp-progress",

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
	{
		"jedrzejboczar/toggletasks.nvim",
	},

	-- Debugging
	"mfussenegger/nvim-dap",
	"leoluz/nvim-dap-go",
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	"jayp0521/mason-nvim-dap.nvim",

	{ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },

	-- Rust
	"simrat39/rust-tools.nvim",
	"simrat39/inlay-hints.nvim",

	{ "kevinhwang91/nvim-bqf", ft = "qf" },
	"ray-x/lsp_signature.nvim",

	-- Telescope
	-- use({
	{ "nvim-telescope/telescope.nvim", dependencies = "nvim-telescope/telescope-live-grep-args.nvim" },

	-- Treesitter
	"nvim-treesitter/nvim-treesitter",
	"stevearc/aerial.nvim",

	"nvim-treesitter/nvim-treesitter-context",

	-- UI Improvements
	{ "stevearc/dressing.nvim", event = "VeryLazy" },

	-- Git
	"lewis6991/gitsigns.nvim",

	{
		"akinsho/git-conflict.nvim",
		config = function()
			require("git-conflict").setup()
		end,
	},

	-- Drew's Motions
	"ggandor/leap.nvim",
	"tpope/vim-repeat",

	-- Todo Highlighting
	"folke/todo-comments.nvim",

	-- Smooth scrolling
	"karb94/neoscroll.nvim",

	"ThePrimeagen/harpoon",

	"github/copilot.vim",
})
