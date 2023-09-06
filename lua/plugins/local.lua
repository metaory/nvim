return {
  {
    "tsakirist/telescope-lazy.nvim",
    config = function()
      require("telescope").load_extension("lazy")
    end,
    keys = { { "<leader>sl", ":Telescope lazy<CR>", desc = "Lazy", mode = "n" } },
  },
}

-- {dir = "user.plugins.telescope-xorg", dev = true, config = function() require("telescope").load_extension("lazy") end,},
-- {dir = "user.plugins.telescope-starter", dev = true, config = function() require("telescope").load_extension("color_names") end,},
