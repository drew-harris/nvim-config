-- Copliot setup
-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

require("copilot").setup({
	suggestion = { enabled = true, auto_trigger = false, keymap = {
		next = "<C-c>",
	} },
	panel = { enabled = true },
})

local keymap = vim.api.nvim_set_keymap
local suggestion = require("copilot.suggestion")

local cmp = require("cmp")

vim.api.nvim_create_user_command("CopilotMagic", function()
	cmp.close()
	if suggestion.is_visible() then
		suggestion.accept()
	else
		suggestion.next()
	end
end, {})

local opts = { noremap = true, silent = true }
keymap("i", "<c-c>", "<cmd>CopilotMagic<cr>", opts)
