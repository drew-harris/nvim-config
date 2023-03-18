require("refactoring").setup({})
vim.api.nvim_set_keymap(
	"n",
	"<leader>rp",
	":lua require('refactoring').debug.printf({below = false})<CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>rv",
	":lua require('refactoring').debug.print_var({ normal = true })<CR>",
	{ noremap = true }
)

vim.api.nvim_set_keymap("n", "<leader>rc", ":lua require('refactoring').debug.cleanup({})<CR>", { noremap = true })

vim.api.nvim_set_keymap("v", "<leader>rv", ":lua require('refactoring').debug.print_var({})<CR>", { noremap = true })

vim.api.nvim_set_keymap(
	"v",
	"<leader>rr",
	":lua require('refactoring').select_refactor()<CR>",
	{ noremap = true, silent = true, expr = false }
)
