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

-- Makes things faster apparently?
vim.loader.enable()

-- Install your plugins here
require("lazy").setup({
	"nvim-lua/plenary.nvim",
	"kyazdani42/nvim-web-devicons",
	"lukas-reineke/indent-blankline.nvim",
	"windwp/nvim-autopairs",
	{ "windwp/nvim-ts-autotag" },
	{ "JoosepAlviste/nvim-ts-context-commentstring", opts = {} },
	require("user.plugins.comment"),

	require("user.plugins.undotree"),

	require("user.plugins.oil"),

	require("user.plugins.neotree"),

	require("user.plugins.cybu"),
	"folke/which-key.nvim",

	require("user.plugins.toggleterm"),

	require("user.plugins.alpha"),

	-- Easy align
	"junegunn/vim-easy-align",

	-- Colorschemes
	require("user.plugins.themes"),

	-- UI Improvements
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	require("user.lsp.saga"),
	require("user.plugins.lualine"),

	-- Utils
	{ "norcalli/nvim-colorizer.lua", opts = {} },
	{ "themaxmarchuk/tailwindcss-colors.nvim", opts = {} },
	require("user.plugins.tw-values"),

	require("user.plugins.glance"),

	-- Cmp
	{ "hrsh7th/nvim-cmp", event = "InsertEnter", dependencies = "hrsh7th/cmp-buffer" },
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",

	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	},
	require("user.plugins.scissors"),
	-- "rafamadriz/friendly-snippets",

	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"weilbith/nvim-code-action-menu",
	"jay-babu/mason-null-ls.nvim",
	require("user.plugins.trouble"),
	"folke/neodev.nvim",
	require("user.plugins.navbuddy"),
	require("user.plugins.tstools"),
	require("user.plugins.signature_help"),

	{
		"lvimuser/lsp-inlayhints.nvim",
		config = function()
			require("lsp-inlayhints").setup({
				inlay_hints = {
					highlight = "Comment",
					parameter_hints = {
						prefix = "     <- ",
					},
					type_hints = {
						prefix = "     <- ",
					},
				},
			})
		end,
	},

	-- Language Specific
	-- "vrischmann/tree-sitter-templ",
	-- "joerdav/templ.vim",

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

	-- Debugging
	-- "mfussenegger/nvim-dap",
	-- "leoluz/nvim-dap-go",
	-- { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	-- "jayp0521/mason-nvim-dap.nvim",

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
		dependencies = { "junegunn/fzf" },
	},

	-- Telescope
	require("user.plugins.telescope"),

	-- Treesitter
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/nvim-treesitter-context",
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

	-- Git
	"lewis6991/gitsigns.nvim",
	require("user.plugins.diffs"),
	require("user.plugins.neogit"),

	{
		"akinsho/git-conflict.nvim",
		config = function()
			---@diagnostic disable-next-line: missing-parameter
			require("git-conflict").setup()
		end,
	},

	-- Drew's Motions
	"tpope/vim-repeat",
	"tpope/vim-sleuth",
	require("user.plugins.leap"),

	-- Todo Highlighting
	"folke/todo-comments.nvim",

	require("user.plugins.harpoon"),

	-- AI
	{ "zbirenbaum/copilot.lua", cmd = "Copilot", event = "InsertEnter" },
	"zbirenbaum/copilot-cmp",
	-- require("user.plugins.chatgpt"),

	-- Markdown
	require("user.plugins.glow"),

	{ "JellyApple102/flote.nvim", opts = {} },

	-- Fun
	"eandrju/cellular-automaton.nvim",
	"wakatime/vim-wakatime",
	{
		"j-hui/fidget.nvim",
		opts = {
			progress = {
				ignore_done_already = true,
				ignore = { "null-ls" },
			},
			-- options
			notification = {
				window = {
					winblend = 0,
				},
			},
		},
	},

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
