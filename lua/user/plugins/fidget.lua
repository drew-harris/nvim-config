return {
	"j-hui/fidget.nvim",
	opts = {
		progress = {
			ignore_done_already = true,
			ignore = { "null-ls" },
		},
		-- options
		notification = {
			window = {
				winblend = 0,
			},
		},
	},
}
