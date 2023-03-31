-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.setups")

local XC = require("mxc.palette")
vim.cmd('hi! gitblame guibg=#292e42' .. ' guifg=' .. XC.xfg)

vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[hi SignColumn guibg=NONE ctermbg=NONE]])
-- vim.cmd([[hi CursorLineSign guibg=NONE ctermbg=NONE]])
