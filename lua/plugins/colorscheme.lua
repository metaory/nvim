return {

  -- {
  --   "tokyonight.nvim",
  --   enabled = false,
  -- },
  {
    "echasnovski/mini.hues",
    keys = {
      {
        "<leader>ec",
        function()
          -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-hues.md
          -- require("mini.hues").setup({ background = "#2b1a33", foreground = "#c9c5cb" })
          require("mini.hues").setup({ background = "#221b1c", foreground = "#c0c8cc", accent = "yellow" })
        end,
        mode = "n",
        desc = "Hues",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
  },
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
}
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
