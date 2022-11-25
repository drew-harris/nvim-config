-- Motion plugin
require("leap").add_default_mappings()

-- Line peek when typing :<num>
require("numb").setup()

-- Smooth scrolling
require("neoscroll").setup({
	easing_function = "quadratic",
})
