local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("nvim%-cmp is not available") then
		return
	end
	notify(msg, ...)
end
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
require("user.indentline")
require("user.whichkey")
require("user.autocommands")
require("user.nushell").setup()
-- require("user.copilot")
-- vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { link = "Substitute" })

vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
vim.cmd("highlight! AvanteInlineHint guibg=NONE guifg=#363636")
vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")
vim.cmd("highlight! SatelliteBackground guibg=NONE guifg=NONE")
vim.cmd("highlight! SatelliteBackground guibg=NONE guifg=NONE")
vim.cmd("highlight! SatelliteBar guibg=#1F2023 guifg=#1F2023")
vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")
