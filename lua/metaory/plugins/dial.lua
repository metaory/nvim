return {
  "monaqa/dial.nvim",
  keys = {
    { "<C-a>", mode = "n" },
    { "<C-x>", mode = "n" },
    { "g<C-a>", mode = "n" },
    { "g<C-x>", mode = "n" },
    { "<C-a>", mode = "x" },
    { "<C-x>", mode = "x" },
    { "g<C-a>", mode = "x" },
    { "g<C-x>", mode = "x" },
  },
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.date.alias["%Y-%m-%d"],
        augend.date.alias["%m/%d"],
        augend.date.alias["%H:%M"],
        augend.constant.alias.bool,
      },
    })
    local map = require("dial.map")
    vim.keymap.set("n", "<C-a>", function()
      map.manipulate("increment", "normal")
    end)
    vim.keymap.set("n", "<C-x>", function()
      map.manipulate("decrement", "normal")
    end)
    vim.keymap.set("n", "g<C-a>", function()
      map.manipulate("increment", "gnormal")
    end)
    vim.keymap.set("n", "g<C-x>", function()
      map.manipulate("decrement", "gnormal")
    end)
    vim.keymap.set("x", "<C-a>", function()
      map.manipulate("increment", "visual")
    end)
    vim.keymap.set("x", "<C-x>", function()
      map.manipulate("decrement", "visual")
    end)
    vim.keymap.set("x", "g<C-a>", function()
      map.manipulate("increment", "gvisual")
    end)
    vim.keymap.set("x", "g<C-x>", function()
      map.manipulate("decrement", "gvisual")
    end)
  end
}
