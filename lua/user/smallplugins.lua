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
require("neoscroll").setup({
	easing_function = "quadratic",
	-- TODO: Figure out how to center cursor after every scroll
})

require("aerial").setup({
	backends = { "treesitter", "lsp", "markdown", "man" },
	layout = {
		default_direction = "prefer_left",
	},
})

-- Better quick fix, hide stupid menu
vim.g["code_action_menu_show_details"] = false

require("fidget").setup({})

-- TODO: REMOVE
-- require("tabout").setup({})

require("lsp_lines").setup()
require("lsp_lines").toggle()
