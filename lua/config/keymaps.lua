-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local nor = { noremap = true }

map("n", "<C-h>", "<CMD>lua require('Navigator').left()<CR>", opts)
map("n", "<C-l>", "<CMD>lua require('Navigator').right()<CR>", opts)
map("n", "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opts)
map("n", "<C-k>", "<CMD>lua require('Navigator').up()<CR>", opts)

--[[
]]

map("c", "<C-f>", "<Right>", nor)
map("c", "<C-a>", "<Home>", nor)
map("c", "<C-b>", "<Left>", nor)
map("c", "<M-b>", "<C-b>", nor)
map("c", "<M-k>", "<Up>", nor)
map("c", "<M-j>", "<Down>", nor)

map("n", "<M-J>", "<C-w>-", nor)
map("n", "<M-K>", "<C-w>+", nor)
map("n", "<M-H>", "<C-w><", nor)
map("n", "<M-L>", "<C-w>>", nor)

map("n", "<M-w>", "<cmd>BufferLineCloseLeft<cr>", nor)
map("n", "<M-e>", "<cmd>BufferLineCloseRight<cr>", nor)

map("n", "<C-c>", ":normal gcc<CR>", opts)
map("i", "jk", "<ESC>", opts)

map("n", "<leader>h", ":noh<cr>", opts)

map("i", "<M-p>", [[<ESC>"+p]], opts)
map("i", "<M-e>", [[g$$]], opts)
map("n", "<M-Y>", [[gg"+yG]], opts)
map("n", "<M-y>", [["+y$]], opts)
map("v", "<M-y>", [["+y]], opts)
map("n", "<M-p>", [["+p]], opts)
map("n", "Y", [[y$]], opts)

map("", "<M-f>", ":Telescope find_files<CR>", opts)
map("", "<M-o>", ":Telescope oldfiles<CR>", opts)
map("", "<M-r>", "<cmd>TroubleToggle<CR>", opts)
-- map("", "<M-r>", ":Telescope frecency<CR>", opts)
map("", "<M-m>", ":Telescope keymaps<CR>", opts)
map("n", "<M-b>", ":Telescope buffers<CR>", opts)
map("n", "<M-c>", ":Telescope commands<CR>", opts)
map("n", "<M-d>", "<ESC>:", nor)

map("n", "<M-k>", "<CMD>BufferLineCycleNext<CR>", opts)
map("n", "<M-j>", "<CMD>BufferLineCyclePrev<CR>", opts)

map("n", "<M-s>", ":w<CR>", opts)
map("n", "<M-q>", ":q<CR>", opts)
map("n", "<M-Q>", ":qall!<CR>", opts)
