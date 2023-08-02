return {
	"NeogitOrg/neogit",
	dependencies = "nvim-lua/plenary.nvim",
	opts = {
		disable_commit_confirmation = true,
		integrations = {
			diffview = true,
		},
	},
}
