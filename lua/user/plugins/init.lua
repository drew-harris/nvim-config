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
	{ "kyazdani42/nvim-web-devicons", lazy = true },
	"lukas-reineke/indent-blankline.nvim",
	"windwp/nvim-autopairs",
	{ "windwp/nvim-ts-autotag" },
	{ "JoosepAlviste/nvim-ts-context-commentstring", opts = {} },
	require("user.plugins.comment"),

	require("user.plugins.undotree"),

	require("user.plugins.oil"),

	-- require("user.plugins.cybu"),

	-- MINI
	require("user.plugins.mini"),

	"folke/which-key.nvim",

	require("user.plugins.toggleterm"),

	require("user.plugins.alpha"),

	-- Easy align
	"junegunn/vim-easy-align",

	-- Colorschemes
	require("user.plugins.themes"),

	-- UI Improvements
	{ "stevearc/dressing.nvim", event = "VeryLazy" },

	require("user.plugins.lualine"),

	-- Utils
	{ "norcalli/nvim-colorizer.lua", opts = {} },
	{ "themaxmarchuk/tailwindcss-colors.nvim", opts = {} },
	require("user.plugins.tw-values"),

	require("user.plugins.glance"),

	require("user.plugins.cmp"),

	--
	----
	require("user.plugins.scissors"),

	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"weilbith/nvim-code-action-menu",
	"jay-babu/mason-null-ls.nvim",
	require("user.plugins.trouble"),
	require("user.lsp.saga"),
	"folke/neodev.nvim",
	require("user.plugins.navbuddy"),
	require("user.plugins.tstools"),
	require("user.plugins.signature_help"),
	require("user.plugins.inlayhints"),
	require("user.plugins.neogen"),

	-- Language Specific
	-- "vrischmann/tree-sitter-templ",
	-- "joerdav/templ.vim",
	"mfussenegger/nvim-jdtls",

	require("user.plugins.neotest"),

	-- Debugging
	-- "mfussenegger/nvim-dap",
	-- "leoluz/nvim-dap-go",
	-- { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
	-- "jayp0521/mason-nvim-dap.nvim",

	-- Rust
	"simrat39/rust-tools.nvim",
	"simrat39/inlay-hints.nvim",
	require("user.plugins.crates"),

	require("user.plugins.quickfix"),

	-- Telescope
	require("user.plugins.telescope"),

	-- require("user.plugins.neotree"),

	-- Treesitter
	require("user.plugins.treesitter"),
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
	require("user.plugins.gitsigns"),
	require("user.plugins.diffs"),
	require("user.plugins.neogit"),

	{
		"akinsho/git-conflict.nvim",
		config = function()
			require("git-conflict").setup({})
		end,
	},

	-- Drew's Motions
	"tpope/vim-repeat",
	"tpope/vim-sleuth",
	require("user.plugins.leap"),

	-- Todo Highlighting
	require("user.plugins.todocomments"),

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
	"ThePrimeagen/vim-be-good",

	require("user.plugins.fidget"),
})
