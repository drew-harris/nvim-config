return {
	"echasnovski/mini.nvim",
	config = function()
		-- require("mini.files").setup({
		-- 	options = {
		-- 		use_as_default_explorer = true,
		-- 	},
		-- })
		-- vim.keymap.set("n", "<leader>e", function()
		-- 	require("mini.files").open()
		-- end, { desc = "Mini File" })

		require("mini.ai").setup()
	end,
}
