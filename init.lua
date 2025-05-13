local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("nvim%-cmp is not available") then
		return
	end
	notify(msg, ...)
end

vim.cmd([[
  augroup diffcolors
    autocmd!
    autocmd Colorscheme * call s:SetDiffHighlights()
  augroup END
  function! s:SetDiffHighlights()
    highlight DiffAdd gui=bold guifg=none guibg=#2e4b2e
    highlight DiffDelete gui=bold guifg=none guibg=#4c1e15
    highlight DiffChange gui=bold guifg=none guibg=#45565c
    highlight DiffText gui=bold guifg=none guibg=#996d74
  endfunction
]])

require("user.utils.logging")
require("user.keymapper")
require("user.options")
require("user.keymaps")
require("user.movement")
require("user.plugins")
require("user.colorscheme")
require("avante_lib").load()
require("user.lsp")
require("user.autopairs")
require("user.whichkey")
require("user.autocommands")
require("user.nushell").setup()
-- require("user.copilot")

vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
vim.cmd("highlight! link HarpoonActive IncSearch")
vim.cmd("highlight! link HarpoonNumberActive IncSearch")
vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")

vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")

-- -- Smart delete (dont yank empty stuff)
-- local function smart_delete(key)
-- 	local l = vim.api.nvim_win_get_cursor(0)[1] -- Get the current cursor line number
-- 	local line = vim.api.nvim_buf_get_lines(0, l - 1, l, true)[1] -- Get the content of the current line
-- 	return (line:match("^%s*$") and '"_' or "") .. key -- If the line is empty or contains only whitespace, use the black hole register
-- end
--
-- local keys = { "d", "dd", "x", "c", "s", "C", "S", "X" } -- Define a list of keys to apply the smart delete functionality
--
-- -- Set keymaps for both normal and visual modes
-- for _, key in pairs(keys) do
-- 	vim.keymap.set({ "n", "v" }, key, function()
-- 		return smart_delete(key)
-- 	end, { noremap = true, expr = true, desc = "Smart delete" })
-- end
vim.cmd("highlight! link YankyPut Visual")
vim.cmd("highlight! link YankyYanked Visual")
