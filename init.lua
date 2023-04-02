-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.setups")

local XC = require("mxc.palette")
vim.cmd('hi! gitblame guibg=#292e42' .. ' guifg=' .. XC.xfg)

vim.cmd([[hi Normal          guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NormalNC        guibg=NONE ctermbg=NONE]])
vim.cmd([[hi SignColumn      guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NeoTreeNormal   guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NeoTreeNormalNC guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NeoTreeSignColumn guibg=NONE ctermbg=NONE]])

-- vim.cmd([[hi CursorLine   guibg=XC.sk2]])
-- vim.cmd([[hi CursorColumn guibg=XC.sk2]])
-- vim.cmd([[hi CursorLineSign guibg=NONE ctermbg=NONE]])
