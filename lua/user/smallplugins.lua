-- Motion plugin
require("leap").add_default_mappings()

-- Line peek when typing :<num>
require("numb").setup()

require("todo-comments").setup({
	-- Configuration here
})

-- Smooth scrolling
require("neoscroll").setup({
	easing_function = "quadratic",
	-- TODO: Figure out how to center cursor after every scroll

	-- post_hook = function()
	-- 	require("neoscroll").zz(200)
	-- end,
})
