return {
	"b0o/incline.nvim",
	config = function()
		local incline = require("incline")
		local helpers = require("incline.helpers")

		incline.setup({
			render = function(props)
				-- Get the full path of the buffer associated with the window
				local buf_path = vim.api.nvim_buf_get_name(props.buf)

				-- If the buffer doesn't have a file path (e.g., it's unnamed),
				-- return nil to hide the incline instance for this window.
				if buf_path == "" then
					return nil
				end

				-- Get the current working directory
				local cwd = vim.fn.getcwd()

				-- Normalize paths to use forward slashes for consistent comparison
				-- and ensure cwd ends with a slash
				buf_path = buf_path:gsub("\\", "/")
				cwd = cwd:gsub("\\", "/")
				if not cwd:find("/$") then
					cwd = cwd .. "/"
				end

				local display_path
				-- Check if the buffer path starts with the CWD
				-- The 'true' argument disables pattern matching for plain string comparison
				if buf_path:find(cwd, 1, true) == 1 then
					-- It's inside the CWD, extract the relative path
					-- string.sub(str, start_index)
					display_path = buf_path:sub(#cwd + 1)
				else
					-- It's outside the CWD. You have options here:
					-- Option 1: Show just the filename
					display_path = vim.fn.fnamemodify(buf_path, ":t")
					-- Option 2: Show the full path (uncomment the line below to use)
					-- display_path = buf_path
				end

				-- Get buffer modified status
				local modified = vim.api.nvim_buf_get_option(props.buf, "modified")
				local modified_indicator = modified and " [+]" or ""

				-- Return the path and modified status
				-- You can add highlight groups as needed
				return {
					{ display_path }, -- Wrap in a table if you want to add highlights later
					{ modified_indicator, guifg = "green" }, -- Example highlight
				}
			end,
			window = {
				margin = {
					horizontal = 0,
					vertical = 0,
				},
			},
		})
		Keymapper("mi", incline.toggle, "Toggle Incline")
	end,
	event = "VeryLazy",
}
