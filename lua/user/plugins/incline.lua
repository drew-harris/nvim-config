return {
	"b0o/incline.nvim",
	config = function()
		local incline = require("incline")

		incline.setup({
			window = {
				margin = {
					horizontal = 0,
					vertical = 0,
				},
			},
		})
		Keymapper("mi", incline.toggle, "Toggle Incline")
	end,
	event = "VeryLazy",
}
