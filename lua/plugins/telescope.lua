return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    lazy = true,
    config = function(LazyPlugin, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("dap")
    end,
    opts = {
      extensions = {
        file_browser = {
          theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              -- your custom insert mode mappings
            },
            ["n"] = {
              -- your custom normal mode mappings
            },
          },
        },
        dap = {
          -- commands = nil,
          -- configurations = nil,
          -- list_breakpoints = nil,
          -- variables = nil,
          -- frames = nil,
        },
      },
      defaults = {
        -- layout_strategy = "horizontal",
        -- layout_config = { prompt_position = "top" },
        -- sorting_strategy = "ascending",
        -- winblend = 0,
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
          },
        },
        file_ignore_patterns = {
          -- "node_modules",
          -- "%a*.d.ts$",
          "^node_modules/%a+/%a*.d.ts$",
          "build",
          "dist",
          "package-lock.json",
          "%a*.-lock.json",
          "yarn.lock",
          "%a*.log",
        },
      },
    },
  },
}
