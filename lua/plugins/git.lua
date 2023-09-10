-- INFO: <LEADER> EGI

return {
  {
    "wintermute-cell/gitignore.nvim",
    cmd = "Gitignore",
    keys = { { "<leader>egi", "<CMD>Gitignore<CR>", desc = "Gen Gitignore" } },
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
}
