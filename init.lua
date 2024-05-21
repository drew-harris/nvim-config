require("user.keymapper")
require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme")
require("user.lsp")
require("user.autopairs")
require("user.indentline")
require("user.whichkey")
require("user.autocommands")
require("user.copilot")
-- vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { link = "Substitute" })

vim.cmd("highlight! HarpoonInactive guibg=NONE guifg=#63698c")
vim.cmd("highlight! HarpoonActive guibg=NONE guifg=white")
vim.cmd("highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7")
vim.cmd("highlight! TabLineFill guibg=NONE guifg=white")
