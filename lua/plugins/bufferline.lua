return {
  "akinsho/bufferline.nvim",
  opts = function()
    local bufferline = require("bufferline")
    local c = require("user.colors").palette()
    local hl = { selected = { bg = c.black, fg = c.cyan } }
    return {
      options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
        themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
        -- numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        -- close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
        -- right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
        -- left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
        -- middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
        separator_style = { "", "" }, -- { "", "" },
        show_buffer_close_icons = false,
        always_show_bufferline = false,
        -- separator_style = "none", --| "slope" | "thick" | "thin" | { 'any', 'any' },
        modified_icon = "●",
        close_icon = "✖", -- 
        indicator = {
          -- icon = "⏽",
          -- style = "icon", -- | "underline" | "none",
          style = "none", -- | "underline" | "none",
        },
        diagnostics = "nvim_lsp", -- | "coc",
      },
      highlights = {
        -- separator_selected = hl.selected,
        -- separator_visible = hl.selected,
        -- separator = hl.selected,
        -- indicator_visible = hl.selected,
        buffer_selected = vim.tbl_extend("force", hl.selected, { italic = false }),
        modified_selected = vim.tbl_extend("force", hl.selected, { fg = c.yellow }),

        -- hint_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },
        -- hint_diagnostic_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },

        -- info_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },
        -- info_diagnostic_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },

        -- warning_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },
        -- warning_diagnostic_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },

        -- error_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },
        -- error_diagnostic_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },

        modified = { bold = true, fg = c.grey },
        -- buffer = { fg = c.red, bg = c.blue },
        -- fill = { fg = c.red, bg = c.blue },
        -- background = { fg = c.green, bg = c.yellow },
        -- tab = { fg = c.red, bg = c.blue },
        -- tab_selected = { fg = c.red, bg = c.blue },
        -- tab_separator = { fg = c.red, bg = c.blue },
        -- tab_separator_selected = { fg = c.red, bg = c.blue, sp = c.orange, underline = c.orange },
        -- tab_close = { fg = c.red, bg = c.blue },
        -- close_button = { fg = c.red, bg = c.blue },
        -- close_button_visible = { fg = c.red, bg = c.blue },
        -- close_button_selected = { fg = c.red, bg = c.blue },
        -- buffer_visible = { fg = c.red, bg = c.blue },
        -- buffer_selected = { fg = c.red, bg = c.blue, bold = true, italic = true },
        -- numbers = { fg = c.red, bg = c.blue },
        -- numbers_visible = { fg = c.red, bg = c.blue },
        -- numbers_selected = { fg = c.red, bg = c.blue, bold = true, italic = true },
        -- diagnostic = { fg = c.red, bg = c.blue },
        -- diagnostic_visible = { fg = c.red, bg = c.blue },
        -- diagnostic_selected = { fg = c.red, bg = c.blue, bold = true, italic = true },
        -- hint = { fg = c.red, sp = c.orange, bg = c.blue },
        -- hint_visible = { fg = c.red, bg = c.blue },
        -- hint_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },
        -- hint_diagnostic = { fg = c.red, sp = c.orange, bg = c.blue },
        -- hint_diagnostic_visible = { fg = c.red, bg = c.blue },
        -- hint_diagnostic_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },
        -- info = { fg = c.red, sp = c.orange, bg = c.blue },
        -- info_visible = { fg = c.red, bg = c.blue },
        -- info_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },
        -- info_diagnostic = { fg = c.red, sp = c.orange, bg = c.blue },
        -- info_diagnostic_visible = { fg = c.red, bg = c.blue },
        -- info_diagnostic_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },
        -- warning = { fg = c.red, sp = c.orange, bg = c.blue },
        -- warning_visible = { fg = c.red, bg = c.blue },
        -- warning_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },
        -- warning_diagnostic = { fg = c.red, sp = c.orange, bg = c.blue },
        -- warning_diagnostic_visible = { fg = c.red, bg = c.blue },
        -- warning_diagnostic_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },
        -- error = { fg = c.red, bg = c.blue, sp = c.orange },
        -- error_visible = { fg = c.red, bg = c.blue },
        -- error_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },
        -- error_diagnostic = { fg = c.red, bg = c.blue, sp = c.orange },
        -- error_diagnostic_visible = { fg = c.red, bg = c.blue },
        -- error_diagnostic_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },
        -- modified = { fg = c.red, bg = c.blue },
        -- modified_visible = { fg = c.red, bg = c.blue },
        -- modified_selected = { fg = c.red, bg = c.blue },
        -- duplicate_selected = { fg = c.red, bg = c.blue, italic = true },
        -- duplicate_visible = { fg = c.red, bg = c.blue, italic = true },
        -- duplicate = { fg = c.red, bg = c.blue, italic = true },
        -- separator_selected = { fg = c.red, bg = c.blue },
        -- separator_visible = { fg = c.red, bg = c.blue },
        -- separator = { fg = c.red, bg = c.blue },
        -- indicator_visible = { fg = c.red, bg = c.blue },
        -- pick_selected = { fg = c.red, bg = c.blue, bold = true, italic = true },
        -- pick_visible = { fg = c.red, bg = c.blue, bold = true, italic = true },
        -- pick = { fg = c.red, bg = c.blue, bold = true, italic = true },
        -- offset_separator = { fg = c.red, bg = c.blue },
        -- trunc_marker = { fg = c.red, bg = c.blue },
      },
    }
  end,
}
