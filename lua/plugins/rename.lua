-- INFO: <LEADER> rw | rr | rs | rm

return {
  { -- XXX: RW
    "smjonas/inc-rename.nvim",
    config = true,
    cmd = "IncRename",
    keys = {
      {
        "<leader>rw",
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        desc = "Rename Word",
        noremap = true,
        silent = true,
        expr = true,
      },
    },
  },
  { -- XXX: RR
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    keys = {
      { "<leader>sr", false },
      { "<leader>rr", '<CMD>lua require("spectre").open()<CR>', desc = "Replace Spectre" },
    },
  },
  { -- XXX: RS
    "cshuaimin/ssr.nvim",
    keys = { { "<leader>rs", '<CMD>lua require("ssr").open()<CR>', mode = { "n", "x" }, desc = "Structural Replace" } },
  },
  { --_ XXX: RM
    "smoka7/multicursors.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "smoka7/hydra.nvim" },
    cmd = { "MCstart" },
    -- cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = { { "<Leader>rm", "<cmd>MCstart<cr>", desc = "Multi Cursor", mode = { "v", "n" } } },
    opts = {
      hint_config = { type = "window", border = "none", position = "bottom" },
      generate_hints = { normal = true, insert = true, extend = true },
    },
    config = function(_, opts)
      require("multicursors").setup(opts)
    end,
  },
}
