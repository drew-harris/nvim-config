vim.api.nvim_create_user_command("ReplaceSlashWithTick", function()
	-- Get the current visual selection
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	-- Get the selected lines
	local start_line = start_pos[2]
	local end_line = end_pos[2]

	-- Replace backslashes with backticks in the selected range
	vim.cmd(string.format("%d,%ds/\\\\$/`/g", start_line, end_line))
end, { range = true })
