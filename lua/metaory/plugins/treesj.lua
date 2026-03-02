return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter" },
  keys = {
    {
      -- "<space>cb",
      "gJ",
      function()
        require("treesj").toggle()
      end,
      desc = "Split/Join Block",
    },
  },
  init = function()
    local wk = require("which-key")
    wk.add({
      { "gj", icon = " " },
      { "gJ", icon = " " },
    })
  end,
  config = function()
    local ok, tsj = pcall(require, "treesj")
    if not ok then
      return
    end

    tsj.setup({
      use_default_keymaps = false,
      check_syntax_error = true,
      max_join_length = 180,
      cursor_behavior = "hold",

      -- Notify about possible problems or not
      notify = true,
      langs = {},
    })
  end,
}
