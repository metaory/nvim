-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<C-c>", ":normal gcc<CR>", opts)

map("i", "<M-p>", [[<ESC>"+p]], opts)
map("i", "<M-e>", [[g$$]], opts)
map("n", "<M-Y>", [[gg"+yG]], opts)
map("n", "<M-y>", [["+y$]], opts)
map("v", "<M-y>", [["+y]], opts)
map("n", "<M-p>", [["+p]], opts)
map("n", "Y", [[y$]], opts)

map("", "<M-f>", ":Telescope find_files<CR>", opts)
map("", "<M-o>", ":Telescope oldfiles<CR>", opts)
map("", "<M-r>", ":Telescope frecency<CR>", opts)
map("", "<M-m>", ":Telescope keymaps<CR>", opts)
map("n", "<M-b>", ":Telescope buffers<CR>", opts)
map("n", "<M-c>", ":Telescope commands<CR>", opts)

map("n", "<M-k>", "<CMD>BufferLineCycleNext<CR>", opts)
map("n", "<M-j>", "<CMD>BufferLineCyclePrev<CR>", opts)

map("n", "<M-s>", ":w<CR>", opts)
map("n", "<M-q>", ":q<CR>", opts)
map("n", "<M-Q>", ":qall!<CR>", opts)
