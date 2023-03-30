-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.setups")

vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi SignColumn guibg=NONE ctermbg=NONE]])
-- vim.cmd([[hi CursorLineSign guibg=NONE ctermbg=NONE]])
