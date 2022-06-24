local k = require("zmeyer.keymap")
local map = k.map
local nnoremap = k.nnoremap
local vnoremap = k.vnoremap
local inoremap = k.inoremap

-- Set leader to space
map("<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal mode --
-- window navigation
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

nnoremap("<leader>e", ":Lex 30<CR>")

-- resize window
nnoremap("<C-Up>", ":resize -2<CR>")
nnoremap("<C-Right>", ":vertical resize +2<CR>")
nnoremap("<C-Down>", ":resize +2<CR>")
nnoremap("<C-Left>", ":vertical resize -2<CR>")

-- buffers
nnoremap("<S-l>", ":bnext<CR>")
nnoremap("<S-h>", ":bprevious<CR>")

-- Insert mode --
inoremap("jk", "<ESC>")

-- Visual mode --
-- indent
vnoremap("<", "<gv")
vnoremap(">", ">gv")
