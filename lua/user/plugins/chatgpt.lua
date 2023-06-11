return {
	"dreamsofcode-io/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		require("chatgpt").setup({
			async_api_key_cmd = "cat ~/key.txt",
			api_key_cmd = "cat ~/key.txt",
		})
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
}
