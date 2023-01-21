-- Motion plugin
require("leap").add_default_mappings()

require("todo-comments").setup({
	keywords = {
		FIX = {
			icon = " ", -- icon used for the sign, and in search results
			color = "error", -- can be a hex color, or a named color (see below)
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
			-- signs = false, -- configure signs for some keywords individually
		},
		TODO = { icon = " ", color = "info" },
		HACK = { icon = " ", color = "warning" },
		WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
		PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = " ", color = "hint", alt = { "MEETING" } },
		TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
	},
	-- Configuration here
})

-- Smooth scrolling
-- require("neoscroll").setup({
-- 	easing_function = "quadratic",
-- 	-- TODO: Figure out how to center cursor after every scroll
-- })

require("aerial").setup({
	backends = { "treesitter", "lsp", "markdown", "man" },

	layout = {
		default_direction = "prefer_left",
	},
})

-- Copliot setup
-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- require("notify").setup({
-- 	background_colour = "#000000",
-- })

require("fidget").setup({})

-- Noice
require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		signature = {
			enabled = false,
		},

		progress = {
			enabled = false,
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},

	messages = {
		enabled = false, -- enables the Noice messages UI
	},
	notify = {
		enabled = false,
	},

	routes = {
		{
			filter = {
				event = "msg_show",
				kind = "",
				find = "written",
			},
			opts = { skip = true },
		},
	},
	popupmenu = {
		enabled = false, -- enables the Noice popupmenu UI
		---@type 'nui'|'cmp'
		backend = "nui", -- backend to use to show regular cmdline completions
		---@type NoicePopupmenuItemKind|false
		-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
		kind_icons = {}, -- set to `false` to disable icons
	},

	hover = {
		enabled = false,
	},
	signature = {
		enabled = false,
	},
})

vim.keymap.set("n", "<Down>", function()
	if not require("noice.lsp").scroll(4) then
		return "<Down>"
	end
end, { silent = true, expr = true })

vim.keymap.set("n", "<Up>", function()
	if not require("noice.lsp").scroll(-4) then
		return "<Up>"
	end
end, { silent = true, expr = true })
