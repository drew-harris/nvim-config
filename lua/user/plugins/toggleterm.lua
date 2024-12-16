return {
	"akinsho/toggleterm.nvim",
	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			size = 15,
			open_mapping = [[<c-k>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
			end,
		})

		function _G.set_terminal_keymaps()
			local opts = { noremap = true, silent = true }
			vim.api.nvim_buf_set_keymap(0, "t", "<C-\\>", [[<C-\><C-n>]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-w>", [[<C-\><C-n>]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-w>h", [[<C-\><C-n><C-W>h]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-w>j", [[<C-\><C-n><C-W>j]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-w>k", [[<C-\><C-n><C-W>k]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-w>l", [[<C-\><C-n><C-W>l]], opts)
			vim.api.nvim_buf_set_keymap(0, "n", "<C-w>", [[i<C-w>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		vim.cmd("autocmd! BufEnter term://* startinsert")

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end

		vim.keymap.set("n", "<leader>gg", _LAZYGIT_TOGGLE, { desc = "LazyGit" })

		vim.api.nvim_create_user_command("Bterm", function()
			-- Split window horizontally with height of 15 lines
			vim.cmd.vnew()
			-- Open terminal in the new split
			vim.cmd.terminal()
			-- Enter insert mode
			vim.cmd.wincmd("J")
			vim.api.nvim_win_set_height(0, 15)
		end, {})

		vim.keymap.set("n", "<leader>tb", "<cmd>:Bterm<cr>", { desc = "Open bottom terminal" })
	end,
}
