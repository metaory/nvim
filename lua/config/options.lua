-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.clipboard = "unnamed" -- Sync with system clipboard
opt.scrolloff = 0 -- Lines of context
opt.cursorcolumn = true
opt.laststatus = 3
opt.colorcolumn = "80"
opt.foldmethod = "indent"
opt.foldenable = false
