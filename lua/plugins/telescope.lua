return {
  {
    "telescope.nvim",
    dependencies = {
      --stylua: ignore
      { "nvim-telescope/telescope-file-browser.nvim", config = function() require("telescope").load_extension("file_browser") end },
    },
    keys = {
      { "<leader><space>", nil },
      -- { "<leader><space>", "<Space>", mode = "n" },
      { "<leader>sH", ":Telescope highlights<CR>", desc = "Highlights", mode = "n" },
      { "<leader>sx", ":Telescope builtin<CR>", desc = "Builtin", mode = "n" },
      { "<M-g>", ":Telescope live_grep<CR>", mode = "n" },
      { "<M-f>", ":Telescope find_files<CR>", mode = "n" },
      { "<M-F>", ":Telescope find_files hidden=true<CR>", mode = "n" },
      { "<M-o>", ":Telescope oldfiles<CR>", mode = "n" },
      { "<M-r>", ":Telescope resume<CR>", mode = "n" },
      { "<M-b>", ":Telescope file_browser<CR>", mode = "n" },
      -- { "<leader>sr", ":Telescope resume<CR>", desc = "Resume", },
      -- { "<M-m>", ":Telescope keymaps<CR>", mode = "n" },
      -- { "<M-C>", ":Telescope commands<CR>", mode = "n" },
      { "<leader>fr", ":MxFileRename<CR>", desc = "File Rename", mode = "n" },
-- vim.keymap.set("n", "<leader>fr", ":MxFileRename<CR>", { noremap = true, desc = "File Rename" })
      --stylua: ignore
      {"<leader>fc", function() require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File", mode = 'n',},
      --stylua: ignore
      {"<leader>fx", function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end, desc = "Find Plugin File", mode = 'n',},
    },
    -- XXX:
    -- Telescope find_files theme=dropdown
    -- Telescope find_files theme=ivy
    -- Telescope find_files theme=cursor
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        -- layout_strategy = "bottom_pane",

        -- layout_strategy = "center",
        -- sorting_strategy = "ascending",
        sorting_strategy = "descending",
        -- layout_config = { prompt_position = "bottom" },
        -- layout_config = { height = 0.4 },

        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            width = 0.9,
            preview_width = 0.6,
          },
          center = { prompt_position = "top" },
        },
        -- layout_config = { bottom_pane = { prompt_position = "bottom" } },
        wrap_results = false,
        border = true,
        preview = { treesitter = true },
        -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        file_ignore_patterns = { "^.git/", "^node_modules/" },
        -- A table of lua regex that define the files that should be ignored.
        -- Example: { "^scratch/" } -- ignore all files in scratch directory
        -- Example: { "%.npz" } -- ignore all npz files
        mappings = {
          i = {
            ["<esc>"] = "close",

            ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
            ["<C-o>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
            ["<C-Space>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_worse,

            ["<C-h>"] = require("telescope.actions").results_scrolling_left,
            ["<C-l>"] = require("telescope.actions").results_scrolling_right,

            ["<C-S-P>"] = require("telescope.actions").results_scrolling_up,
            ["<C-S-N>"] = require("telescope.actions").results_scrolling_down,

            ["<C-S-H>"] = require("telescope.actions").preview_scrolling_left,
            ["<C-S-L>"] = require("telescope.actions").preview_scrolling_right,

            -- ["<C-f>"] = function(...) return require("telescope.actions").preview_scrolling_down(...) end,
            -- ["<C-b>"] = function(...) return require("telescope.actions").preview_scrolling_up(...) end,
          },
        },
        winblend = 0,
      },
    },
  },
  {
    "ahmedkhalf/project.nvim",
    opts = {},
    config = function(_, opts)
      require("project_nvim").setup(opts)
      require("telescope").load_extension("projects")
    end,
    keys = {
      { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects", mode = "n" },
    },
  },
  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   keys = {
  --     { "<M-b>", ":Telescope file_browser<CR>", desc = "Find Config File" },
  --   },
  --   opts = {},
  --   config = function(_, opts)
  --     require("file-browser.nvim").setup(opts)
  --     require("telescope").load_extension("file_browser")
  --   end,
  -- },
  -- {
  --
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   -- cmd = "Telescope file_browser",
  --   -- dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  --   -- opt = true,
  --   -- config = function()
  --   --   require("telescope").load_extension("file_browser")
  --   -- end,
  -- },
  --
  -- {
  --   "nat-418/telescope-color-names.nvim",
  --   keys = {
  --     {
  --       "<M-i>",
  --       function()
  --         -- require("telescope").load_extension("tailiscope")
  --         -- require("telescope").extensions.tailiscope.tailiscope()
  --         require("telescope").load_extension("color_names")
  --         require("telescope").extensions.color_names.color_names()
  --         -- :Telescope color_names
  --       end,
  --     },
  --   },
  -- },
  -- {
  --   dir = "user.plugins.telescope-starter",
  --   -- config = true,
  --   -- dev = true,
  --   keys = {
  --     {
  --       "<M-i>",
  --       function()
  --         -- require("telescope").load_extension("color_names")
  --         -- require("telescope").extensions.color_names.color_names()
  --       end,
  --     },
  --   },
  -- },
  -- {
  --   "debugloop/telescope-undo.nvim",
  --   config = true,
  --   keys = {
  --     {
  --       "<M-i>",
  --       function()
  --         -- require("telescope").setup({ extensions = { undo = {} } })
  --         require("telescope").load_extension("undo")
  --         vim.cmd([[ Telescope undo ]])
  --         -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
  --         -- require("telescope").load_extension("color_names")
  --         -- require("telescope").extensions.color_names.color_names()
  --       end,
  --     },
  --   },
  -- },
  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   keys = {
  --     {
  --       "<M-b>",
  --       function()
  --         require("telescope").load_extension("file_browser")
  --         require("telescope").extensions.file_browser.file_browser()
  --       end,
  --     },
  --   },
  -- },
}
-- {
--   "folke/todo-comments.nvim",
-- dependencies = { "nvim-telescope/telescope.nvim" },
-- keys = {
--   { "<leader>sT", false, { desc = "TODO Tel" } },
-- },
-- },
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
-- { "<leader>sw", Util.telescope("grep_string", { word_match = "-w" }), desc = "Word (root dir)" },
-- { "<leader>sW", Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
-- { "<leader>sw", Util.telescope("grep_string"), mode = "v", desc = "Selection (root dir)" },
-- { "<leader>sW", Util.telescope("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)" },
-- { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
