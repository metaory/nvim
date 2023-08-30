-- :enew|put=execute('lua =package.loaded')
-- :enew|put=execute('lua =package.loaded')|setf lua
return {
  -- { "folke/which-key.nvim", enabled = false, },
  {
    -- http://vimcasts.org/episodes/aligning-text-with-tabular-vim
    "https://github.com/Vonr/align.nvim",
    keys = {
      {
        "gaa",
        function()
          local a = require("align")
          a.operator(a.align_to_char, { length = 1, reverse = true })
        end,
        mode = "n",
        desc = "Align to char",
        noremap = true,
        silent = true,
        expr = false,
      },
      {
        "gaw",
        function()
          local a = require("align")
          a.operator(a.align_to_string, { is_pattern = false, reverse = true, preview = true })
        end,
        mode = "n",
        desc = "Align to str",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor()
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  },
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      local default = {
        augend.case.new({
          types = {
            "camelCase",
            "snake_case",
            "kebab-case",
            "PascalCase",
            "SCREAMING_SNAKE_CASE",
          },
        }),
        augend.constant.new({
          elements = { "&&", "||" },
          word = false,
        }),
        augend.paren.alias.quote,
        -- augend.paren.alias.brackets,
        -- augend.constant.alias.weekday,
        -- augend.constant.alias.weekday_full,
        -- Saturday
        augend.integer.alias.decimal,
        augend.constant.alias.bool,
        augend.integer.alias.hex,
        -- augend.date.alias["%Y/%m/%d"],
        -- augend.date.alias["%Y-%m-%d"],

        augend.date.new({ pattern = "%Y/%m/%d", default_kind = "day" }),
        augend.date.new({ pattern = "%Y_%m_%d", default_kind = "day" }),
        -- only_valid = true, word = true,
        -- augend.semver.alias.semver,
      }
      require("dial.config").augends:register_group({ default = default })
      local javascriptTypescript = vim.list_extend({
        augend.constant.new({ elements = { "let", "const" } }),
        augend.constant.new({ elements = { "foo", "bar" } }),
        augend.constant.new({ elements = { "console.log", "info" } }),
      }, default)
      require("dial.config").augends:on_filetype({
        typescript = javascriptTypescript,
        javascript = javascriptTypescript,
        lua = vim.list_extend({
          augend.constant.new({ elements = { "and", "or" }, word = true }),
          augend.paren.alias.lua_str_literal,
        }, default),
        rust = vim.list_extend({ augend.paren.alias.rust_str_literal }, default),
        markdown = vim.list_extend({ augend.misc.alias.markdown_header }, default),
      })
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    cmd = "SymbolsOutline",
    opts = {},
  },
}
-- {
--   "nvim-cmp",
--   dependencies = { "hrsh7th/cmp-emoji" },
--   ---@param opts cmp.ConfigSchema
--   opts = function(_, opts)
--     local cmp = require("cmp")
--     opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
--     return opts
--   end,
-- },
-- {
--   "huggingface/hfcc.nvim",
--   opts = {
--     api_token = "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",
--     model = "bigcode/starcoder",
--     query_params = {
--       max_new_tokens = 200,
--     },
--   },
--   init = function()
--     vim.api.nvim_create_user_command("StarCoder", function()
--       require("hfcc.completion").complete()
--     end, {})
--   end,
-- },
-- {
--   "danymat/neogen",
--   keys = {
--     {
--       "<leader>cc",
--       function()
--         require("neogen").generate({})
--       end,
--       desc = "Neogen Comment",
--     },
--   },
--   opts = { snippet_engine = "luasnip" },
-- },

-- {
--   "echasnovski/mini.bracketed",
--   event = "BufReadPost",
--   config = function()
--     local bracketed = require("mini.bracketed")
--
--     -- local function put(cmd, regtype)
--     --   local body = vim.fn.getreg(vim.v.register)
--     --   local type = vim.fn.getregtype(vim.v.register)
--     --   ---@diagnostic disable-next-line: param-type-mismatch
--     --   vim.fn.setreg(vim.v.register, body, regtype or "l")
--     --   bracketed.register_put_region()
--     --   vim.cmd(('normal! "%s%s'):format(vim.v.register, cmd:lower()))
--     --   ---@diagnostic disable-next-line: param-type-mismatch
--     --   vim.fn.setreg(vim.v.register, body, type)
--     -- end
--     --
--     -- for _, cmd in ipairs({ "]p", "[p" }) do
--     --   vim.keymap.set("n", cmd, function()
--     --     put(cmd)
--     --   end)
--     -- end
--     -- for _, cmd in ipairs({ "]P", "[P" }) do
--     --   vim.keymap.set("n", cmd, function()
--     --     put(cmd, "c")
--     --   end)
--     -- end
--     --
--     -- local put_keys = { "p", "P" }
--     -- for _, lhs in ipairs(put_keys) do
--     --   vim.keymap.set({ "n", "x" }, lhs, function()
--     --     return bracketed.register_put_region(lhs)
--     --   end, { expr = true })
--     -- end
--
--     bracketed.setup({
--       file = { suffix = "" },
--       window = { suffix = "" },
--       quickfix = { suffix = "" },
--       yank = { suffix = "" },
--       treesitter = { suffix = "n" },
--     })
--   end,
-- },
-- augend.constant.alias.ja_weekday_full,
-- augend.constant.alias.alpha,
-- augend.constant.alias.Alpha,

-- require("dial.config").augends:on_filetype({
--   typescript = {
--     augend.integer.alias.decimal,
--     augend.integer.alias.hex,
--     augend.constant.new({ elements = { "let", "const" } }),
--   },
--   javascript = {
--     augend.integer.alias.decimal,
--     augend.constant.new({ elements = { "let", "const" } }),
--     augend.constant.alias.bool,
--   },
--   lua = {
--     augend.integer.alias.decimal,
--     augend.constant.alias.bool,
--   },
--   markdown = {
--     augend.integer.alias.decimal,
--     augend.misc.alias.markdown_header,
--   },
-- })
-- local augend = require("dial.augend")
-- require("dial.config").augends:register_group({
--   default = {
--     augend.integer.alias.decimal,
--     augend.integer.alias.hex,
--     augend.date.alias["%Y/%m/%d"],
--     augend.constant.alias.bool,
--     augend.semver.alias.semver,
--     augend.constant.new({ elements = { "let", "const" } }),
--   },
-- })
-- augend.date.alias["%Y/%m/%d"],
-- 2020/11/04
-- 2025_12_02
-- 1234
-- false
--   s
-- * n-ary (`3 <= n <= 36`) integers
-- * date
-- * constant (toggle a specific string, such as a keyword or operator)
--   * `true` ⇄ `true`
--   * `&&` ⇄ `||`
--   * `a` ⇄ `c` ⇄ ... ⇄ `z`
--   const foo = 'fvb'
--   sunday
--
-- augend.date.new({
--   pattern = "%Y/%m/%d",
--   default_kind = "day",
--   only_valid = false,
--   word = false,
-- }),
-- augend.constant.alias.alpha,
-- augend.constant.alias.Alpha,
