vim.api.nvim_create_user_command("WhatsThis", function()
	print(vim.lsp.buf.definition())
end, { nargs = 0 })
