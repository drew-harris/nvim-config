return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.files").setup({
			options = {
				use_as_default_explorer = false,
			},
		})
		vim.keymap.set("n", "<leader>E", function()
			require("mini.files").open(vim.api.nvim_buf_get_name(0))
		end, { desc = "Mini File" })

		require("mini.ai").setup()
	end,
}
