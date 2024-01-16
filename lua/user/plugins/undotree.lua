return {
	"mbbill/undotree",
	lazy = false,
	config = function()
		print("setting up undotree")
		vim.api.nvim_set_keymap(
			"n",
			"<leader>a",
			"<cmd>UndotreeToggle<CR>",
			{ noremap = true, silent = true, desc = "Undo Tree" }
		)
	end,
}
