return {
	"Dhanus3133/LeetBuddy.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("leetbuddy").setup({})
	end,
}
