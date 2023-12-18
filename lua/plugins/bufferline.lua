local H = require("util.helper")

return {
  "willothy/nvim-cokeline",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    show_if_buffers_are_at_least = 1,
    history = { enabled = false, size = 2 },
  },
  config = function(_, opts)
    local theme = require("user.theme")
    local c = theme.palette()

    local hl = function(buf)
      return buf.is_focused and c.cx4 or c.bg3
    end

    local comp = function(l)
      local cond, icon, color = unpack(l)
      return {
        text = function(buf)
          if icon == "devicon" then
            return buf.devicon.icon
          end
          if type(buf[cond]) == "boolean" then
            return buf[cond] and theme.icons[icon] or ""
          end
          return (buf[cond] or "") .. " "
        end,
        bold = function(buf)
          return buf.is_focused
        end,
        bg = hl,
        fg = function(buf)
          return buf.is_focused and "white"
            or icon == "devicon" and buf.devicon.color
            or c[icon]
            or c[color]
            or c.purple
        end,
      }
    end

    local diag = function(l)
      local type, icon, color = unpack(l)
      return {
        text = function(buf)
          return buf.diagnostics[type] > 0 and theme.icons.diagnostics[icon] or ""
        end,
        bg = hl,
        fg = function(buf)
          return buf.is_focused and "white" or c[color]
        end,
      }
    end

    require("cokeline").setup(vim.tbl_deep_extend("force", opts, {
      -- default_hl = {
      --   fg = function(buf)
      --     return buf.is_focused and "yellow" or "red"
      --   end,
      --   bg = c.red,
      --   sp = c.blue,
      -- },
      -- TODO:
      fill_hl = "None",
      sidebar = {
        filetype = { "neo-tree" },
        components = {
          { text = "", fg = hl, bg = "none" },
          {
            text = function(buf)
              return buf.filetype
            end,
            fg = "white",
            bg = hl,
            bold = true,
          },
          -- comp({ "filename", "blue" }),
          { text = "", fg = hl, bg = "none" },
        },
      },
      components = {
        { text = "  ", bg = "none" },
        { text = "", fg = hl, bg = "none" },
        comp({ "is_focused", "devicon" }),
        comp({ "filename", "light_grey" }),
        diag({ "errors", "Error", "red" }),
        diag({ "warnings", "Warn", "yellow" }),
        diag({ "infos", "Info", "blue" }),
        diag({ "hints", "Hint", "cyan" }),
        comp({ "is_modified", "modified", "yellow" }),
        { text = "", fg = hl, bg = "none" },
      },
    }))
  end,
}

-- {
--   "akinsho/bufferline.nvim",
--   enabled = false,
--   event = { "BufReadPost", "BufNewFile" },
--   opts = function()
--     local bufferline = require("bufferline")
--     local c = require("user.theme").palette()
--     return {
--       options = {
--         mode = "buffers",
--         style_preset = bufferline.style_preset.minimal,
--         themable = true,
--         separator_style = { "", "" }, -- { "", "" },
--         show_buffer_close_icons = false,
--         always_show_bufferline = false,
--         modified_icon = "●",
--         close_icon = "✖", -- 
--         indicator = { style = "none" },
--         diagnostics = "nvim_lsp", -- | "coc",
--       },
--       highlights = {
--         modified_selected = { fg = c.yellow },
--         modified = { fg = c.grey },
--       },
--     }
--   end,
-- },

-- separator_selected = hl.selected,
-- separator_visible = hl.selected,
-- separator = hl.selected,
-- indicator_visible = hl.selected,

-- hint_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },
-- hint_diagnostic_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },

-- info_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },
-- info_diagnostic_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },

-- warning_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },
-- warning_diagnostic_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },

-- error_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },
-- error_diagnostic_selected = { fg = c.red, bg = c.blue, sp = c.orange, bold = true, italic = true },

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

-- ########################################################

-- buffers = {
-- filter_valid = function(buffer) -> true | false,
-- filter_visible = function(buffer) -> true | false,
-- focus_on_delete = 'prev' | 'next',
-- new_buffers_position = 'last' | 'next' | 'directory' | 'number' | fun(buffer_a, buffer_b) -> true | false,
-- delete_on_right_click = true | false,
-- },
-- mappings = { cycle_prev_next = true, disable_mouse = true },
-- rendering = {
-- max_buffer_width = int,
-- },
-- pick = {
-- use_filename = true | false,
-- letters: `'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERTYQP'`
-- },
-- default_hl = {
-- fg = ('hlgroup' | '#rrggbb') | function(buf) -> ('#rrggbb' | 'hlgroup'),
-- bg = ('hlgroup' | '#rrggbb') | function(buf) -> ('hlgroup' | '#rrggbb'),
-- sp = ('hlgroup' | '#rrggbb') | function(buf) -> ('hlgroup' | '#rrggbb'),
-- bold = = true | false | fun(buf) -> true | false,
-- italic = = true | false | fun(buf) -> true | false,
-- underline = = true | false | fun(buf) -> true | false,
-- undercurl = = true | false | fun(buf) -> true | false,
-- strikethrough = true | false | fun(buf) -> true | false,
-- },
-- fill_hl = 'TabLineFill',
-- components = {..},
-- rhs = {..},
-- tabs = {
-- placement = "left" | "right",
-- components = {..}
-- },
