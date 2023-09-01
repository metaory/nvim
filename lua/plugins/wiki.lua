return {
  -- https://github.com/nvim-neorg/neorg
  -- https://github.com/nvim-orgmode/orgmode
  -- https://github.com/MunifTanjim/nui.nvim/wiki
  -- syn match Statement "^> .*"
  { "vimwiki/vimwiki", cmd = { "VimwikiDiaryIndex", "VimwikiIndex" } },

  -- v ~/dev/forks/dotfiles-steve/.config/nvim/lua/plugins/neorg.lua
  -- https://github.com/nvim-orgmode/orgmode
  -- https://github.com/nvim-neorg/neorg
  -- https://github.com/vhyrro/awesome-neorg
  -- { "nvim-orgmode/orgmode", ft = { "org" }, config = true, },
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
                undone = {
                  icon = " ",
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
              -- keybinds.unmap("norg", "n", "<leader>mn")
              -- keybinds.unmap("norg", "n", "<leader>mh")
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
              -- keybinds.remap_event("norg", "n", "<leader>on", "core.dirman.new.note")
              -- stylua: ignore
              keybinds.map("norg", "n", "<leader>mh", "<CMD>Neorg mode traverse-heading<CR>", { silent = true, desc = "Org Heading Mode" })
              -- stylua: ignore
              keybinds.map("norg", "n", "<leader>mn", "<CMD>Neorg mode norg<CR>", { silent = true, desc = "Org Norg Mode" })
              -- stylua: ignore
              keybinds.map("norg", "n", "<leader>N", "<CMD>Neorg keybind norg core.dirman.new.note<CR>", { silent = true, desc = "Org New Note" })
              -- stylua: ignore
              keybinds.map("norg", "n", "<leader>j", "<CMD>Neorg journal toc update<CR>", { silent = true, desc = "Org Journal Index" })
              -- stylua: ignore
              keybinds.map("norg", "n", "<leader>t", "<CMD>Neorg journal tomorrow<CR>", { silent = true, desc = "Journal Tomorrow" })
              -- stylua: ignore
              keybinds.map("norg", "n", "<leader>y", "<CMD>Neorg journal yesterday<CR>", { silent = true, desc = "Journal Yesterday" })
              -- stylua: ignore
              keybinds.map("norg", "n", "<leader>n", "<CMD>Neorg journal today<CR>", { silent = true, desc = "Journal Today" })

              keybinds.map("norg", "n", "<BS>", ":bw<CR>", { silent = true })
              keybinds.map("norg", "n", "q", ":Neorg journal toc open<CR>", { silent = true })
              keybinds.map("norg", "n", "Q", ":q<CR>", { silent = true })
              keybinds.map("norg", "n", "<Up>", "<CMD>Neorg presenter start<CR>")
              keybinds.map("norg", "n", "<leader>uc", "<CMD>Neorg toggle-concealer<CR>")
            end,
          },
        },
      },
    },
    config = function(_, opts)
      require("neorg").setup(opts)
      table.insert(require("mini.clue").config.clues, {
        { mode = "n", keys = "<leader>l", desc = "+List" },
        { mode = "n", keys = "<leader>m", desc = "+Mode" },
        { mode = "n", keys = "<leader>i", desc = "+Insert" },
        { mode = "n", keys = "<leader>t", desc = "+Todo" },
      })
    end,
  },
}
