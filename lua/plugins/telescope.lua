return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          i = {
            -- ["<esc>"] = require("telescope.actions").close,
            ["<C-u>"] = false,
            ["<esc>"] = "close",
            -- ["<C-d>"] = "scroll_results",
            ["<C-d"] = function(prompt_bufnr)
              require("telescope.actions").action_set.scroll_results(prompt_bufnr, 1)
              -- require("telescope.actions.state").get_selected_entry()
            end,

            -- ["<C-i>"] = "select_default",
            -- ["<C-a>"] = require("telescope.actions").edit_search_line("foo"),
            -- ["<C-i>"] = require("telescope.actions").select_default,
          },
        },
      },
    },
  },
}
