return {
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.surround",
    keys = {
      { "gza", nil, desc = "Add surrounding" },
      { "gzd", desc = "Delete surrounding" },
      { "gzf", desc = "Find right surrounding" },
      { "gzF", desc = "Find left surrounding" },
      { "gzh", desc = "Highlight surrounding" },
      { "gzr", desc = "Replace surrounding" },
      { "gzn", desc = "Update `MiniSurround.config.n_lines`" },
    },
    opts = {
      mappings = {
        add = "gza", -- Add surrounding in Normal and Visual modes
        delete = "gzd", -- Delete surrounding
        find = "gzf", -- Find surrounding (to the right)
        find_left = "gzF", -- Find surrounding (to the left)
        highlight = "gzh", -- Highlight surrounding
        replace = "gzr", -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
  },

  {
    "echasnovski/mini.ai",
    -- keys = { { "a", mode = { "x", "o" } }, { "i", mode = { "x", "o" } } },
    event = "VeryLazy",
    dependencies = { "nvim-treesitter-textobjects" },
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        },
      }
    end,
    config = function(_, opts)
      require("mini.ai").setup(opts)
      -- TODO:
      -- require("lazyvim.util").on_load("which-key.nvim", function()
      --   local i = {
      --     [" "] = "Whitespace",
      --     ['"'] = 'Balanced "',
      --     ["'"] = "Balanced '",
      --     ["`"] = "Balanced `",
      --     ["("] = "Balanced (",
      --     [")"] = "Balanced ) including white-space",
      --     [">"] = "Balanced > including white-space",
      --     ["<lt>"] = "Balanced <",
      --     ["]"] = "Balanced ] including white-space",
      --     ["["] = "Balanced [",
      --     ["}"] = "Balanced } including white-space",
      --     ["{"] = "Balanced {",
      --     ["?"] = "User Prompt",
      --     _ = "Underscore",
      --     a = "Argument",
      --     b = "Balanced ), ], }",
      --     c = "Class",
      --     f = "Function",
      --     o = "Block, conditional, loop",
      --     q = "Quote `, \", '",
      --     t = "Tag",
      --   }
      --   local a = vim.deepcopy(i)
      --   for k, v in pairs(a) do
      --     a[k] = v:gsub(" including.*", "")
      --   end
      --
      --   local ic = vim.deepcopy(i)
      --   local ac = vim.deepcopy(a)
      --   for key, name in pairs({ n = "Next", l = "Last" }) do
      --     i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
      --     a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
      --   end
      --   require("which-key").register({
      --     mode = { "o", "x" },
      --     i = i,
      --     a = a,
      --   })
      -- end)
    end,
  },
}
