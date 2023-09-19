-- INFO: g= | gx | gm | go | gs | gj

return {
  {
    "echasnovski/mini.splitjoin",
    opts = { mappings = { toggle = "gj" } },
    keys = { { "gj", desc = "Split/Join" } },
  },
  {
    "echasnovski/mini.operators",
    event = "VeryLazy",
    config = true,
    opts = {
      evaluate = { prefix = "g=", func = nil },
      exchange = { prefix = "gx", reindent_linewise = true },
      multiply = { prefix = "gm", func = nil },
      replace = { prefix = "go", reindent_linewise = true },
      sort = { prefix = "gs", func = nil },
    },
  },
}
-- func = function(content)
--   if not H.is_content(content) then
--     H.error("`content` should be a content table.")
--   end
--   local lines, submode = content.lines, content.submode
--   -- In non-blockwise mode return the result of the last line
--   if submode ~= H.submode_keys.block then
--     return H.eval_lua_lines(lines)
--   end
--   -- In blockwise selection evaluate and return each line separately
--   return vim.tbl_map(function(l)
--     return H.eval_lua_lines({ l })[1]
--   end, lines)
-- end,
-- {
--   "sQVe/sort.nvim",
--   cmd = "Sort",
--   keys = { { "<leader>cas", "<CMD>Sort<CR>", mode = "v", desc = "Sort Selection" } },
-- },
