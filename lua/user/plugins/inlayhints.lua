return {
	"lvimuser/lsp-inlayhints.nvim",
	config = function()
		require("lsp-inlayhints").setup({
			inlay_hints = {
				highlight = "Comment",
				parameter_hints = {
					prefix = "             <- ",
				},
				type_hints = {
					prefix = "              <- ",
				},
			},
		})
	end,
}
