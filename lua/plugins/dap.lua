return {
  {
    "mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "python" },
    },
  },
  { "mfussenegger/nvim-dap-python", enabled = false },
  {
    "stevearc/overseer.nvim",
    cmd = { "OverseerInfo" },
    config = true,
    dependencies = { "nvim-dap" },
  },

  -- {
  --   "sainnhe/gruvbox-material",
  --   priority = 10000,
  --   lazy = false,
  --   config = function()
  --     vim.g.gruvbox_material_foreground = "original"
  --     vim.g.gruvbox_material_background = "medium"
  --     vim.cmd.colorscheme("gruvbox-material")
  --   end,
  -- },
}
