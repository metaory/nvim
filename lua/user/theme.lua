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
    ["oxocarbon"] = function()
      -- 1:local oxocarbon = (require("oxocarbon")).oxocarbon
      -- 2:local colors = {color0 = oxocarbon.base02, color1 = oxocarbon.base10, color2 = oxocarbon.base08, color3 = oxocarbon.base00, color6 = oxocarbon.base04, color7 = oxocarbon.base09, color8 = oxocarbon.base14,
      -- color9 = oxocarbon.base12, color10 = oxocarbon.base13}
      -- return require("onedark.colors")
      -- local oxo = (require("oxocarbon")).oxocarbon
      -- local oxo = {}
      -- local oxo = vim.g.oxo or {}
      local oxo = require("oxocarbon").oxocarbon or {}
      --vim.cmd([[ new | r "lua print(require('oxocarbon'))" ]])
      -- P({
      --   holllaaa = 12212,
      --   oxo = oxocarbon,
      --   z = "-----------------------------------------------------------------------------------------------------------------------",
      -- })
      -- return {}
      --[[
{
  base00 = "#221b1c",
  base01 = "#2f2528",
  base02 = "#3f3137",
  base03 = "#533f4e",
  base04 = "#8496bf",
  base05 = "#8ab0cf",
  base06 = "#8ebad4",
  base07 = "#08bdba",
  base08 = "#3ddbd9",
  base09 = "#ea6774",
  base10 = "#ee5396",
  base11 = "#33b1ff",
  base12 = "#ff7eb6",
  base13 = "#42be65",
  base14 = "#be95ff",
  base15 = "#82cfff",
  blend = "#131313",
  none = "NONE"
}
      ]]
      return vim.tbl_deep_extend("force", oxo, {
        base10 = "green",
        base11 = "green",
        base12 = "green",
        base13 = "green",
        bg0 = oxo.base00,
        bg1 = oxo.base01,
        bg2 = oxo.base02,
        bg3 = oxo.base03,
        bg_blue = oxo.base07,
        bg_d = oxo.blend,
        bg_yellow = "Orange",
        black = "#000000",
        blue = "DodgerBlue",
        -- blue =  oxo.base08,
        cyan = oxo.base15,
        dark_cyan = "#1b6a73",
        dark_purple = "#862aa1",
        dark_red = "#992525",
        dark_yellow = "#8f610d",
        diff_add = "#27341c",
        diff_change = "#102b40",
        diff_delete = "#331c1e",
        diff_text = "#1c4a6e",
        fg = "#93a4c3",
        green = "#8bcd5b",
        grey = "#455574",
        light_grey = "#6c7d9c",
        orange = "#dd9046",
        purple = "#c75ae8",
        red = "#f65866",
        yellow = "#efbd5d",
      })
    end,
  }
  -- local cur = vim.api.nvim_eval("g:colors_name")
  local cur = "oxocarbon"
  -- local cur = "onedark"
  -- local palette = cmap[cur] and cmap[cur]() or {}
  local palette = cmap[cur] and cmap[cur]() or {}
  local oxo = vim.tbl_extend("force", palette, {
    dark_grey = "#3d4c67",

    cfg = "#aaaFee",
    cx1 = "#ff1f35",
    cx2 = "#44e778",
    cx3 = "#ff983e",
    cx4 = "#3c74ed",
    cx5 = "#9474f3",
    xxx = "none",
  })
  return oxo
end

-- vim.g.terminal_color_3
-- cx4 = "#2563EB",

