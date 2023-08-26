return {
  {
    "folke/twilight.nvim",
    cmd = "Twilight",
  },
  {
    "echasnovski/mini.splitjoin",
    opts = { mappings = { toggle = "<C-c>" } },
    keys = { { "gj", desc = "Split/Join" } },
  },
  -- {
  --   "Wansmer/treesj",
  --   keys = {
  --     { "gj", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
  --   },
  --   opts = { use_default_keymaps = false, max_join_length = 150 },
  -- },

  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>rr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },
  {
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<leader>rR",
        function()
          require("ssr").open()
        end,
        mode = { "n", "x" },
        desc = "Structural Replace",
      },
    },
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  -- {
  --   "andymass/vim-matchup",
  --   event = "BufReadPost",
  --   enabled = false,
  --   init = function()
  --     vim.o.matchpairs = "(:),{:},[:],<:>"
  --   end,
  --   config = function()
  --     vim.g.matchup_matchparen_deferred = 1
  --     vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
  --   end,
  -- },
}
