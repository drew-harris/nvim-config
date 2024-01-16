return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("trouble").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})

		vim.keymap.set("n", "<leader>lt", function()
			require("trouble").toggle("workspace_diagnostics")
		end, { desc = "Trouble" })
	end,
}
