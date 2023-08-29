return {
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
  { "vito-c/jq.vim", ft = "jq" },
  -- { "f-person/git-blame.nvim", ft = "*" },
  { "fladson/vim-kitty", ft = "kitty" },
  { "hashivim/vim-terraform", ft = "terraform" },
  { "imsnif/kdl.vim", ft = "kdl" },
  { "mustache/vim-mustache-handlebars", ft = "hbs" },
  {
    "lukas-reineke/indent-blankline.nvim",
    -- event = "VeryLazy",
    event = "VimEnter",
    -- event = { "BufReadPost", "BufNewFile" },
    -- dependencies = { "nvim-telescope/telescope.nvim" },

    -- cmd = "Telescope",
  },
  -- { "lukas-reineke/indent-blankline.nvim", -- enabled = false, },
  -- { "echasnovski/mini.indentscope", -- enabled = false, },
  {
    "catppuccin/nvim",
    optional = true,
    enabled = false,
  },
  -- { "norcalli/nvim-colorizer.lua" },
  -- { import = "lazyvim.plugins.extras.ui.mini-starter" },
  {
    "numToStr/Navigator.nvim",
    cmd = { "NavigatorRight", "NavigatorLeft", "NavigatorUp", "NavigatorDown" },
    opts = {
      disable_on_zoom = true,
    },
  },
  -- {
  --   "echasnovski/mini.hipatterns",
  --   event = { "SpellFileMissing" },
  --   cmd = "MiniHi",
  --   -- event = { "Signal" },
  --   -- lazy = true,
  --   -- enabled = false,
  --   -- optional = true,
  -- },
  {
    "gbprod/yanky.nvim",
    event = "VimEnter",
    opts = function(_, opts)
      return vim.list_extend({
        ring = { storage = "shada" }, --"sqlite"
      }, opts)
    end,
    -- keys = function(_, keys)
    --   local mappings = {
    --     { "d", "d", mode = { "n", "x" }, desc = "Delete pending" },
    --   }
    --   return vim.list_extend(mappings, keys)
    -- end,
  },
  -- https://github.com/nvim-neorg/neorg
  -- https://github.com/nvim-orgmode/orgmode
  -- https://github.com/MunifTanjim/nui.nvim/wiki
  -- syn match Statement "^> .*"
  { "vimwiki/vimwiki", cmd = { "VimwikiDiaryIndex", "VimwikiIndex" } },
}
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
