local opts = { noremap = true, silent = true }

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

keymap("n", "<C-h>", "<cmd>bprevious<cr>", opts)
keymap("n", "<C-l>", "<cmd>bnext<cr>", opts)

keymap("n", "<C-x>", "<cmd>Bdelete!<CR>", opts)

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
-- keymap("n", "n", "nzzzv", opts)
-- keymap("n", "N", "Nzzzv", opts)

keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Easy fold
keymap("n", "zf", "za", opts)

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
keymap("n", "<leader>8", '<cmd>:lua require("harpoon.ui").nav_file(8)<cr>', opts)
keymap("n", "<leader>9", '<cmd>:lua require("harpoon.ui").nav_file(9)<cr>', opts)
