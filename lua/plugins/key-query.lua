-- INFO: <LEADER> um

return {
  { "folke/which-key.nvim", enabled = false },
  {
    "echasnovski/mini.clue",
    lazy = false,
    config = function()
      local clue = require("mini.clue")

      clue.setup({
        window = {
          config = { width = "auto", border = "rounded" },
          delay = 200,
          scroll_down = "<C-d>",
          scroll_up = "<C-u>",
        },
        triggers = {
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          { mode = "n", keys = "c" },

          { mode = "n", keys = "[" },
          { mode = "n", keys = "]" },
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

          { mode = "i", keys = "<C-x>" },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
        },

        clues = {
          clue.gen_clues.builtin_completion(),
          clue.gen_clues.marks(),
          clue.gen_clues.registers(),
          clue.gen_clues.windows(),
          clue.gen_clues.g(),
          clue.gen_clues.z(),
          { mode = "n", keys = "<Leader>b", desc = "+Buffer" },

          { mode = "n", keys = "<Leader>c", desc = "+Code" },
          { mode = "x", keys = "<Leader>c", desc = "+Code" },

          { mode = "n", keys = "<Leader>e", desc = "+Exec" },
          { mode = "n", keys = "<Leader>ee", desc = "++Exec" },
          { mode = "n", keys = "<Leader>eh", desc = "+Help" },
          { mode = "n", keys = "<Leader>eg", desc = "+Gen" },
          { mode = "n", keys = "<Leader>ex", desc = "+Inspect" },
          { mode = "n", keys = "<Leader>ew", desc = "+Wiki" },
          { mode = "n", keys = "<Leader>eo", desc = "+Options" },
          { mode = "n", keys = "<Leader>et", desc = "+Task" },
          { mode = "n", keys = "<Leader>ez", desc = "+Lazy" },

          { mode = "n", keys = "<Leader>d", desc = "+Debug" },
          { mode = "x", keys = "<Leader>d", desc = "+Debug" },
          { mode = "n", keys = "<Leader>da", desc = "+Adapter" },

          { mode = "n", keys = "<Leader>f", desc = "+File" },

          { mode = "n", keys = "<Leader>g", desc = "+Git" },
          { mode = "x", keys = "<Leader>g", desc = "+Git" },
          { mode = "n", keys = "<Leader>gh", desc = "+Hunk" },
          { mode = "x", keys = "<Leader>gh", desc = "+Hunk" },

          { mode = "n", keys = "<Leader>q", desc = "+Quit" },
          { mode = "n", keys = "<Leader>i", desc = "+Info" },
          { mode = "n", keys = "<Leader>u", desc = "+UI" },
          { mode = "n", keys = "<Leader>w", desc = "+Window" },
          { mode = "n", keys = "<Leader>x", desc = "+Quickfix" },

          { mode = "n", keys = "<Leader>r", desc = "+Replace" },
          { mode = "x", keys = "<Leader>r", desc = "+Replace" },

          { mode = "n", keys = "<Leader>s", desc = "+Search" },
          { mode = "x", keys = "<Leader>s", desc = "+Search" },
          { mode = "n", keys = "<Leader>sn", desc = "+Notification" },

          { mode = "n", keys = "<Leader><Tab>", desc = "+Tab" },

          { mode = "n", keys = "gz", desc = "Surround operator" },
          { mode = "n", keys = "ga", desc = "Align operator" }, -- lua/plugins/coding.lua:18
          -- { mode = "n", keys = "gc", desc = "Comment operator" }, -- /home/meta/.local/share/nvim/lazy/mini.comment/lua/mini/comment.lua:411
        },
      })
    end,
  },
  {
    "echasnovski/mini.map",
    cmd = "MiniMap",
    keys = { { "<leader>um", "<CMD>lua MiniMap.toggle()<CR>", desc = "Toggle Map" } },
    opts = {
      -- integrations = nil,
      -- - View-line pairs: '▒' and '█'.
      -- - Line - '🮚', '▶'.
      -- - View - '╎', '┋', '┋'.
      symbols = { encode = nil, scroll_line = "█", scroll_view = "┃" },
      window = { focusable = false, side = "right", show_integration_count = true, width = 10, winblend = 100 },
    },
    config = function(_, opts)
      local c = require("user.colors").palette()
      vim.api.nvim_set_hl(0, "MiniMapNormal", { fg = c.bg2 })
      --   -- vim.api.nvim_set_hl(0, "MiniMapNormal") -- ,  basic highlight of whole window.
      --   -- vim.api.nvim_set_hl(0, "MiniMapSymbolCount")  -- counts of per-line integration items.
      --   -- vim.api.nvim_set_hl(0, "MiniMapSymbolLine") -- scrollbar part representing current line.
      --   -- vim.api.nvim_set_hl(0, "MiniMapSymbolView") -- scrollbar part representing current view.
      require("mini.map").setup(opts)
    end,
  },
}

-- { mode = "n", keys = "<LocalLeader>" },
-- { mode = "x", keys = "<LocalLeader>" },

-- local c = require("tokyonight.colors").default
