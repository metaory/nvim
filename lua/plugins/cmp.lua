return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()
    return {
      completion = { completeopt = "menu,menuone,noinsert" },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = function(_, item)
          local icons = require("user.theme").icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end
          return item
        end,
      },
      experimental = { ghost_text = { hl_group = "CmpGhostText" } },
      sorting = defaults.sorting,
    }
  end,
}

-- XXX: 'hrsh7th/cmp-cmdline'

-- opts = {history = true, delete_check_events = "TextChanged",},
-- keys = function() return {} end,
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

-- http://vimcasts.org/episodes/aligning-text-with-tabular-vim

--  map <expr> (:h map-<expr>)
-- :enew|put=execute('lua =package.loaded')
-- :enew|put=execute('lua =package.loaded')|setf lua
-- nnoremap <expr> Q yourConditionExpression ? ':q!<cr>':':bd<cr>'
