-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.setups")

local XC = require("mxc.palette")
vim.cmd('hi! gitblame guibg=#292e42' .. ' guifg=' .. XC.xfg)

vim.cmd([[hi Normal            guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NormalNC          guibg=NONE ctermbg=NONE]])
vim.cmd([[hi SignColumn        guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NeoTreeNormal     guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NeoTreeNormalNC   guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NeoTreeSignColumn guibg=NONE ctermbg=NONE]])
vim.cmd('hi NotifyBackground   guibg=' .. XC.xbg ..' ctermbg=NONE')
vim.cmd('hi CursorLine         guibg=' .. XC.sk1 ..' ctermbg=NONE')
vim.cmd('hi CursorColumn       guibg=' .. XC.sk1 ..' ctermbg=NONE')

-- vim.cmd([[hi CursorLine   guibg=XC.sk2]])
-- vim.cmd([[hi CursorColumn guibg=XC.sk2]])
-- vim.cmd([[hi CursorLineSign guibg=NONE ctermbg=NONE]])
--
--[[
Highlight group 'NotifyBackground' has no background highlight
Please provide an RGB hex value or highlight group with a background value for 'background_colour' option.
This is the colour that will be used for 100% transparency.
```lua
require("notify").setup({
  background_colour = "#000000",
})
```
Defaulting to #000000
-- ]]
