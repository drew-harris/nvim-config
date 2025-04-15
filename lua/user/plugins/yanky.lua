return {
	"gbprod/yanky.nvim",
	config = function()
		require("yanky").setup({
			highlight = {
				on_put = false,
				on_yank = true,
				timer = 90,
			},
			ring = {
				history_length = 100,
				storage = "shada",
				sync_with_numbered_registers = true,
				cancel_event = "update",
				ignore_registers = { "_" },
				update_register_on_cycle = false,
				permanent_wrapper = nil,
			},
			system_clipboard = {
				sync_with_ring = false,
			},
		})

		vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
		vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
		vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
		vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
		vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

		vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
		vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")

		vim.keymap.set("n", "<leader>P", function()
			require("snacks").picker.yanky()
		end)

		vim.cmd("highlight! link YankyPut Visual")
		vim.cmd("highlight! link YankyYanked Visual")
	end,
}
