local pending_oneshot = false

local function clear_oneshot()
	if pending_oneshot then
		local suggestion = require("supermaven-nvim.completion_preview")
		local preview = require("supermaven-nvim.completion_preview")
		pending_oneshot = false
		suggestion.disable_inline_completion = true
		preview:dispose_inlay()
	end
end

local function show_or_accept_completion()
	local suggestion = require("supermaven-nvim.completion_preview")
	local binary = require("supermaven-nvim.binary.binary_handler")
	if (not pending_oneshot) and suggestion.disable_inline_completion then
		suggestion.disable_inline_completion = false
		local buffer = vim.api.nvim_get_current_buf()
		local file_name = vim.api.nvim_buf_get_name(buffer)
		binary:on_update(buffer, file_name, "cursor")
		binary:poll_once()
		pending_oneshot = true
	else
		suggestion.on_accept_suggestion()
		clear_oneshot()
	end
end

return {
	"supermaven-inc/supermaven-nvim",
	enabled = true,
	config = function()
		require("supermaven-nvim").setup({
			disable_inline_completion = true,
			disable_keymaps = true,
			log_level = "off",
		})

		local augroup = vim.api.nvim_create_augroup("supermaven", { clear = false })

		vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
			group = augroup,
			callback = clear_oneshot,
		})

		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			group = augroup,
			callback = clear_oneshot,
		})

		vim.api.nvim_create_autocmd({ "InsertLeave" }, {
			group = augroup,
			callback = clear_oneshot,
		})

		-- Direct function call in the keymap
		vim.keymap.set("i", "<C-l>", function()
			show_or_accept_completion()
		end, { silent = true })
	end,
}
