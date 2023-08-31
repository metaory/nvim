return {
  { "folke/which-key.nvim", enabled = false },
  {
    "echasnovski/mini.clue",
    lazy = false,
    -- enabled = false,
    config = function()
      local miniclue = require("mini.clue")

      -- vim.api.nvim_set_hl(0, "MiniClueBorder", { fg = "#906f71", bold = true })

      miniclue.setup({
        -- clues = {},
        -- triggers = {},
        window = {
          config = { border = "none" },
          delay = 200,
          scroll_down = "<C-d>",
          scroll_up = "<C-u>",
        },
        triggers = {
          -- { mode = "n", keys = "<LocalLeader>" },
          -- { mode = "x", keys = "<LocalLeader>" },
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

          { mode = "n", keys = "c" },

          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },

          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },

          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
        },

        clues = {
          miniclue.gen_clues.g(),
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
          { mode = "n", keys = "<Leader>b", desc = "+Buffer" },
          { mode = "n", keys = "<Leader>c", desc = "+Code" },
          { mode = "n", keys = "<Leader>e", desc = "+Exec" },
          { mode = "n", keys = "<Leader>d", desc = "+Debug" },
          { mode = "n", keys = "<Leader>f", desc = "+File" },
          { mode = "n", keys = "<Leader>g", desc = "+Git" },
          { mode = "n", keys = "<Leader>o", desc = "+Org" },
          { mode = "n", keys = "<Leader>q", desc = "+Quit" },
          { mode = "n", keys = "<Leader>r", desc = "+Replace" },
          { mode = "n", keys = "<Leader>s", desc = "+Search" },
          { mode = "n", keys = "<Leader>sn", desc = "+Notification" },
          { mode = "n", keys = "<Leader>u", desc = "+UI" },
          { mode = "n", keys = "<Leader>w", desc = "+Window" },
          { mode = "n", keys = "<Leader>x", desc = "+Quickfix" },
          { mode = "n", keys = "<Leader><Tab>", desc = "+Tab" },
          { mode = "n", keys = "gz", desc = "+Surround" },
          { mode = "n", keys = "ga", desc = "+Align" },
        },
      })
    end,
    -- opts = { }
  },
}

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
