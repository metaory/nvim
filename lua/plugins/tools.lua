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
    "luckasRanarison/nvim-devdocs",
    build = function()
      vim.notify("nvim-devdocs::rebuild")
      -- zig ocaml python go
      -- yarn redis webpack-5 vite vitest web_extensions
      -- astro svelte vue-3 vuex-4 tailwindcss react react_router
      -- gtk-4.0 gtk-3.24 sqlite postgresql
      -- vim.cmd([[
      --   DevdocsFetch
      --   DevdocsInstall bash node npm jsdoc javascript typescript rust css git jq git lua-5.4 terraform markdown docker esbuild eslint html http
      --   DevdocsUpdateAll
      -- ]])
      -- nvim --headless +"DevdocsInstall ..."
    end,
    cmd = {
      -- "DevdocsFetch",
      -- "DevdocsInstall",
      -- "DevdocsUninstall",
      "DevdocsOpen",
      "DevdocsOpenFloat",
      "DevdocsOpenCurrent",
      "DevdocsOpenCurrentFloat",
      -- "DevdocsUpdate",
      -- "DevdocsUpdateAll",
    },
    opts = {
      dir_path = vim.fn.stdpath("data") .. "/devdocs", -- installation directory
      telescope = {}, -- passed to the telescope picker
      float_win = { -- passed to nvim_open_win(), see :h api-floatwin
        relative = "editor",
        height = 25,
        width = 100,
        border = "rounded",
      },
      wrap = true, -- text wrap, only applies to floating window
      -- previewer_cmd = "glow", -- for example: "glow"
      -- cmd_args = { "-s", "dark", "-w", "80" }, -- example using glow: { "-s", "dark", "-w", "80" }
      cmd_ignore = {}, -- ignore cmd rendering for the listed docs
      picker_cmd = false, -- use cmd previewer in picker preview
      picker_cmd_args = {}, -- example using glow: { "-p" }
      --stylua: ignore
      ensure_installed = { "bash", "node", "npm", "jsdoc", "javascript", "typescript", "rust", "css", "git", "jq", "git", "lua-5.4", "terraform", "markdown", "docker", "esbuild","eslint", "html", "http" },
      after_open = function(bufnr)
        vim.cmd([[ TSBufEnable highlight ]])
        vim.api.nvim_buf_set_keymap(bufnr, "n", "q", ":close<CR>", {})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<Esc>", ":close<CR>", {})
      end,
    },
    dependencies = {
      -- "ellisonleao/glow.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
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
              keybinds.map(
                "norg",
                "n",
                "<leader>j",
                ":Neorg journal toc open<CR>",
                { silent = true, desc = "Org Journal Index" }
              )
              keybinds.map(
                "norg",
                "n",
                "<leader>k",
                ":Neorg journal tomorrow<CR>",
                { silent = true, desc = "Journal Tomorrow" }
              )
              keybinds.map(
                "norg",
                "n",
                "<leader>n",
                ":Neorg journal today<CR>",
                { silent = true, desc = "Journal Today" }
              )

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
