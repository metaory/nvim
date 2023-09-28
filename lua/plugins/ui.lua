-- INFO: <LEADER> cs

return {
  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    cmd = "SymbolsOutline",
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
  -- TODO: https://github.com/SmiteshP/nvim-navbuddy
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = function()
      vim.g.navic_silence = true
      -- TODO:
      -- require("lazyvim.util").on_attach(function(client, buffer)
      --   if client.server_capabilities.documentSymbolProvider then
      --     require("nvim-navic").attach(client, buffer)
      --   end
      -- end)
    end,
    opts = function()
      return {
        separator = " ",
        highlight = true,
        depth_limit = 5,
        icons = require("user.theme").icons.kinds,
      }
    end,
  },

  { "MunifTanjim/nui.nvim", lazy = false },

  {
    "stevearc/dressing.nvim",
    lazy = false,
    -- init = function()
    --   vim.ui.select = function(...)
    --     require("lazy").load({ plugins = { "dressing.nvim" } })
    --     return vim.ui.select(...)
    --   end
    --   vim.ui.input = function(...)
    --     require("lazy").load({ plugins = { "dressing.nvim" } })
    --     return vim.ui.input(...)
    --   end
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

-- on_open = function(win)
--   local buf = vim.api.nvim_win_get_buf(win)
--   local syntax = vim.api.nvim_buf_get_option(buf, "syntax")
--   local ft = vim.api.nvim_buf_get_option(buf, "filetype")
--   -- ddwrite({ b = buf, w = win, s = syntax, ft = ft }, "___on_open", "a")
--   if not pcall(vim.treesitter.start, buf, "lua") then
--     vim.bo[buf].filetype = "lua"
--   end
-- end,

--
