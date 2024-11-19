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
	local preview = require("supermaven-nvim.completion_preview")
	local message = "Inline AI autocompletion "
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
	config = function()
		require("supermaven-nvim").setup({
			disable_inline_completion = true, -- disables inline completion for use with cmp
			disable_keymaps = true, -- disables built in keymaps for more manual control
			log_level = "off",
		})

		-- Get the Supermaven autocmd group
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

		vim.api.nvim_create_user_command("CopilotMagic", function()
			show_or_accept_completion()
		end, {})
		local opts = { noremap = true, silent = true }
		local keymap = vim.api.nvim_set_keymap
		keymap("i", "<c-l>", "<cmd>CopilotMagic<cr>", opts)
	end,
}
