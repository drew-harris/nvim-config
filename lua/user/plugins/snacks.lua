return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		gitbrowse = {},
		bigfile = {},
		notifier = {},
		indent = {
			-- your indent configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			animate = {
				enabled = false,
			},
			scope = {
				enabled = false,
			},
		},
	},
}
