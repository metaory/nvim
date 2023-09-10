local isRunningPicom = vim.fn.system("pgrep picom") ~= ""

-- TODO: LunarVim/colorgen-nvim

return {
  { "max397574/colortils.nvim", cmd = "Colortils", config = true },
  {
    "echasnovski/mini.hues",
    keys = {
      {
        "<leader>eec",
        '<CMD>lua require("mini.hues").setup({ background = "#221b1c", foreground = "#c0c8cc", accent = "yellow" })<CR>',
        desc = "Hues",
      },
    },
  },
  {
    "navarasu/onedark.nvim",
    opts = function()
      local style = "deep"
      local c = require("onedark.palette")[style]
      return {
        style = style, -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        transparent = isRunningPicom,
        term_colors = true,
        ending_tildes = true,
        cmp_itemkind_reverse = false,
        code_style = { comments = "italic", keywords = "italic", functions = "none", strings = "none", variables = "none" },
        lualine = { transparent = isRunningPicom },
        colors = {
          -- yellow = "#fe0332",
        },
        highlights = {
          MiniCursorword = { bg = c.bg3, fmt = "bold" },
          MiniCursorwordCurrent = { bg = c.bg3, fmt = "bold" },
        },
        diagnostics = { darker = true, undercurl = true, background = true },
      }
    end,
  },
  { "catppuccin/nvim", enabled = false },
  {
    "tokyonight.nvim",
    enabled = false,
    opts = {
      style = "night",
      light_style = "storm",
      transparent = isRunningPicom,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "transparent",
        floats = "transparent",
      },
      sidebars = { "qf", "help", "neo-tree" },
      dim_inactive = true,
      -- day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      -- hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
      -- lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
      -- on_colors = function(colors) end,
      -- on_highlights = function(highlights, colors) end,
      -- on_highlights = function(highlights, colors) highlights.MsgArea = { bg = colors.none } end,
    },
  },
}
-- { "lunarvim/horizon.nvim", enabled = true, config = true, lazy = false },
-- {
--   "folke/styler.nvim",
--   event = "VeryLazy",
--   opts = { themes = { markdown = { colorscheme = "catppuccin" }, help = { colorscheme = "catppuccin", background = "dark" } } },
-- },
-- require('mini.hues').setup({ background = '#2b1a33', foreground = '#c9c5cb' })
-- {
--   "echasnovski/mini.colors",
--   opts = {},
--   config = true,
--   lazy = false,
-- },
-- :lua MiniColors.get_colorscheme():<method goes here>:apply().
-- {
--   "echasnovski/mini.base16",
--   lazy = false,
--   opts = {
--     -- Table with names from `base00` to `base0F` and values being strings of HEX colors with format "#RRGGBB". NOTE: this should be explicitly supplied in `setup()`.
--     palette = {
--       base00 = "#112641",
--       base01 = "#3a475e",
--       base02 = "#606b81",
--       base03 = "#8691a7",
--       base04 = "#d5dc81",
--       base05 = "#e2e98f",
--       base06 = "#eff69c",
--       base07 = "#fcffaa",
--       base08 = "#ffcfa0",
--       base09 = "#cc7e46",
--       base0A = "#46a436",
--       base0B = "#9ff895",
--       base0C = "#ca6ecf",
--       base0D = "#42f7ff",
--       base0E = "#ffc4ff",
--       base0F = "#00a5c5",
--     },
--
--     -- Whether to support cterm colors. Can be boolean, `nil` (same as `false`), or table with cterm colors. See `setup()` documentation for more information.
--     use_cterm = nil,
--     -- Plugin integrations. Use `default = false` to disable all integrations. Also can be set per plugin (see |MiniBase16.config|).
--     plugins = { default = true },
--   },
--   config = function(_, opts)
--     require("mini.base16").setup(opts)
--   end,
-- },
-- { "nyoom-engineering/oxocarbon.nvim", lazy = false },
-- { "ellisonleao/gruvbox.nvim" },
-- { "rose-pine/neovim", name = "rose-pine", lazy = false },
-- {
--   "tokyonight.nvim",
--   priority = 1000,
--   opts = function()
--     return {
--       style = "moon",
--       -- transparent = true,
--       -- styles = {
--       --   sidebars = "transparent",
--       --   floats = "transparent",
--       -- },
--       sidebars = {
--         "qf",
--         "vista_kind",
--         "terminal",
--         "spectre_panel",
--         "startuptime",
--         "Outline",
--       },
--       on_colors = function(c)
--         -- local hsluv = require("tokyonight.hsluv")
--         -- local function randomColor(color)
--         --   if color ~= "NONE" then
--         --     local hsl = hsluv.hex_to_hsluv(color)
--         --     hsl[1] = math.random(0, 360)
--         --     return hsluv.hsluv_to_hex(hsl)
--         --   end
--         --   return color
--         -- end
--         -- local function set(colors)
--         --   if type(colors) == "table" then
--         --     for k, v in pairs(colors) do
--         --       if type(v) == "string" then
--         --         colors[k] = randomColor(v)
--         --       elseif type(v) == "table" then
--         --         set(v)
--         --       end
--         --     end
--         --   end
--         -- end
--         -- set(c)
--       end,
--       on_highlights = function(hl, c)
--         hl.CursorLineNr = { fg = c.orange, bold = true }
--         hl.LineNr = { fg = c.orange, bold = true }
--         hl.LineNrAbove = { fg = c.fg_gutter }
--         hl.LineNrBelow = { fg = c.fg_gutter }
--         local prompt = "#2d3149"
--         hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
--         hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
--         hl.TelescopePromptNormal = { bg = prompt }
--         hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
--         hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
--         hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
--         hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
--       end,
--     }
--   end,
-- },

-- toggle_style_key = "<leader>ut", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
-- toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between
