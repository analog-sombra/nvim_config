local opts = {noremap = true, silent = true}
local term_opts = {silent = true}

-- Shorten function name
local keymap = vim.keymap.set


-- remap space as leader key

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Modes
-- -> normal_mode = "n"
-- -> insert_mode = "i"
-- -> visual_mode = "v"
-- -> visual_block_mode = "x"
-- -> term_mode = "t"
-- -> command_mode = "c",



-- Normal --
-- Disable arrow key
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)



-- Insert --
-- Disable array key
keymap("i", "<Up>", "<Nop>", opts)
keymap("i", "<Left>", "<Nop>", opts)
keymap("i", "<Right>", "<Nop>", opts)
keymap("i", "<Down>", "<Nop>", opts)

-- remap exist key to exit insert mode
keymap("i", "<C-c>", "<ESC>", opts)

--Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)


-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
