return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-context" },
	config = function()
		local configs = require("nvim-treesitter.configs")
		---@diagnostic disable-next-line: missing-fields
		configs.setup({
			ensure_installed = "all", -- one of "all" or a list of languages
			ignore_install = { "phpdoc" }, -- List of parsers to ignore installingtree
			highlight = {
				enable = true, -- false will disable the whole extension
			},
			autopairs = {
				enable = true,
			},
			context_commentstring = {
				enable = true,
			},
			autotag = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = false,
			},
			indent = { enable = true, disable = { "python" } },
			-- incremental_selection = {
			-- 	enable = true,
			-- 	keymaps = {
			-- 		init_selection = ",",
			-- 		node_incremental = ",",
			-- 		node_decremental = ".",
			-- 	},
			-- },
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
			},
		})
	end,
}
