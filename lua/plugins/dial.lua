return {
  "monaqa/dial.nvim",
  keys = {
    {
      "<C-a>",
      function()
        return vim.bo[vim.api.nvim_win_get_buf(0)].modifiable and require("dial.map").inc_normal()
      end,
      expr = true,
      desc = "Increment",
    },
    {
      "<C-x>",
      function()
        return vim.bo[vim.api.nvim_win_get_buf(0)].modifiable and require("dial.map").dec_normal()
      end,
      expr = true,
      desc = "Decrement",
    },
  },
  config = function()
    local augend = require("dial.augend")
    -- augend.semver.alias.semver, augend.paren.alias.brackets,
    local default = {
      augend.case.new({ types = { "camelCase", "snake_case", "kebab-case", "PascalCase", "SCREAMING_SNAKE_CASE" } }),
      augend.constant.new({ elements = { "&&", "||" }, word = false }),
      augend.constant.new({ elements = { "on", "off" }, word = false }),
      augend.constant.new({ elements = { "left", "right" }, word = false }),
      augend.constant.new({ elements = { "up", "down" }, word = false }),
      augend.paren.alias.quote,
      augend.integer.alias.decimal,
      augend.constant.alias.bool,
      augend.integer.alias.hex,
      augend.date.new({ pattern = "%Y/%m/%d", default_kind = "day" }),
      augend.date.new({ pattern = "%Y-%m-%d", default_kind = "day" }),
      augend.date.new({ pattern = "%Y_%m_%d", default_kind = "day" }),
    }

    local javascript = vim.list_extend({
      augend.constant.new({ elements = { "let", "const" } }),
      augend.constant.new({ elements = { "foo", "bar" } }),
    }, default)

    require("dial.config").augends:register_group({ default = default })

    require("dial.config").augends:on_filetype({
      typescript = javascript,
      javascript = javascript,
      lua = vim.list_extend({
        augend.constant.new({ elements = { "and", "or" }, word = true }),
        augend.paren.alias.lua_str_literal,
      }, default),
      rust = vim.list_extend({ augend.paren.alias.rust_str_literal }, default),
      markdown = vim.list_extend({ augend.misc.alias.markdown_header }, default),
    })
  end,
}
