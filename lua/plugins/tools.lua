return {
  -- v ~/dev/forks/dotfiles-steve/.config/nvim/lua/plugins/neorg.lua
  -- https://github.com/nvim-orgmode/orgmode
  -- https://github.com/nvim-neorg/neorg
  -- https://github.com/vhyrro/awesome-neorg
  -- {
  --   "nvim-orgmode/orgmode",
  --   ft = { "org" },
  --   config = true,
  -- },

  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = "folke/zen-mode.nvim",
    cmd = "Neorg",
    ft = "norg",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              mx = "~/neorg",
            },
            index = "index.norg",
          },
        },
        ["core.autocommands"] = {},
        ["core.syntax"] = {},
        ["core.concealer"] = {},
        ["core.highlights"] = {},
        ["core.integrations.nvim-cmp"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.completion"] = { config = { engine = "nvim-cmp" } },
        ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
        ["core.keybinds"] = {
          config = {
            hook = function(keybinds)
              keybinds.unmap("norg", "n", "<CR>")

              keybinds.unmap("presenter", "n", "l")
              keybinds.unmap("presenter", "n", "h")
              keybinds.unmap("presenter", "n", "<CR>")
              keybinds.unmap("presenter", "n", "q")

              keybinds.remap_event("presenter", "n", "<Right>", "core.presenter.next_page")
              keybinds.remap_event("presenter", "n", "<C-j>", "core.presenter.next_page")
              keybinds.remap_event("presenter", "n", "<Left>", "core.presenter.previous_page")
              keybinds.remap_event("presenter", "n", "<C-k>", "core.presenter.previous_page")
              keybinds.remap_event("presenter", "n", "<Down>", "core.presenter.close")
              keybinds.map("norg", "n", "<Up>", "<CMD>Neorg presenter start<CR>")
            end,
          },
        },
      },
    },
  },
}
-- { "pwntester/octo.nvim", opts = {}, cmd = "Octo" },

-- neorg
-- {
--   "nvim-neorg/neorg",
--   enabled = false,
--   ft = "norg",
--   opts = {
--     load = {
--       ["core.defaults"] = {},
--       ["core.norg.concealer"] = {},
--       ["core.norg.completion"] = {
--         config = { engine = "nvim-cmp" },
--       },
--       ["core.integrations.nvim-cmp"] = {},
--     },
--   },
-- },

-- markdown preview
-- {
--   "toppair/peek.nvim",
--   build = "deno task --quiet build:fast",
--   keys = {
--     {
--       "<leader>op",
--       function()
--         local peek = require("peek")
--         if peek.is_open() then
--           peek.close()
--         else
--           peek.open()
--         end
--       end,
--       desc = "Peek (Markdown Preview)",
--     },
--   },
--   opts = { theme = "light" },
-- },

-- {
--   "sindrets/diffview.nvim",
--   cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
--   config = true,
--   keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" } },
-- },
--
-- {
--   "jackMort/ChatGPT.nvim",
--   cmd = { "ChatGPTActAs", "ChatGPT" },
--   opts = {},
-- },
