return {
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      keywords = {
        FIX = { icon = " ", color = "errr", alt = { "BUG" } },
        TODO = { icon = " ", color = "todo" },
        HACK = { icon = " ", color = "hack" },
        WARN = { icon = " ", color = "warn", alt = { "XXX" } },
        PERF = { icon = " ", color = "perf" },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = " ", color = "test" },
      },
      colors = {
        errr = { "MxTodoErrr", "ErrorMsg", "#DC2626" },
        todo = { "MxTodoTodo", "#2563EB" },
        hack = { "MxTodoHack", "DiagnosticInfo", "#2563EB" },
        warn = { "MxTodoWarn", "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        perf = { "MxTodoPerf", "WarningMsg", "#FBBF24" },
        hint = { "MxTodoHint", "DiagnosticHint", "#10B981" },
        test = { "MxTodoTest", "Identifier", "#FF00FF" },
        default = { "Identifier", "#7C3AED" },
      },
    },
    -- config = true,
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
  },
}
