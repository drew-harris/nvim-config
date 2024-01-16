return {
	"kevinhwang91/nvim-bqf",
	ft = "qf",
	opts = {
		auto_enable = true,
		auto_resize_height = true, -- highly recommended enable
		preview = {
			winblend = 0,
		},
	},
	dependencies = { "junegunn/fzf" },
}
