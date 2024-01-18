return {
	"numToStr/Comment.nvim",

	config = function()
		local comment = require("Comment")
		---@diagnostic disable-next-line: missing-fields
		comment.setup({
			toggler = {
				---Line-comment toggle keymap
				line = "<leader>cc",
				---Block-comment toggle keymap
				block = "<leader>cb",
			},
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
	end,
}
