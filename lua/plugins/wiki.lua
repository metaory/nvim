vim.api.nvim_set_var("vim_markdown_frontmatter ", 1)

local norg_keybind = function(t)
  local map, lhs, rhs, desc = unpack(t)
  map("norg", "n", lhs, rhs, { desc = desc })
end

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
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.dirman"] = { config = { workspaces = { mx = "~/neorg" }, index = "index.norg" } },
        ["core.autocommands"] = {},
        ["core.syntax"] = {},
        ["core.concealer"] = {
          config = { icons = { todo = { pending = { icon = "" }, undone = { icon = " " }, done = { icon = "" } } } },
        },
        -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/concealer/module.lua#L655
        ["core.highlights"] = {},
        ["core.integrations.nvim-cmp"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.completion"] = { config = { engine = "nvim-cmp" } },
        ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
        ["core.keybinds"] = {
          config = {
            neorg_leader = "<leader>",
            -- norg_keybind(keybinds, t)
            hook = function(bind)
              bind.unmap("norg", "n", "<leader>nn")
              local map = bind.map

              vim.tbl_map(norg_keybind, {
                { map, "Q", ":q<CR>", "Quit" },
                { map, "<BS>", ":bw<CR>", "Go Back" },
                { map, "<leader>uc", "<CMD>Neorg toggle-concealer<CR>", "Toggle Conceale" },
                { map, "<leader>mh", "<CMD>Neorg mode traverse-heading<CR>", "Heading Mode" },
                { map, "<leader>mn", "<CMD>Neorg mode norg<CR>", "Normal Mode" },
                { map, "<leader>o", "<CMD>Neorg keybind norg core.dirman.new.note<CR>", "New Note" },
                { map, "<leader>j", "<CMD>Neorg journal toc update<CR>", "Journal Index" },
                { map, "<leader>y", "<CMD>Neorg journal yesterday<CR>", "Journal Yesterday" },
                { map, "<leader>n", "<CMD>Neorg journal today<CR>", "Journal Today" },
                { map, "<leader>N", "<CMD>Neorg journal tomorrow<CR>", "Journal Tomorrow" },
                { map, "<Up>", "<CMD>Neorg presenter start<CR>", "Presenter Mode" },
                { map, "q", "<CMD>Neorg journal toc open<CR>", "Close" },
              })
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

-- keys = {
--   { "<leader>ni", "<CMD>Neorg workspace mx<CR>", desc = "Org Index" },
--   { "<leader>nm", "<CMD>Neorg index<CR>", desc = "Org Menu" },
-- },
