return {
  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   -- cmd = "Telescope file_browser",
  --   -- dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  --   -- opt = true,
  --   -- config = function()
  --   --   require("telescope").load_extension("file_browser")
  --   -- end,
  -- },
  --
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-file-browser.nvim",
        config = function()
          require("telescope").load_extension("file_browser")
        end,
      },
    },
    keys = {
      {
        "<leader>fc",
        function()
          require("telescope.builtin").find_files({
            cwd = vim.fn.stdpath("config"),
            -- cwd = "~/.config/nvim",
            -- echo stdpath('config')
          })
        end,
        desc = "Find Config File",
      },
      {
        "<leader>fx",
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
        file_ignore_patterns = { "^.git/", "^node_modules/" },
        -- A table of lua regex that define the files that should be ignored.
        -- Example: { "^scratch/" } -- ignore all files in scratch directory
        -- Example: { "%.npz" } -- ignore all npz files
        mappings = {
          i = {
            ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
            ["<C-o>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
            ["<C-Space>"] = require("telescope.actions").toggle_selection
              + require("telescope.actions").move_selection_worse,
            ["<esc>"] = "close",
          },
        },
        winblend = 0,
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    keys = {
      { "<leader>sT", false },
    },
  },
}
-- actions = {
--   "cycle_previewers_next",
--   "delete_buffer",
--   "open_loclist",
--   "open_qflist",
--   "smart_add_to_loclist",
--   "smart_send_to_loclist",
--   "smart_add_to_qflist",
--   "smart_send_to_qflist",
--   "add_to_loclist",
--   "send_to_loclist",
--   "add_selected_to_loclist",
--   "send_selected_to_loclist",
--   "add_to_qflist",
--   "send_to_qflist",
--   "add_selected_to_qflist",
--   "send_selected_to_qflist",
--   "git_staging_toggle",
--   "git_checkout_current_buffer",
--   "git_reset_hard",
--   "git_reset_soft",
--   "git_reset_mixed",
--   "git_rebase_branch",
--   "git_merge_branch",
--   "git_delete_branch",
--   "git_track_branch",
--   "git_switch_branch",
--   "git_checkout",
--   "git_apply_stash",
--   "git_create_branch",
--   "insert_value",
--   "insert_symbol_i",
--   "insert_symbol",
--   "paste_register",
--   "edit_register",
--   "set_search_line",
--   "edit_search_line",
--   "set_command_line",
--   "edit_command_line",
--   "_close",
--   "file_tab",
--   "file_vsplit",
--   "file_split",
--   "file_edit",
--   "select_tab_drop",
--   "select_drop",
--   "select_tab",
--   "select_vertical",
--   "select_horizontal",
--   "select_default",
--   "results_scrolling_right",
--   "results_scrolling_left",
--   "results_scrolling_down",
--   "results_scrolling_up",
--   "preview_scrolling_right",
--   "preview_scrolling_left",
--   "toggle_all",
--   "drop_all",
--   "select_all",
--   "move_to_bottom",
--   "move_to_middle",
--   "move_to_top",
--   "move_selection_better",
--   "move_selection_worse",
--   "move_selection_previous",
--   "move_selection_next",
--   "close",
--   "add_selection",
--   "remove_selection",
--   "toggle_selection",
--   "nop",
--   "_clear",
--   "close_pum",
--   "preview_scrolling_down",
--   "which_key",
--   "preview_scrolling_up",
--   "center",
--   "complete_tag",
--   "cycle_history_next",
--   "cycle_history_prev",
--   "to_fuzzy_refine",
--   "remove_selected_picker",
--   "cycle_previewers_prev",
-- },
-- ["<C-j>"] = {
--   actions.move_selection_next, type = "action",
--   opts = { nowait = true, silent = true }
-- },
-- ["<esc>"] = require("telescope.actions").close,
-- ["<C-s>"] = false,
--   "add_selection",
-- ["<C-u>"] = function(prompt_bufnr)
--   -- mxdump("c-u", "telescope")
--   -- require("telescope.actions.state").get_selected_entry()
--   return false
-- end,
-- ["<C-e>"] = "cycle_previewers_next",
-- ["<C-e>"] = function(prompt_bufnr)
--   require("telescope.actions").toggle_preview()
-- end,
-- ["<C-e>"] = "command_history",
--   "smart_send_to_qflist",
--   "add_to_loclist",
--   "send_to_loclist",
--   "add_selected_to_loclist",
--   "send_selected_to_loclist",
--   "add_to_qflist",
--   "send_to_qflist",
--   "add_selected_to_qflist",
--   "send_selected_to_qflist",
-- ["<C-d>"] = "scroll_results",
-- ["<C-d"] = function(prompt_bufnr)
--   mxdump("umm", "telescope")
--   -- require("telescope.actions").action_set.scroll_results(prompt_bufnr, 1)
--   -- require("telescope.actions.state").get_selected_entry()
--   return false
-- end,

-- ["<C-i>"] = "select_default",
-- ["<C-a>"] = require("telescope.actions").edit_search_line("foo"),
-- ["<C-i>"] = require("telescope.actions").select_default,
-- {
--   "nvim-telescope/telescope-fzf-native.nvim",
--   build = "make",
--   config = function()
--     require("telescope").load_extension("fzf")
--   end,
-- },
