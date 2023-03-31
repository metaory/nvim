return {
  -- { "ellisonleao/gruvbox.nvim" },
  { "f-person/git-blame.nvim", ft = "*" },
  { "hashivim/vim-terraform", ft = "terraform" },
  -- { "norcalli/nvim-colorizer.lua" },
  { "numToStr/Navigator.nvim", cmd = { "NavigatorRight", "NavigatorLeft" } },
  { "vimwiki/vimwiki", cmd = { "VimwikiDiaryIndex", "VimwikiIndex" } },
  {
    "NvChad/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    opts = {
      filetypes = {
        html = { mode = "foreground" },
      },
    },
  },
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
}
