return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	-- dependencies = { "rafamadriz/friendly-snippets", "folke/lazydev.nvim" },
	dependencies = { "folke/lazydev.nvim" },

	version = "v0.*",

	---@module 'blink.cmp'
	opts = {
		keymap = {
			preset = "default",
			["<cr>"] = {
				function(cmp)
					if vim.api.nvim_get_mode().mode == "i" and vim.bo.buftype == "" then
						if cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					else
					end
				end,
				"snippet_forward",
				"fallback",
			},
		},

		appearance = {
			-- use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
					kind_resolution = {
						enabled = true,
						blocked_filetypes = {},
					},
					semantic_token_resolution = {
						enabled = true,
						blocked_filetypes = {},
						-- How long to wait for semantic tokens to return before assuming no brackets should be added
						timeout_ms = 400,
					},
				},
			},
		},

		-- default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, via `opts_extend`
		sources = {
			-- cmdline = function()
			-- 	local type = vim.fn.getcmdtype()
			-- 	local cmd = vim.fn.getcmdline()
			-- 	if type == ":" and cmd ~= "w" then
			-- 		return { "cmdline" }
			-- 	end
			-- 	return {}
			-- end,

			default = { "lsp", "path", "snippets", "buffer", "lazydev" },
			providers = {
				snippets = {
					opts = {
						search_paths = { "/Users/drew/.config/nvim/snippets" },
					},
				},

				-- dont show LuaLS require statements when lazydev has items
				lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", fallbacks = { "lsp" } },
			},
			-- optionally disable cmdline completions
			-- cmdline = {},
		},

		-- experimental signature help support
		-- signature = { enabled = true },
	},
	-- allows extending the providers array elsewhere in your config
	-- without having to redefine it
	opts_extend = { "sources.default" },
}
