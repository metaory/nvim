-- :enew|put=execute('lua =package.loaded')
-- :enew|put=execute('lua =package.loaded')|setf lua
--  map <expr> (:h map-<expr>)
-- nnoremap <expr> Q yourConditionExpression ? ':q!<cr>':':bd<cr>'

return {
  -- { "folke/which-key.nvim", enabled = false, },
  -- http://vimcasts.org/episodes/aligning-text-with-tabular-vim
  -- {
  --   "echasnovski/mini.align",
  --   opts = { mappings = { start = "ga", start_with_preview = "gA" } },
  --   keys = { { "gA", nil } },
  --   config = true,
  -- },
  {
    "Vonr/align.nvim",
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
    keys = {
      {
        "<leader>rw",
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        mode = "n",
        desc = "Rename Word",
        noremap = true,
        silent = true,
        expr = true,
      },
    },
    config = true,
  },

  -- {
  --   "ThePrimeagen/refactoring.nvim",
  --   keys = {
  --     {
  --       "<leader>lx",
  --       function()
  --         require("refactoring").select_refactor()
  --       end,
  --       mode = "v",
  --       noremap = true,
  --       silent = true,
  --       expr = false,
  --     },
  --   },
  --   opts = {},
  -- },
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return vim.bo[vim.api.nvim_win_get_buf(0)].modifiable and require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return vim.bo[vim.api.nvim_win_get_buf(0)].modifiable and require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
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
        augend.constant.new({ elements = { "&&", "||" }, word = false }),
        augend.constant.new({ elements = { "on", "off" }, word = false }),
        augend.constant.new({ elements = { "left", "right" }, word = false }),
        augend.constant.new({ elements = { "up", "down" }, word = false }),
        augend.paren.alias.quote,
        -- augend.paren.alias.brackets,
        augend.integer.alias.decimal,
        augend.constant.alias.bool,
        augend.integer.alias.hex,
        augend.date.new({ pattern = "%Y/%m/%d", default_kind = "day" }),
        augend.date.new({ pattern = "%Y-%m-%d", default_kind = "day" }),
        augend.date.new({ pattern = "%Y_%m_%d", default_kind = "day" }),
        -- augend.semver.alias.semver,
      }
      require("dial.config").augends:register_group({ default = default })
      local javascript = vim.list_extend({
        augend.constant.new({ elements = { "let", "const" } }),
        augend.constant.new({ elements = { "foo", "bar" } }),
      }, default)
      require("dial.config").augends:on_filetype({
        typescript = javascript,
        javascript = javascript,
        lua = vim.list_extend({
          augend.constant.new({ elements = { "and", "or" }, word = true }),
          -- augend.paren.alias.lua_str_literal,
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
  {
    "L3MON4D3/LuaSnip",
    -- opts = {history = true, delete_check_events = "TextChanged",},
    keys = {
      {
        "<tab>",
        function()
          local ls = require("luasnip")

          if ls.choice_active() then
            return "<Plug>luasnip-next-choice"
          end

          if ls.jumpable(1) then
            return "<Plug>luasnip-jump-next"
          end

          return "<tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "<tab>",
        function()
          require("luasnip").jump(1)
        end,
        mode = "s",
      },
      {
        "<s-tab>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
      },
    },
  },
  -- /home/meta/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/coding.lua:70
  -- /home/meta/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/coding.lua:24
  -- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md?plain=1#L3339
  -- https://github.com/L3MON4D3/LuaSnip/blob/master/doc/luasnip.txt#L754C1-L755C1
  -- {
  --     "hrsh7th/nvim-cmp",
  --     dependencies = {{"Saecki/crates.nvim", event = { "BufRead Cargo.toml" }, config = true,},},
  --     opts = function(_, opts)
  --       local cmp = require("cmp")
  --       opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {{ name = "crates" },}))
  --     end,
  --   }
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
-- keys = {
-- vim.bo[vim.api.nvim_win_get_buf(0)].modifiable
-- {
--   "<C-c>",
--   function() return vim.bo[vim.api.nvim_win_get_buf(0)].modifiable and require("mini.comment").operator("visual") end,
--   expr = true,
--   desc = "Comment",
-- },
-- {
--   "<C-c>",
--   -- ":normal gcc<CR>",
--   -- (g == 0 ? ':undo' : ':redo')
--   -- ":(g == 0 ? ':undo' : ':redo') normal gcc<CR>",
--   -- "if &modifiable | ':normal gcc<cr>' | endif",
--   -- [[:lua MiniComment.operator('visual')<cr>]],
--   [[:<c-u>lua MiniComment.operator('visual')<cr>]],
--   -- function()
--   --   -- vim.cmd(":lua MiniComment.operator('visual')<cr>")
--   --   return require("mini.comment").operator("visual")
--   -- end,
--   -- expr = true,
--   --silent = true,
--   mode = "x",
-- },
-- },
-- {
--   "echasnovski/mini.comment",
-- opts = {
--   mappings = {
--     -- Toggle comment (like `gcip` - comment inner paragraph) for both
--     -- Normal and Visual modes
--     comment = "gc",
--     -- Toggle comment on current line
--     comment_line = "gcc",
--     -- Define 'comment' textobject (like `dgc` - delete whole comment block)
--     textobject = "gc",
--   },
--   -- options = {
--   --   custom_commentstring = function()
--   --     return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
--   --   end,
--   -- },
-- },
-- event = "VeryLazy",
--   cond = function()
--     local buf = vim.api.nvim_win_get_buf(0)
--     if vim.bo[buf].modifiable then
--       return true
--     end
--     vim.notify("NOT MODIFIABLE", vim.log.levels.WARN, { title = "OYXXX" })
--     return false
--   end,
-- },
-- cond = function()
--   -- lua =vim.bo[vim.api.nvim_win_get_buf(0)].modifiable
--   local buf = vim.api.nvim_win_get_buf(0)
--   local modifiable = vim.bo[buf].modifiable
--   vim.notify(tostring(modifiable), vim.log.levels.WARN, { title = "is modifiable?" })
--   return modifiable
--   --   if vim.bo[buf].modifiable then
--   --     return true
--   --   end
--   --   vim.notify("NOT MODIFIABLE")
--   --   return false
-- end,
