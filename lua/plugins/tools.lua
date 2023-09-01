return {
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
    "wintermute-cell/gitignore.nvim",
    cmd = "Gitignore",
    keys = { { "<leader>egi", "<CMD>Gitignore<CR>", desc = "Gen Gitignore" } },
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
}
-- { "pwntester/octo.nvim", opts = {}, cmd = "Octo" },

-- require("mini.clue").config.clues = vim.tbl_deep_extend("force", require("mini.clue").config.clues, { { mode = "n", keys = "<leader>l", desc = "+List" }, })
-- local miniclue = require("mini.clue")
-- miniclue.setup({ clues = { }, })

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
