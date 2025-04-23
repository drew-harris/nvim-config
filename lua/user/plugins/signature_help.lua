return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	enabled = false,
	config = function()
		require("lsp_signature").setup({
			close_timeout = 0,
			doc_lines = 0,
			toggle_key = "<C-s>",
			hint_prefix = " ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
			hint_enable = false,
			toggle_key_flip_floatwin_setting = true, -- true: toggle floating_windows: true|false setting after toggle key pressed
		})

		-- local keyopts = { noremap = true, silent = true }
		-- vim.keymap.set("i", "<C-s>", function()
		-- 	print("working")
		-- 	require("lsp_signature").toggle_float_win()
		-- end, keyopts)
	end,
}
