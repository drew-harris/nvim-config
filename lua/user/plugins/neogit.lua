return {
	"NeogitOrg/neogit",
	dependencies = "nvim-lua/plenary.nvim",
	branch = "nightly",
	config = function()
		local opts = {
			disable_commit_confirmation = true,
			integrations = {
				diffview = true,
			},
		}
		require("neogit").setup(opts)

		vim.keymap.set("n", "<leader>G", function()
			require("neogit").open()
		end, { desc = "Big Git" })
	end,
}
