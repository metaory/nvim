local M = {}

-- ~/.local/share/nvim/lazy/onedark.nvim/lua/onedark/palette.lua:86

M.set_hl = function(l, o)
  l = type(l) == "table" and l or { l }
  for _, g in pairs(l) do
    vim.api.nvim_set_hl(0, g, o)
  end
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
  -- local cur = vim.api.nvim_eval("g:colors_name")
  local cur = "onedark"
  return cmap[cur] and cmap[cur]() or {}
end

M.setup = function()
  require("onedark").colorscheme()

  -- vim.cmd.colorscheme("oxocarbon-lua")

  local c = M.palette()

  M.set_hl({
    "FloatBorder",
    "TelescopeBorder",
    "TelescopePromptBorder",
    "TelescopePreviewBorder",
    "TelescopeResultsBorder",
    "NoiceConfirmBorder",
  }, { fg = c.purple })

  M.set_hl("Foo", { bg = c.red, fg = c.blue })

  -- M.set_hl("Float", { fg = c.red })

  M.set_hl("Visual", { bg = c.blue, fg = "black" })

  M.set_hl({ "CursorLine", "CursorColumn" }, { bg = c.bg_d })

  -- M.set_hl("LuaLineDiffChange", { fg = c.yellow })
end

M.icons = {
  dap = {
    Stopped = { " ", "DiagnosticWarn", "DapStoppedLine" },
    Breakpoint = " ",
    BreakpointCondition = " ",
    BreakpointRejected = { " ", "DiagnosticError" },
    LogPoint = ".>",
  },
  diagnostics = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
  },
  git = {
    added = " ",
    modified = " ",
    removed = " ",
  },
  kinds = {
    -- Array = " ",
    Array = " ",
    Boolean = " ",
    Class = " ",
    Color = " ",
    Constant = " ",
    Constructor = " ",
    Copilot = " ",
    Enum = " ",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = " ",
    Folder = " ",
    Function = " ",
    Interface = " ",
    Key = " ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Namespace = " ",
    Null = " ",
    Number = " ",
    -- Number = " ",
    Object = " ",
    Operator = " ",
    Package = " ",
    Property = " ",
    Reference = " ",
    -- Snippet = " ",
    Snippet = " ",
    String = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = " ",
    Value = " ",
    Variable = " ",
  },
}

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
