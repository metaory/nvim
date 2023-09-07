-- day moon night storm
require("tokyonight")._load("night")

local c = require("tokyonight.colors").default
vim.api.nvim_set_hl(0, "Foo", { fg = c.magenta2, bg = c.blue2 })
-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = c.magenta2 })
-- vim.api.nvim_set_hl(0, "NoicePopupmenuBorder", { fg = c.magenta2 })
-- vim.api.nvim_set_hl(0, "NoiceConfirm", { bg = c.green1 })
-- vim.api.nvim_set_hl(0, "NoiceConfirmBorder", { fg = c.magenta2 })
-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = c.fg_gutter })
-- vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = c.fg_gutter })
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

-- vim.api.nvim_set_hl(0, "Normal", { bg = "red", fg = "blue", bold = true })
-- vim.api.nvim_set_hl(0, "Normal", { bg = c.bg_dark, fg = c.blue2, bold = true })

-- vim.cmd([[ hi VimwikiLink guibg=#fff000 guifg=#0ff000 ]])
-- VimwikiLink guibg=#fff000 guifg=#0ff000

-- FloatBorder = { fg = c.border_highlight, bg = c.bg_float },
--

--[[
NoiceVirtualText xxx cterm= gui= links to DiagnosticVirtualTextInfo
]]
