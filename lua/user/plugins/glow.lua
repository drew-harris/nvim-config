return {
	"ellisonleao/glow.nvim",
	lazy = false,
	config = function()
		vim.keymap.set("n", "<leader>mg", "<cmd>Glow<cr>", { desc = "Glow" })
		require("glow").setup({
			width_ratio = 0.9, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
			height_ratio = 0.9,
		})
	end,
}
