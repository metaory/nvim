local M = {
  "folke/tokyonight.nvim",
  priority = 1000,
  lazy = false,
}

M.colors = function()
  local colors_ok, colors = pcall(require, "tokyonight.colors")
  if not colors_ok then
    return
  end
  return colors.setup({})
end

M.util = function()
  local util_ok, util = pcall(require, "tokyonight.util")
  if not util_ok then
    return
  end

  return util
end

M.config = function()
  local status_ok, tokyonight = pcall(require, "tokyonight")
  if not status_ok then
    return
  end

  tokyonight.setup({
    style = "storm",
    transparent = true,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      sidebars = "transparent",
      floats = "transparent",
    },
    dim_inactive = false,
    lualine_bold = false,
    on_highlights = function(hl, c)
      local util = require("tokyonight.util")
      local darker_bg = util.darken(c.bg_popup, 2.5)
      local darker_orange = util.darken(c.orange, 0.9)
      hl.LineNr.fg = c.comment
      hl.LineNrAbove.fg = c.comment
      hl.LineNrBelow.fg = c.comment
      hl.CursorLine = {
        bg = darker_bg,
      }
      hl.CursorLineNr = {
        fg = c.fg,
        bold = true,
      }
      hl.WhichKeyGroup = {
        fg = c.green,
        bold = true,
      }
      hl.BufferVisibleMod = { fg = c.yellow, bg = c.bg }
      hl.WinSeparator = {
        fg = util.darken(c.border_highlight, 0.3),
      }
      hl.NvimTreeSpecialFile = {
        fg = c.yellow,
        bold = true,
      }
      hl.TermCursor = { link = "Cursor" }
      hl.EndOfBuffer = { bg = "NONE", fg = util.darken(c.border_highlight, 0.3) }

      hl.PmenuMatchSel = { fg = darker_orange }
      hl.PmenuMatch = { fg = darker_orange, bg = c.bg_highlight }

      hl.SnacksDashboardTerminal = { fg = c.fg_gutter }
      hl.SnacksDashboardDesc = { fg = c.teal }
      hl.SnacksDashboardIcon = { fg = c.blue1 }

      hl.BlinkCmpMenu = { bg = "#010101" }
      hl.BlinkCmpMenuBorder = { fg = c.fg_gutter, bg = "#010101" }
      hl.BlinkCmpDoc = { bg = "#010101" }
      hl.BlinkCmpDocBorder = { fg = c.fg_gutter, bg = "#010101" }
      hl.BlinkCmpLabelMatch = { fg = darker_orange, bg = c.none }
      hl.BlinkCmpMenuSelection = { bg = c.bg_highlight }
      hl.BlinkCmpScrollBarThumb = { bg = darker_bg }
      hl.BlinkCmpSource = { bg = c.none, fg = c.comment }
      hl.CmpDocumentation = { bg = darker_bg }
      hl.CmpDocumentationBorder = { bg = darker_bg }
      hl.TelescopeMatching = { fg = c.warning, bold = true }
      hl.TreesitterContext = { bg = c.bg_highlight }
      hl.NvimTreeFolderIcon = { fg = c.blue }
      hl.FloatBorder = { fg = c.blue7, bg = "NONE" }
      hl.CmpBorder = { fg = c.fg_gutter, bg = "NONE" }
      hl.CmpDocBorder = { fg = c.fg_gutter, bg = "NONE" }
      hl.TelescopeBorder = { fg = c.fg_gutter, bg = "NONE" }
      hl.TelescopePromptBorder = { fg = c.fg_gutter, bg = "NONE" }
      hl.TelescopePromptTitle = { fg = c.blue, bg = "NONE" }
      hl.TelescopeResultsTitle = { fg = c.teal, bg = "NONE" }
      hl.TelescopePreviewTitle = { fg = c.fg, bg = "NONE" }
      hl.TelescopePromptPrefix = { fg = c.blue, bg = "NONE" }
      hl.TelescopeResultsDiffAdd = { fg = c.green, bg = "NONE" }
      hl.TelescopeResultsDiffChange = { fg = c.yellow, bg = "NONE" }
      hl.TelescopeResultsDiffDelete = { fg = c.red, bg = "NONE" }
      hl.TelescopeMatching = { fg = c.orange, bold = true, bg = "NONE" }
      hl.FoldColumn = { fg = "#141B23" }
      hl.DevIconFish = { fg = c.green }
      hl.GHThreadSep = { bg = c.bg_float }
      hl.DiagnosticUnnecessary = { fg = util.lighten(c.comment, 0.7), undercurl = true }
      hl.Directory = { fg = c.blue }
      hl.GitSignsAddNr = { fg = c.blue }
      hl.GitSignsChange = { fg = "#152339" }
      hl.GitSignsAddLn = { fg = c.blue }
      hl.GitSignsAdd = { fg = c.blue }
      hl.GitSignsDelete = { fg = c.orange }
      hl.MatchParen = { bg = c.fg_gutter }
      hl.WinBar = { bg = "NONE" }
      hl.WinBarNC = { bg = "NONE" }
      hl.LspInlayHint = { bg = "NONE", fg = c.dark3 }
      hl.WhichKeyIcon = { bg = "NONE", fg = c.green }
      hl.WhichKeyIconRed = { bg = "NONE", fg = c.fg_dark }
      hl.WhichKeyIconBlue = { bg = "NONE", fg = c.fg_dark }
      hl.WhichKeyIconCyan = { bg = "NONE", fg = c.fg_dark }
      hl.WhichKeyIconGrey = { bg = "NONE", fg = c.fg_dark }
      hl.WhichKeyIconAzure = { bg = "NONE", fg = c.fg_dark }
      hl.WhichKeyIconGreen = { bg = "NONE", fg = c.fg_dark }
      hl.WhichKeyIconOrange = { bg = "NONE", fg = c.fg_dark }
      hl.WhichKeyIconPurple = { bg = "NONE", fg = c.fg_dark }
      hl.WhichKeyIconYellow = { bg = "NONE", fg = c.fg_dark }
      hl.WhichKeyGroup = { bg = "NONE", fg = c.purple }
      hl.WhichKeyDesc = { bg = "NONE", fg = c.blue2 }
      hl.WhichKey = { bg = "NONE", fg = c.orange }
      hl["@markup.list"] = { link = "@markup.strong" }
      hl["@markup.list.markdown"] = { link = "@markup.strong" }
      hl["@markup.heading.2"] = { fg = c.blue5, bold = true }
      hl["@markup.heading.2.markdown"] = { fg = c.blue5, bold = true }
      hl["@markup.heading.3"] = { link = "@markup.strong" }
      hl["@markup.heading.3.markdown"] = { link = "@markup.strong" }
      hl["@markup.heading.4"] = { link = "@markup.strong" }
      hl["@markup.heading.4.markdown"] = { link = "@markup.strong" }
      hl.DiffText = { bg = "#234E88" }
      hl.DiffChange = { bg = "#152339" }
      hl.DiffDelete = { bg = "#2C1F1C", fg = c.fg_gutter }
      hl.DiffAdd = { bg = "#14233A" }
      hl.DiffviewDiffDeleteDim = { bg = "#2D1F1B" }
      hl.StatusLine = { bg = c.none }
      hl["GrugFarResultsMatch"] = { bg = "#234E88" }
      hl["GrugFarResultsMatchRemoved"] = { bg = "#724022", fg = c.orange }
      hl["GrugFarResultsMatchAdded"] = { bg = "#234E88", fg = c.blue }
      hl["GrugFarResultsChangeIndicator"] = { fg = "#234E88" }
      hl["GrugFarResultsRemoveIndicator"] = { fg = c.orange }
      hl["GrugFarResultsAddIndicator"] = { fg = c.blue }
      hl["FFFGitStaged"] = { fg = c.blue }
      hl["FFFGitDeleted"] = { fg = c.orange }
      hl["FFFGitModified"] = { fg = "#152339" }
      hl["FFFGitSignDeleted"] = { fg = c.orange }

      -- ~/.local/share/nvim/lazy/avante.nvim/lua/avante/highlights.lua
      -- hl.AvanteSubtitle = { fg = c.magenta, bg = c.blue, bold = true }
      -- hl.AvanteReversedSubtitle = { fg = c.magenta, bg = "NONE" }
      -- hl.AvanteTitle = { fg = c.magenta }
      -- hl.AvanteReversedTitle = { fg = c.magenta }
      -- hl.AvanteSubtitle = { fg = c.magenta }
      -- hl.AvanteReversedSubtitle = { fg = c.magenta }
      -- hl.AvanteThirdTitle = { fg = c.magenta }
      -- hl.AvanteReversedThirdTitle = { fg = c.magenta }
      -- hl.AvanteSuggestion = { fg = c.magenta }
      -- hl.AvanteAnnotation = { fg = c.magenta }
      -- hl.AvantePopupHint = { fg = c.magenta }
      -- hl.AvanteInlineHint = { fg = c.magenta }
      -- hl.AvanteToBeDeleted = { fg = c.magenta }
      -- hl.AvanteToBeDeletedWOStrikethrough = { fg = c.magenta }
      -- hl.AvanteConfirmTitle = { fg = c.magenta }
      -- hl.AvanteButtonDefault = { fg = c.magenta }
      -- hl.AvanteButtonDefaultHover = { fg = c.magenta }
      -- hl.AvanteButtonPrimary = { fg = c.magenta }
      -- hl.AvanteButtonPrimaryHover = { fg = c.magenta }
      -- hl.AvanteButtonDanger = { fg = c.magenta }
      -- hl.AvanteButtonDangerHover = { fg = c.magenta }
      -- hl.AvantePromptInput = { fg = c.magenta }
      -- hl.AvantePromptInputBorder = { fg = c.magenta }
      -- hl.AvanteSidebarWinSeparator = { fg = c.magenta }
      -- hl.AvanteSidebarWinHorizontalSeparator = { fg = c.magenta }
      -- hl.AvanteSidebarNormal = { fg = c.magenta }
      -- hl.AvanteCommentFg = { fg = c.magenta }
      -- hl.AvanteReversedNormal = { fg = c.magenta }

      -- hl.TITLE                                   = { name = "AvanteTitle",                         fg                              = "#1e222a", bg            = "#98c379" },
      -- hl.REVERSED_TITLE                          = { name = "AvanteReversedTitle",                 fg                      = "#98c379",         bg_link       = "NormalFloat" },
      -- hl.SUBTITLE                                = { name = "AvanteSubtitle",                      fg                           = "#1e222a",    bg            = "#56b6c2" },
      -- hl.REVERSED_SUBTITLE                       = { name = "AvanteReversedSubtitle",              fg                   = "#56b6c2",            bg_link       = "NormalFloat" },
      -- hl.THIRD_TITLE                             = { name = "AvanteThirdTitle",                    fg                         = "#ABB2BF",      bg            = "#353B45" },
      -- hl.REVERSED_THIRD_TITLE                    = { name = "AvanteReversedThirdTitle",            fg                 = "#353B45",              bg_link       = "NormalFloat" },
      -- hl.SUGGESTION                              = { name = "AvanteSuggestion",                    link                       = "Comment" },
      -- hl.ANNOTATION                              = { name = "AvanteAnnotation",                    link                       = "Comment" },
      -- hl.POPUP_HINT                              = { name = "AvantePopupHint",                     link                        = "NormalFloat" },
      -- hl.INLINE_HINT                             = { name = "AvanteInlineHint",                    link                       = "Keyword" },
      -- hl.TO_BE_DELETED                           = { name = "AvanteToBeDeleted",                   bg                        = "#ffcccc",       strikethrough = true },
      -- hl.TO_BE_DELETED_WITHOUT_STRIKETHROUGH     = { name = "AvanteToBeDeletedWOStrikethrough",    bg         = "#562C30" },
      -- hl.CONFIRM_TITLE                           = { name = "AvanteConfirmTitle",                  fg                       = "#1e222a",        bg            = "#e06c75" },
      -- hl.BUTTON_DEFAULT                          = { name = "AvanteButtonDefault",                 fg                      = "#1e222a",         bg            = "#ABB2BF" },
      -- hl.BUTTON_DEFAULT_HOVER                    = { name = "AvanteButtonDefaultHover",            fg                 = "#1e222a",              bg            = "#a9cf8a" },
      -- hl.BUTTON_PRIMARY                          = { name = "AvanteButtonPrimary",                 fg                      = "#1e222a",         bg            = "#ABB2BF" },
      -- hl.BUTTON_PRIMARY_HOVER                    = { name = "AvanteButtonPrimaryHover",            fg                 = "#1e222a",              bg            = "#56b6c2" },
      -- hl.BUTTON_DANGER                           = { name = "AvanteButtonDanger",                  fg                       = "#1e222a",        bg            = "#ABB2BF" },
      -- hl.BUTTON_DANGER_HOVER                     = { name = "AvanteButtonDangerHover",             fg                  = "#1e222a",             bg            = "#e06c75" },
      -- hl.AVANTE_PROMPT_INPUT                     = { name = "AvantePromptInput"                        },
      -- hl.AVANTE_PROMPT_INPUT_BORDER              = { name = "AvantePromptInputBorder",             link                = "NormalFloat" },
      -- hl.AVANTE_SIDEBAR_WIN_SEPARATOR            = { name = "AvanteSidebarWinSeparator",           fg_link_bg        = "NormalFloat",           bg_link   = "NormalFloat" },
      -- hl.AVANTE_SIDEBAR_WIN_HORIZONTAL_SEPARATOR = { name = "AvanteSidebarWinHorizontalSeparator", fg_link = "WinSeparator",                    bg_link  = "NormalFloat" },
      -- hl.AVANTE_SIDEBAR_NORMAL                   = { name = "AvanteSidebarNormal",                 link                    = "NormalFloat" },
      -- hl.AVANTE_COMMENT_FG                       = { name = "AvanteCommentFg",                     fg_link                     = "Comment" },
      -- hl.AVANTE_REVERSED_NORMAL                  = { name = "AvanteReversedNormal",                fg_link_bg = "Normal",                       bg_link_fg = "Normal" },

      -- Winbar styling.
      hl["WinBar"] = { fg = c.comment, bg = "NONE" }
      hl["WinBarNC"] = { fg = c.fg, bg = "NONE" }
      hl["WinBarDir"] = { fg = c.fg, bg = "NONE", bold = true }
      hl["WinBarSeparator"] = { fg = c.bg, bg = "NONE" }
      hl["WinbarFilename"] = { fg = c.fg, bg = "NONE", bold = true }
    end,
  })

  tokyonight.load()
end

return M
