local opts = {
  signs = {
    enable = false,
    position = "right_align",
    separator = " ",
    icons = {
      quickfix = " ",
      refactor = "󰁨 ",
      source = " ",
      combined = "󱉔 ",
    },
    highlights = {
      quickfix = "DiagnosticInfo",
      refactor = "DiagnosticInfo",
      source = "DiagnosticInfo",
      combined = "DiagnosticInfo",
      label = "DiagnosticInfo",
    },
  },
  mappings = {
    code_action = "<leader>a",
  },
}

return {
  "luckasRanarison/clear-action.nvim",
  dependencies = "folke/which-key.nvim",
  event = "LspAttach",
  init = function()
    require("which-key").add({
      { "<leader>a", group = "Code Action" },
    })
  end,
  opts = opts,
}
