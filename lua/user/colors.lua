local M = {}

local set_hl = function(t)
  local g, c = unpack(t)
  vim.api.nvim_set_hl(0, g, c)
end

M.palette = function()
  local cmap = {
    ["tokyonight"] = function()
      return require("tokyonight.colors").default
    end,
    ["onedark"] = function()
      return require("onedark.colors")
    end,
  }
  local cur = vim.api.nvim_eval("g:colors_name")
  return cmap[cur] and cmap[cur]() or {}
end

M.setup = function()
  require("onedark").colorscheme()

  local c = M.palette()

  local border = { fg = c.purple }

  vim.tbl_map(set_hl, {
    { "FloatBorder", border },
    { "TelescopeBorder", border },
    { "TelescopePromptBorder", border },
    { "TelescopePreviewBorder", border },
    { "TelescopeResultsBorder", border },
    { "NoiceConfirmBorder", border },
  })
end

return M
-- day moon night storm

-- require("onedark").setup({
--   style = "darker",
-- })
--
-- require("onedark").load()
-- vim.cmd([[ colorscheme onedark ]])

-- require("tokyonight")._load("night")
-- local c = require("tokyonight.colors").default
-- vim.api.nvim_set_hl(0, "Foo", { fg = c.magenta2, bg = c.blue2 })
-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = c.fg_gutter })
-- vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = c.magenta2 })
-- vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#ff0223" })

-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = c.magenta2 })
-- vim.api.nvim_set_hl(0, "NoicePopupmenuBorder", { fg = c.magenta2 })
-- vim.api.nvim_set_hl(0, "NoiceConfirm", { bg = c.green1 })
-- vim.api.nvim_set_hl(0, "NoiceConfirmBorder", { fg = c.magenta2 })
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
-- local c = require("onedark.colors")
-- local c = require("onedark.palette")[vim.g.onedark_config.style]
