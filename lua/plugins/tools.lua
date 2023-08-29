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
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = true,
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = "folke/zen-mode.nvim",
    cmd = "Neorg",
    ft = "norg",
    -- keys = {
    --   { "<leader>ni", "<CMD>Neorg workspace mx<CR>", desc = "Org Index" },
    --   { "<leader>nm", "<CMD>Neorg index<CR>", desc = "Org Menu" },
    -- },
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
        -- ["core.concealer"] = {},
        ["core.concealer"] = { -- Adds pretty icons to your documents
          config = {
            -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/concealer/module.lua#L655
            icons = {
              todo = {
                pending = {
                  icon = "",
                },
                done = {
                  icon = "",
                },
              },
            },
          },
        },
        ["core.highlights"] = {},
        ["core.integrations.nvim-cmp"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.completion"] = { config = { engine = "nvim-cmp" } },
        ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
        ["core.keybinds"] = {
          config = {
            neorg_leader = "<leader>",
            hook = function(keybinds)
              keybinds.unmap("norg", "n", "<leader>nn")
              -- keybinds.unmap("norg", "n", "<CR>")

              -- keybinds.unmap("presenter", "n", "l")
              -- keybinds.unmap("presenter", "n", "h")
              -- keybinds.unmap("presenter", "n", "<CR>")
              -- keybinds.unmap("presenter", "n", "q")

              -- keybinds.remap_event("presenter", "n", "<Right>", "core.presenter.next_page")
              -- keybinds.remap_event("presenter", "n", "<C-j>", "core.presenter.next_page")
              -- keybinds.remap_event("presenter", "n", "<Left>", "core.presenter.previous_page")
              -- keybinds.remap_event("presenter", "n", "<C-k>", "core.presenter.previous_page")
              -- keybinds.remap_event("presenter", "n", "<Down>", "core.presenter.close")
              -- { leader .. "nn", "core.dirman.new.note", opts = { desc = "Create New Note" } },
              keybinds.remap_event("norg", "n", "<leader>on", "core.dirman.new.note")
              keybinds.map("norg", "n", "q", ":Neorg journal toc open<CR>", { silent = true })
              keybinds.map("norg", "n", "Q", ":q<CR>", { silent = true })
              keybinds.map("norg", "n", "<Up>", "<CMD>Neorg presenter start<CR>")
              keybinds.map("norg", "n", "<leader>uc", "<CMD>Neorg toggle-concealer<CR>")
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