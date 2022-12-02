local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "windwp/nvim-ts-autotag" })
	use({ "numToStr/Comment.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "akinsho/bufferline.nvim" })
	use({ "moll/vim-bbye" }) -- Fixes bdelete
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "goolord/alpha-nvim" })
	use({ "folke/which-key.nvim" })

	-- Colorschemes
	use({ "folke/tokyonight.nvim" })
	use({ "Shatur/neovim-ayu" })
	use({ "dracula/vim" })
	use({ "ellisonleao/gruvbox.nvim" })
	use({ "sainnhe/everforest" })
	use("tanvirtin/monokai.nvim")
	use({ "catppuccin/nvim" })
	use({
		"ViViDboarder/wombat.nvim",
		requires = "rktjmp/lush.nvim",
	})
	use({ "navarasu/onedark.nvim" })
	use({ "NLKNguyen/papercolor-theme" })
	use({ "ishan9299/nvim-solarized-lua" })
	use({ "projekt0n/github-nvim-theme" })

	use("Abstract-IDE/Abstract-cs")
	use("martinsione/darkplus.nvim")
	use("marko-cerovac/material.nvim")
	use("bluz71/vim-nightfly-colors")
	use({ "bluz71/vim-moonfly-colors", branch = "cterm-compat" })
	use({ "sainnhe/sonokai" })
	use("EdenEast/nightfox.nvim")
	use("rafamadriz/neon")
	use({
		"glepnir/zephyr-nvim",
		requires = { "nvim-treesitter/nvim-treesitter", opt = true },
	})
	use("ishan9299/modus-theme-vim")
	use("titanzero/zephyrium")
	use("rebelot/kanagawa.nvim")
	use("Yazeed1s/minimal.nvim")
	use("Mofiqul/adwaita.nvim")
	use("savq/melange")
	use("sainnhe/gruvbox-material")

	-- Cmp
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })

	-- Snippets
	-- TODO: Learn LuaSnip
	-- https://www.youtube.com/watch?v=Dn800rlPIho
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/mason.nvim" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "RRethy/vim-illuminate" })
	use("folke/neodev.nvim")
	use("stevearc/aerial.nvim") -- Outline panel

	-- Better quickfix windows
	-- Only load on filetype quickfix
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })
	use({ "ray-x/lsp_signature.nvim" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-telescope/telescope-live-grep-args.nvim" },
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
	})

	-- Git
	use({ "lewis6991/gitsigns.nvim" })
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup()
		end,
	})

	-- Drew's Motions
	use({ "ggandor/leap.nvim" })
	-- use("ggandor/lightspeed.nvim")
	use("tpope/vim-repeat") -- Dependency

	-- Todo Highlighting
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	-- Peeks lines when typing :<number>
	use("nacro90/numb.nvim")

	-- Smooth scrolling
	use("karb94/neoscroll.nvim")

	use("ThePrimeagen/harpoon")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
