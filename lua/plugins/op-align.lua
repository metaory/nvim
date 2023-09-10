-- INFO: -- gaa | gaA

return {
  {
    "echasnovski/mini.align",
    opts = { mappings = { start_with_preview = "gaa", start = "gaA" }, silent = false },
    keys = {
      { "ga", nil, desc = "Align Operator" },
      { "gaa", nil, desc = "Align with preview" },
      { "gaA", nil, desc = "Align" },
    },
  },
  {
    "Vonr/align.nvim",
    enabled = false,
    keys = {
      { "ga", nil, desc = "Align Operator" },
      {
        "gaa",
        function()
          local a = require("align")
          a.operator(a.align_to_char, { length = 1, reverse = true })
        end,
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
        desc = "Align to str",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
  },
}

-- modifiers = {
--    Main option modifiers
--  ['s'] = --<function: enter split pattern>,
--  ['j'] = --<function: choose justify side>,
--  ['m'] = --<function: enter merge delimiter>,

--    Modifiers adding pre-steps
--  ['f'] = --<function: filter parts by entering Lua expression>,
--  ['i'] = --<function: ignore some split matches>,
--  ['p'] = --<function: pair parts>,
--  ['t'] = --<function: trim parts>,

--    Delete some last pre-step
--  ['<BS>'] = --<function: delete some last pre-step>,

--    Special configurations for common splits
--  ['='] = --<function: enhanced setup for '='>,
--  [','] = --<function: enhanced setup for ','>,
--  [' '] = --<function: enhanced setup for ' '>,
-- },
-- options = { split_pattern = "", justify_side = "left", merge_delimiter = "" },
-- steps = { pre_split = {}, split = nil, pre_justify = {}, justify = nil, pre_merge = {}, merge = nil },
