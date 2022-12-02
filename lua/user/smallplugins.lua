-- Motion plugin
-- require("leap").add_default_mappings()

-- Line peek when typing :<num>
require("numb").setup()

require("todo-comments").setup({
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
