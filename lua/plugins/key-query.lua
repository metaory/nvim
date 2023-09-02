return {
  { "folke/which-key.nvim", enabled = false },
  {
    "echasnovski/mini.map",
    cmd = "MiniMap",
    keys = {
      {
        "<leader>um",
        ":lua MiniMap.toggle()<CR>",
        -- function() require("mini.map").toggle() end,
        mode = "n",
        desc = "Map",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {
      -- No need to copy this inside `setup()`. Will be used automatically.
      -- Highlight integrations (none by default)
      integrations = nil,

      -- Symbols used to display data
      symbols = {
        -- Encode symbols. See `:h MiniMap.config` for specification and
        -- `:h MiniMap.gen_encode_symbols` for pre-built ones.
        -- Default: solid blocks with 3x2 resolution.
        encode = nil,

        -- Scrollbar parts for view and line. Use empty string to disable any.
        scroll_line = "█",
        scroll_view = "┃",
      },

      -- Window options
      window = {
        -- Whether window is focusable in normal way (with `wincmd` or mouse)
        focusable = false,

        -- Side to stick ('left' or 'right')
        side = "right",

        -- Whether to show count of multiple integration highlights
        show_integration_count = true,

        -- Total width
        width = 10,

        -- Value of 'winblend' option
        winblend = 25,
      },
    },
    config = function(_, opts)
      local c = require("tokyonight.colors").default

      vim.api.nvim_set_hl(0, "MiniMapNormal", { fg = c.bg_dark })
      -- vim.api.nvim_set_hl(0, "MiniMapNormal") -- ,  basic highlight of whole window.
      -- vim.api.nvim_set_hl(0, "MiniMapSymbolCount")  -- counts of per-line integration items.
      -- vim.api.nvim_set_hl(0, "MiniMapSymbolLine") -- scrollbar part representing current line.
      -- vim.api.nvim_set_hl(0, "MiniMapSymbolView") -- scrollbar part representing current view.
      require("mini.map").setup(opts)
    end,
  },
  {
    "echasnovski/mini.clue",
    lazy = false,
    -- enabled = false,
    config = function()
      local miniclue = require("mini.clue")

      -- lua require("mini.clue").set_mapping_desc('n', '<leader>eoo', 'zzzz')
      miniclue.setup({
        -- clues = {},
        -- triggers = {},
        window = {
          config = {
            -- border = "none",
          },
          delay = 200,
          scroll_down = "<C-d>",
          scroll_up = "<C-u>",
        },
        triggers = {
          -- { mode = "n", keys = "<LocalLeader>" },
          -- { mode = "x", keys = "<LocalLeader>" },
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
          miniclue.gen_clues.g(),
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
          { mode = "n", keys = "<Leader>b", desc = "+Buffer" },
          { mode = "n", keys = "<Leader>c", desc = "+Code" },
          { mode = "x", keys = "<Leader>c", desc = "+Code" },

          { mode = "n", keys = "<Leader>e", desc = "+Exec" },
          { mode = "n", keys = "<Leader>eh", desc = "+Help" },
          { mode = "n", keys = "<Leader>eg", desc = "+Gen" },
          { mode = "n", keys = "<Leader>ex", desc = "+Inspect" },
          { mode = "n", keys = "<Leader>ew", desc = "+Wiki" },
          { mode = "n", keys = "<Leader>eo", desc = "+Options" },
          { mode = "n", keys = "<Leader>ez", desc = "+Lazy" },

          { mode = "n", keys = "<Leader>d", desc = "+Debug" },
          { mode = "x", keys = "<Leader>d", desc = "+Debug" },
          { mode = "n", keys = "<Leader>da", desc = "+Adapter" },

          { mode = "n", keys = "<Leader>f", desc = "+File" },

          { mode = "n", keys = "<Leader>g", desc = "+Git" },
          { mode = "x", keys = "<Leader>g", desc = "+Git" },
          { mode = "n", keys = "<Leader>gh", desc = "+Hunk" },
          { mode = "x", keys = "<Leader>gh", desc = "+Hunk" },

          -- { mode = "n", keys = "<Leader>o", desc = "+Org" },
          { mode = "n", keys = "<Leader>q", desc = "+Quit" },
          { mode = "n", keys = "<Leader>r", desc = "+Replace" },
          { mode = "x", keys = "<Leader>r", desc = "+Replace" },

          { mode = "n", keys = "<Leader>i", desc = "+Info" },
          { mode = "n", keys = "<Leader>s", desc = "+Search" },
          { mode = "x", keys = "<Leader>s", desc = "+Search" },

          { mode = "n", keys = "<Leader>sn", desc = "+Notification" },
          { mode = "n", keys = "<Leader>u", desc = "+UI" },
          { mode = "n", keys = "<Leader>w", desc = "+Window" },
          { mode = "n", keys = "<Leader>x", desc = "+Quickfix" },
          { mode = "n", keys = "<Leader><Tab>", desc = "+Tab" },
          { mode = "n", keys = "gz", desc = "+Surround" },
          { mode = "n", keys = "ga", desc = "+Align" },
          -- { mode = "n", keys = "gc", desc = "+Comment" },
        },
      })
    end,
  },
}
