return {
  {
    "SmiteshP/nvim-navic",
    opts = {
      separator = " ",
      highlight = true,
      depth_limit = 6,
      icons = require("lazyvim.config").icons.kinds,
    },
  },
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all Notifications",
      },
    },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.80)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        local buf = vim.api.nvim_win_get_buf(win)
        if not pcall(vim.treesitter.start, buf, "lua") then
          vim.bo[buf].filetype = "lua"
        end
      end,
    },
    -- vim.api.nvim_buf_set_option(buf, "filetype", "lua")
    -- init = function()
    -- when noice is not enabled, install notify on VeryLazy
    -- local Util = require("lazyvim.util")
    -- if not Util.has("noice.nvim") then
    --   Util.on_very_lazy(function()
    --     vim.notify = require("notify")
    --   end)
    -- end
    -- vim.notify = nil
    -- end,
  },
}
-- https://github.com/stevearc/dressing.nvim
-- {
--   "stevearc/dressing.nvim",
--   opts = {
--     select = {
--       enabled = true,
--       backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
--       trim_prompt = true,
--       -- telescope = require('telescope.themes').get_ivy()
--       -- telescope = nil,
--       telescope = {
--         layout_strategy = "dropdown",
--         sorting_strategy = "descending",
--         -- layout_config = { prompt_position = "bottom" },
--         layout_config = {
--           prompt_position = "bottom",
--           ivy = {
--             prompt_position = "bottom",
--             width = 0.9,
--             preview_width = 0.6,
--           },
--         },
--       },
--       -- format_item_override = {},
--       -- see :help dressing_get_config
--       -- get_config = nil,
--     },
--   },
--   -- input = { enabled = true, default_prompt = "OOOOInput:" },
--   -- select = { backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" } },
-- },
-- },
--  { "j-hui/fidget.nvim", tag = "legacy", event = "LspAttach", opts = {} },
-- floating winbar
-- {
--   "b0o/incline.nvim",
--   event = "BufReadPre",
--   enabled = false,
--   config = function()
--     local colors = require("tokyonight.colors").setup()
--     require("incline").setup({
--       highlight = {
--         groups = {
--           InclineNormal = { guibg = "#FC56B1", guifg = colors.black },
--           InclineNormalNC = { guifg = "#FC56B1", guibg = colors.black },
--         },
--       },
--       window = { margin = { vertical = 0, horizontal = 1 } },
--       render = function(props)
--         local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
--         local icon, color = require("nvim-web-devicons").get_icon_color(filename)
--         return { { icon, guifg = color }, { " " }, { filename } }
--       end,
--     })
--   end,
-- },

-- auto-resize windows
-- {
--   "anuvyklack/windows.nvim",
--   event = "WinNew",
--   dependencies = {
--     { "anuvyklack/middleclass" },
--     { "anuvyklack/animation.nvim", enabled = false },
--   },
--   keys = { { "<leader>m", "<cmd>WindowsMaximize<cr>", desc = "Zoom" } },
--   config = function()
--     vim.o.winwidth = 5
--     vim.o.equalalways = false
--     require("windows").setup({
--       animation = { enable = false, duration = 150 },
--     })
--   end,
-- },

-- { "lewis6991/satellite.nvim", opts = {}, event = "VeryLazy", enabled = false },
-- {
--   "echasnovski/mini.map",
--   main = "mini.map",
--   event = "VeryLazy",
--   enabled = false,
-- },
-- {
--   "petertriho/nvim-scrollbar",
--   event = "BufReadPost",
--   enabled = false,
-- },

-- style windows with different colorschemes
-- {
--   "folke/styler.nvim",
--   enabled = false,
--   event = "VeryLazy",
--   opts = {
--     themes = {
--       markdown = { colorscheme = "tokyonight" },
--       help = { colorscheme = "tokyonight", background = "dark" },
--     },
--   },
-- },

-- silly drops
-- {
--   "folke/drop.nvim",
--   enabled = false,
--   event = "VeryLazy",
--   config = function()
--     math.randomseed(os.time())
--     -- local theme = ({ "stars", "snow" })[math.random(1, 3)]
--     require("drop").setup({ theme = "spring" })
--   end,
-- },

-- lualine
