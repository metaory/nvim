return {
  "axelvc/template-string.nvim",
  dependencies = {
    "nvim-treesitter",
  },
  event = "InsertEnter",
  ft = require("metaory.lang").stack("vtsls"),
  config = function()
    require("template-string").setup({})
  end,
}
