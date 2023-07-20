-- bootstrap lazy.nvim, LazyVim and your plugins
-- require("config.commands")
require("config.lazy")
require("config.setups")
require("user.commands")

local XC = require("mxc.palette")

-- colorscheme slate
vim.cmd([[
  hi Normal                      guibg=NONE ctermbg=NONE
  hi NormalNC                    guibg=NONE ctermbg=NONE
  hi SignColumn                  guibg=NONE ctermbg=NONE
  hi NeoTreeNormal               guibg=NONE ctermbg=NONE
  hi NeoTreeNormalNC             guibg=NONE ctermbg=NONE
  hi NeoTreeSignColumn           guibg=NONE ctermbg=NONE
  hi BufferLineSeparator         guibg=NONE ctermbg=NONE
  hi BufferLineIndicatorVisible  guibg=NONE ctermbg=NONE
  " hi BufferLineIndicatorSelected guibg=NONE ctermbg=NONE
]])
vim.cmd("filetype on")
vim.cmd("hi TelescopeBorder             guifg=" .. XC.wbg)
vim.cmd("hi Visual                      guibg=" .. XC.ebg .. " guifg=" .. XC.efg)
vim.cmd("hi NotifyBackground            guibg=" .. XC.xbg .. " ctermbg=NONE")
vim.cmd("hi CursorLine                  guibg=" .. XC.sk1 .. " ctermbg=NONE")
vim.cmd("hi CursorColumn                guibg=" .. XC.sk1 .. " ctermbg=NONE")
vim.cmd("hi CursorLineNr                guifg=" .. XC.wbg)
vim.cmd("hi gitblame                    guibg=" .. XC.sk1 .. " guifg=" .. XC.xfg)
vim.cmd("hi TreesitterContext           guibg=" .. XC.wk3)
vim.cmd("hi TreesitterContextLineNumber guifg=" .. XC.sk6)
vim.cmd("hi FloatBorder                 guifg=" .. XC.wbg)
vim.cmd("hi NeoTreeTitleBar             guibg=" .. XC.wbg)
vim.cmd("hi BufferLineIndicatorSelected guibg=" .. XC.wbg .. " guifg=" .. XC.wfg)

-- require("tokyonight").setup({
--   style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--   light_style = "day", -- The theme is used when the background is set to light
--   transparent = false, -- Enable this to disable setting the background color
--   terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
--   styles = {
--     comments = { italic = true },
--     keywords = { italic = true },
--     functions = {},
--     variables = {},
--     sidebars = "dark", -- style for sidebars, see below
--     floats = "dark", -- style for floating windows
--   },
--   sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
--   day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
--   hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
--   dim_inactive = false, -- dims inactive windows
--   lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
-- })

-- vim.cmd("colorscheme nightly")
-- FloatBorder    xxx guifg=#27a1b9 guibg=#16161e

-- vim.cmd("hi BufferLineIndicatorVisible         guibg=" .. XC.ebg .. " guifg=" .. XC.efg)
-- vim.cmd("hi BufferLineSeparator         guibg=" .. XC.ebg .. " guifg=" .. XC.efg)

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

-- if vim.loader then
--   vim.loader.enable()
--   vim.schedule(function()
--     vim.notify("nvim loader is enabled")
--   end)
-- end
-- require("config.lazy")({
--   debug = false,
--   defaults = {
--     lazy = true,
--     -- cond = false,
--   },
--   performance = {
--     cache = {
--       enabled = true,
--     },
--   },
-- })
--
