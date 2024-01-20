return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		local neogen = require("neogen")
		neogen.setup()
		Keymapper("lG", neogen.generate, "Generate documentation")
	end,
	-- Uncomment next line if you want to follow only stable versions
	-- version = "*"
}
