local options = {
	backup = false, -- creates a backup file
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	-- colorcolumn = "80",
	timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = false, -- highlight the current line
	cursorcolumn = false,
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = true, -- display lines as one long line
	linebreak = true, -- companion to wrap, don't split words
	scrolloff = 4, -- minimal number of screen lines to keep above and below the cursor
	sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`
	guifont = "Hack Nerd Font Mono:16", -- the font used in graphical neovim applications
	autoread = true,
	laststatus = 0, -- Full width single statusline
	undofile = true,
	foldmethod = "expr",
	foldexpr = "v:lua.vim.treesitter.foldexpr()", -- Very strange
	foldlevel = 20,
}

vim.g["code_action_menu_show_details"] = false
vim.g.skip_ts_context_commentstring_module = true
vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
-- vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work

vim.cmd("hi Normal guibg=none ctermbg=none")
vim.cmd("hi LineNr guibg=none ctermbg=none")
vim.cmd("hi Folded guibg=none ctermbg=none")
vim.cmd("hi NonText guibg=none ctermbg=none")
vim.cmd("hi SpecialKey guibg=none ctermbg=none")
vim.cmd("hi VertSplit guibg=none ctermbg=none")
vim.cmd("hi SignColumn guibg=none ctermbg=none")
vim.cmd("hi EndOfBuffer guibg=none ctermbg=none")

vim.g.code_action_menu_show_diff = false

-- Better autoread
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})
