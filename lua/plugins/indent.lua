return {
  {
    "lukas-reineke/indent-blankline.nvim",
    -- event = "VimEnter",
    version = "2.20.8",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      char = "│",
      filetype_exclude = {
        "alpha",
        "dashboard",
        "help",
        "lazy",
        "lazyterm",
        "mason",
        "neo-tree",
        "notify",
        "starter",
        "toggleterm",
        "Trouble",
      },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      symbol = "│", -- "▏",
      options = { try_as_border = true },
    },
    -- init = function()
    --   vim.api.nvim_create_autocmd("FileType", {
    --     pattern = {
    --       "alpha",
    --       "dashboard",
    --       "help",
    --       "lazy",
    --       "lazyterm",
    --       "mason",
    --       "neo-tree",
    --       "notify",
    --       "starter",
    --       "toggleterm",
    --       "Trouble",
    --     },
    --     callback = function()
    --       vim.b.miniindentscope_disable = true
    --     end,
    --   })
    -- end,
  },
}
