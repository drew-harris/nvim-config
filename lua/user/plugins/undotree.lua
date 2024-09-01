return {
	"mbbill/undotree",
	lazy = false,
	config = function()
		vim.api.nvim_set_keymap(
			"n",
			"<leader>U",
			"<cmd>UndotreeToggle<CR>",
			{ noremap = true, silent = true, desc = "Undo Tree" }
		)

		vim.g["undotree_WindowLayout"] = 2
	end,
}
