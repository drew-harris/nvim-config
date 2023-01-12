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
	},
	-- Configuration here
})

-- Smooth scrolling
require("neoscroll").setup({
	easing_function = "quadratic",
	-- TODO: Figure out how to center cursor after every scroll
	-- Mignt need to submit Github Issue

	-- Better performance
	-- pre_hook = function()
	-- 	vim.cmd("IndentBlanklineDisable")
	-- end,
	--
	-- post_hook = function()
	-- 	vim.cmd("IndentBlanklineEnable")
	-- end,
})

require("aerial").setup({
	backends = { "treesitter", "lsp", "markdown", "man" },

	layout = {
		default_direction = "prefer_left",
	},
})

-- Copliot setup
-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

require("treesitter-context").setup()
