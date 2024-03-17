return {
	"ThePrimeagen/harpoon",
	config = function()
		require("harpoon").setup({
			tabline = true,
			tabline_prefix = "   ",
			tabline_suffix = "   ",
			enter_on_sendcmd = true,
			global_settings = {
				tabline = true,
				tabline_prefix = "   ",
				tabline_suffix = "   ",
				enter_on_sendcmd = true,
			},
		})

		local ui = require("harpoon.ui")
		vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "Add File" })
		vim.keymap.set("n", "<leader>he", ui.toggle_quick_menu, { desc = "Edit" })
		vim.keymap.set("n", "<leader>hn", ui.nav_next, { desc = "Nav Next" })
		vim.keymap.set("n", "<leader>hp", ui.nav_prev, { desc = "Nav Next" })
		vim.keymap.set("n", "<leader>hs", "<cmd>Telescope harpoon marks<cr>", { desc = "Search Marks" })
		vim.keymap.set("n", "<leader>hc", require("harpoon.cmd-ui").toggle_quick_menu, { desc = "Search Marks" })
		local keymap = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		for i = 1, 9 do
			keymap("n", "<leader>" .. i, string.format('<cmd>:lua require("harpoon.ui").nav_file(%d)<cr>', i), opts)
			keymap(
				"n",
				"<leader>h" .. i,
				string.format('<cmd>:lua require("harpoon.tmux").sendCommand("{last}", %d)<cr>', i),
				opts
			)
		end
	end,
}
