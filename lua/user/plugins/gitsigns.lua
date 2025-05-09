return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({

			-- signs = {
			-- 	add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
			-- 	change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
			-- 	-- delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
			-- 	-- topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
			-- 	delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
			-- 	topdelete = {
			-- 		hl = "GitSignsDelete",
			-- 		text = " ",
			-- 		numhl = "GitSignsDeleteNr",
			-- 		linehl = "GitSignsDeleteLn",
			-- 	},
			-- 	changedelete = {
			-- 		hl = "GitSignsChange",
			-- 		text = "▎",
			-- 		numhl = "GitSignsChangeNr",
			-- 		linehl = "GitSignsChangeLn",
			-- 	},
			-- },
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			attach_to_untracked = true,
			current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = false,
				virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
				delay = 8000,
				ignore_whitespace = false,
			},
			-- current_line_blame_formatter_opts = {
			-- 	relative_time = true,
			-- },
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000,
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			-- yadm = {
			-- 	enable = false,
			-- },
		})
		Keymapper("gB", function()
			require("gitsigns").change_base("main", true)
		end, "Set ")
	end,
}