M.setup = function(_, opts)
  -- require("onedark").colorscheme()

  -- vim.cmd.colorscheme("oxocarbon-lua")

  -- require("oxocarbon").setup(opts)
  vim.opt.background = "dark" -- set this to dark or light
  vim.cmd.colorscheme("oxocarbon")

  local c = M.palette()
  -- vim.notify("c1: " .. (c.bg3 or "NA"), vim.log.levels.INFO)
  -- vim.g.oxo = c
  -- vim.g["oxo"] = c
  -- vim.g["meta_wtf"] = "foobar"
  -- vim.notify(vim.g['terminal_color_2'], vim.log.levels.INFO)
  -- vim.notify(vim.g['oxo'] or '', vim.log.levels.INFO)
  --   require("user.theme").setup()
  -- vim.cmd("colorscheme oxocarbon")

  -- local c = {}

  M.set_hl({
    "FloatBorder",
    "TelescopeBorder",
    "TelescopePromptBorder",
    "TelescopePreviewBorder",
    "TelescopeResultsBorder",
    "NoiceConfirmBorder",
  }, { fg = c.purple })

  M.set_hl("None", { bg = "none", fg = "none" })

  -- M.set_hl("Float", { fg = c.red })
  M.set_hl("Normal", { fg = "none", bg = c.xxx })

  M.set_hl("Visual", { bg = c.blue, fg = "Black", bold = true })

  M.set_hl({ "CursorLine", "CursorColumn" }, { bg = c.bg_d })

  -- XXX: TODO HIGHLIGHTS
  M.set_hl("MxTodoErrr", { fg = c.red })
  M.set_hl("MxTodoTodo", { fg = c.cx4 })
  M.set_hl("MxTodoHack", { fg = c.purple })
  M.set_hl("MxTodoWarn", { fg = c.cx3 })
  M.set_hl("MxTodoPerf", { fg = c.green })
  M.set_hl("MxTodoHint", { fg = c.blue })
  M.set_hl("MxTodoTest", { fg = c.cx5 })
  M.set_hl("DiagnosticHint", { fg = c.cx5 })
  M.set_hl("DiagnosticUnderlineHint", { fg = c.blue })
  M.set_hl("DiagnosticInfo", { fg = c.cx4 })
  M.set_hl("DiagnosticUnderlineInfo", { fg = c.cfg })
  --  guifg=#d0d0d0

  -- DiagnosticError guifg=#ee5396
  -- DiagnosticWarn guifg=#be95ff
  -- DiagnosticInfo guifg=#78a9ff
  -- DiagnosticHint guifg=#d0d0d0
  -- DiagnosticOk ctermfg=10 guifg=LightGreen
  -- DiagnosticUnderlineError cterm=undercurl gui=undercurl guifg=#ee5396
  -- DiagnosticUnderlineWarn cterm=undercurl gui=undercurl guifg=#be95ff
  -- DiagnosticUnderlineInfo cterm=undercurl gui=undercurl guifg=#d0d0d0
  -- DiagnosticUnderlineHint cterm=undercurl gui=undercurl guifg=#d0d0d0
  -- DiagnosticUnderlineOk cterm=underline gui=underline guisp=LightGreen
  -- error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
  -- todo = { "DiagnosticInfo", "#2563EB" },
  -- hack = { "DiagnosticInfo", "#2563EB" },
  -- warn = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
  -- perf = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
  -- hint = { "DiagnosticHint", "#10B981" },
  -- test = { "Identifier", "#FF00FF" },
  -- default = { "Identifier", "#7C3AED" },
end

M.icons = {
  modified = "●",
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
    Info = " ",
    Hint = " ",
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

--[[
• fg (or foreground): color name or "#RRGGBB", see note.
• bg (or background): color name or "#RRGGBB", see note.
• sp (or special): color name or "#RRGGBB"
• blend: integer between 0 and 100
• bold: boolean
• standout: boolean
• underline: boolean
• undercurl: boolean
• underdouble: boolean
• underdotted: boolean
• underdashed: boolean
• strikethrough: boolean
• italic: boolean
• reverse: boolean
• nocombine: boolean
• link: name of another highlight group to link to, see |:hi-link|.
• default: Don't override existing definition |:hi-default|
• ctermfg: Sets foreground of cterm color |ctermfg|
• ctermbg: Sets background of cterm color |ctermbg|
• cterm: cterm attribute map, like |highlight-args|. If not set, cterm attributes will match those from the attribute map documented above.
]]
