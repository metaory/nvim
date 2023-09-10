local c = require("user.colors").palette()

vim.api.nvim_set_hl(0, "VimwikiLink", { bg = c.black, fg = c.blue, bold = true })

-- local c = require("tokyonight.colors").default
-- local function set_hl(group, opts) vim.api.nvim_set_hl(0, group, opts) end
-- set_hl("VimwikiLink", { bg = c.bg_dark, fg = c.blue2, bold = true })
