return {
  -- NOTE: https://github.com/aca/wezterm.nvim
  {
    "numToStr/Navigator.nvim",
    cmd = { "NavigatorRight", "NavigatorLeft", "NavigatorUp", "NavigatorDown" },
    opts = { disable_on_zoom = true },
  },
  {
    "gbprod/yanky.nvim",
    keys = { { "<leader>p", nil, false } },
    -- event = "BufReadPost",
    -- dependencies = { { "kkharji/sqlite.lua", enabled = true } },
    -- opts = { ring = { storage = "shada" } },
    -- opts = function(_, opt)
    --   ddwrite({ o = opt }, "___yanky")
    -- end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VimEnter",
    opts = function(_, opts)
      table.insert(opts.filetype_exclude, "starter")
    end,
  },
  -- { "lukas-reineke/indent-blankline.nvim", -- enabled = false, },
  -- { "echasnovski/mini.indentscope", enabled = true, init = function() end },
}
-- opts = function(_, opts) return vim.list_extend({ ring = { storage = "shada" } }, opts) end,
-- ○ nvim-navic      ■ already up to date
-- ○ nvim-peekup      ■ already up to date
-- ○ nvim-spectre   Spectre   <leader>sr     ■ already up to date
-- ○ nvim-treesitter   TSUpdateSync  BufReadPost BufNewFile   <c-space> <bs> <c-space> <bs>     ■ already up to date
-- ○ nvim-treesitter-context      ■ already up to date
-- ○ nvim-ts-context-commentstring      ■ already up to date

-- { "ellisonleao/gruvbox.nvim" },
-- TODO: base16
-- { "simrat39/rust-tools.nvim" },
-- { 'mhartington/formatter.nvim' },
-- { "hjson/vim-hjson", ft = "hjson" },
-- { "f-person/git-blame.nvim", ft = "*" },
-- { "norcalli/nvim-colorizer.lua" },
-- { import = "lazyvim.plugins.extras.ui.mini-starter" },

-- { "NvChad/nvim-colorizer.lua", cmd = "ColorizerToggle", opts = { filetypes = { html = { mode = "foreground" }, }, }, },
-- { "ron-rs/ron.vim" },
-- { "niuiic/divider.nvim" },
-- { "s1n7ax/nvim-search-and-replace" },
-- { "chipsenkbeil/vimwiki-server.nvim" },
-- { "jim-fx/sudoku.nvim", opts = {}, cmd = "Sudoku" },
-- {

--[[
     │  20 │  --   "nvim-orgmode/orgmode",
     │  21 │  --   config = function()
     │  22 │  --     require("orgmode").setup({})
     │  23 │  --   end,
     │  24 │  -- },
     │  25 │
     │  26 │  -- {
     │  27 │  --   "nvim-neorg/neorg",
     │  28 │  --   build = ":Neorg sync-parsers",
     │  29 │  --   ft = "norg",
     │  30 │  --   opts = {
     │  31 │  --     load = {
     │  32 │  --       ["core.defaults"] = {}, -- Loads default behaviour
     │  33 │  --       ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
     │  34 │  --       ["core.integrations.telescope"] = {},
     │  35 │  --       ["core.norg.dirman"] = { -- Manages Neorg workspaces
     │  36 │  --         config = {
     │  37 │  --           workspaces = {
     │  38 │  --             notes = "~/notes",
     │  39 │  --           },
     │  40 │  --         },
     │  41 │  --       },
     │  42 │  --     },
     │  43 │  --   },
     │  44 │  --   dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
     │  45 │  -- },
]]
-- keys = function(_, keys)
--   local mappings = { { "d", "d", mode = { "n", "x" }, desc = "Delete pending" }, }
--   return vim.list_extend(mappings, keys)
-- end,
-- {
--   "neovim/nvim-lspconfig",
--   opts = {
--     capabilities = {
--       textDocument = {
--         foldingRange = {
--           dynamicRegistration = false,
--           lineFoldingOnly = true,
--         },
--       },
--     },
--   },
-- },

-- add nvim-ufo
-- {
--   "kevinhwang91/nvim-ufo",
--   dependencies = "kevinhwang91/promise-async",
--   event = "BufReadPost",
--   enabled = false,
--   opts = {},
--
--   init = function()
--     -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
--     vim.keymap.set("n", "zR", function()
--       require("ufo").openAllFolds()
--     end)
--     vim.keymap.set("n", "zM", function()
--       require("ufo").closeAllFolds()
--     end)
--   end,
-- },
