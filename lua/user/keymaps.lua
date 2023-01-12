local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<c-l>", ":bnext<cr>", opts)
keymap("n", "<C-h>", ":bprevious<CR>", opts)

keymap("n", "<C-x>", "<cmd>Bdelete!<CR>", opts)

keymap("i", "<c-l>", "<cmd>bnext<cr>", opts)
keymap("i", "<C-h>", "<cmd>bprevious<CR>", opts)
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Harpoon --
keymap("n", "<leader>1", '<cmd>:lua require("harpoon.ui").nav_file(1)<cr>', opts)
keymap("n", "<leader>2", '<cmd>:lua require("harpoon.ui").nav_file(2)<cr>', opts)
keymap("n", "<leader>3", '<cmd>:lua require("harpoon.ui").nav_file(3)<cr>', opts)
keymap("n", "<leader>4", '<cmd>:lua require("harpoon.ui").nav_file(4)<cr>', opts)
keymap("n", "<leader>5", '<cmd>:lua require("harpoon.ui").nav_file(5)<cr>', opts)
keymap("n", "<leader>6", '<cmd>:lua require("harpoon.ui").nav_file(6)<cr>', opts)
keymap("n", "<leader>7", '<cmd>:lua require("harpoon.ui").nav_file(7)<cr>', opts)

-- Terminal --
-- Better terminal navigation
--keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
--keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
--keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
--keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
