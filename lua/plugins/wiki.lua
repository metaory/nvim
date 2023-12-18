local lib = require("user.lib")

local norg_keybind = function(t)
  local map, lhs, rhs, desc, mode = unpack(t)
  map("norg", mode or "n", lhs, rhs, { desc = desc })
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
    dependencies = {
      "nvim-lua/plenary.nvim",
      "zen-mode.nvim",
    },
    cmd = "Neorg",
    ft = "norg",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = { mx = "~/neorg" },
            default_workspace = "mx",
            index = "index.norg",
          },
        },
        ["core.journal"] = {
          config = {
            template_name = "journal-template.norg",
            strategy = "%y/%y-%m_%d",
          },
        },
        ["core.autocommands"] = {},
        ["core.syntax"] = {},
        ["core.concealer"] = {
          config = {
            icons = { todo = { pending = { icon = "" }, undone = { icon = " " }, done = { icon = "" } } },
          },
          --  
          --  
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
            hook = function(bind)
              bind.unmap("norg", "n", "<leader>nn")

              -- https://github.com/nvim-neorg/neorg/wiki
              -- bind.remap_event("norg", "n", "<C-Space>", "core.qol.todo_items.todo.task_done")

              -- local dirman = require("neorg").modules.get_module("core.dirman")
              -- dirman.create_file("my_file", "my_ws", {
              --   no_open = false, -- open file after creation?
              --   force = false, -- overwrite file if exists
              --   metadata = {}, -- key-value table for metadata fields
              -- })
              -- bind.remap_event("norg", "n", "<C-n>", "core.dirman.create_file('foo')")
              -- { "gh", '<CMD>lua require("telescope.builtin").help_tags({ default_text = vim.fn.expand("<cword>") })<CR>', desc = "Help pages" },
              -- { "<M-F>", "<CMD>Telescope find_files hidden=true<CR>" },

              vim.tbl_map(norg_keybind, {
                { bind.map, "Q", ":q<CR>", "Quit" },
                { bind.map, "<BS>", ":bw<CR>", "Go Back" },
                { bind.map, ",,", "|> ", "Put Arrow Right", "i" },
                -- inoreab ,, \|>
                { bind.map, "<leader>uc", "<CMD>Neorg toggle-concealer<CR>", "Toggle Conceale" },
                { bind.map, "<leader>mh", "<CMD>Neorg mode traverse-heading<CR>", "Heading Mode" },
                { bind.map, "<leader>mn", "<CMD>Neorg mode norg<CR>", "Normal Mode" },
                -- [[:insert hi ]]
                -- { bind.map, "<C-n>", "<CMD>Neorg keybind norg core.dirman.create_file<CR>", "New Note" },
                -- { bind.map, "<C-i>", "[[:insert hi<CR> ]]", "New Journal Entry" },
                -- { bind.map, "<C-i>", lib.create_new_journal_entry, "New Journal Entry" },
                -- { bind.map, "<C-i>", "<CMD>NeorgNewEntry<CR>", "New Journal Entry" },
                -- strategy = "%y/%y-%m_%d",
                -- https://stackoverflow.com/questions/20021618/insert-text-conditionally-using-vim-key-mapping
                { bind.map, "<C-i>", ":normal! ggO<C-R>=strftime('%m_%d.%H:%M')<CR><CR>a ", "New Journal Entry" },
                -- { bind.map, "<C-i>", "[[:normal gg Ohi<CR>]]", "New Journal Entry" },
                { bind.map, "<C-n>", "<CMD>Neorg keybind norg core.dirman.new.note<CR>", "New Note" },
                -- { bind.map, "<leader>o", "<CMD>Neorg keybind norg core.dirman.new.note<CR>", "New Note" },
                { bind.map, "<leader>j", "<CMD>Neorg journal toc update<CR>", "Journal Index" },
                { bind.map, "<leader>y", "<CMD>Neorg journal yesterday<CR>", "Journal Yesterday" },
                { bind.map, "<leader>n", "<CMD>Neorg journal today<CR>", "Journal Today" },
                { bind.map, "<leader>N", "<CMD>Neorg journal tomorrow<CR>", "Journal Tomorrow" },
                { bind.map, "<Up>", "<CMD>Neorg presenter start<CR>", "Presenter Mode" },
                { bind.map, "q", "<CMD>Neorg journal toc open<CR>", "Close" },
              })
            end,
          },
        },
      },
    },
    config = function(_, opts)
      require("neorg").setup(opts)
      vim.api.nvim_set_var("vim_markdown_frontmatter ", 1)
      table.insert(require("mini.clue").config.clues, {
        { mode = "n", keys = "<leader>l", desc = "+List" },
        { mode = "n", keys = "<leader>m", desc = "+Mode" },
        { mode = "n", keys = "<leader>i", desc = "+Insert" },
        { mode = "n", keys = "<leader>t", desc = "+Todo" },
      })
      vim.api.nvim_create_user_command(
        "NeorgNewEntry",
        lib.create_new_journal_entry_cmd,
        { desc = "New Journal Entry" }
      )
      -- vim.notify("__OOOOOOOOOOO_CONFIG_WIKI____", vim.log.levels.ERROR, { title = "__WIKI__" })
      -- vim.keymap.set("n", "<C-i>", [[:insert hi ]], { desc = "New Journal Entry", buffer = true })
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
