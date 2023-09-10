return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VimEnter",
    opts = function(_, opts)
      table.insert(opts.filetype_exclude, "starter")
    end,
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "│", -- "▏",
      options = { try_as_border = true },
    },
  },
}
