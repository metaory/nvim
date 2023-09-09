return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
      {
        "<leader>fe",
        '<CMD>lua require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })<CR>',
        desc = "Explorer [] neo",
      },
      {
        "<leader>fE",
        '<CMD>lua require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })<CR>',
        desc = "Explorer [] neo",
      }, -- ·
    },
    opts = {
      default_component_configs = {
        icon = {
          folder_closed = "", --               -- /home/meta/dev/meta/municode/dumps/uni-etc:69
          folder_open = "",
          folder_empty = "",
          default = "", --   
          highlight = "NeoTreeFileIcon",
        },
        modified = { symbol = "[]", highlight = "NeoTreeModified" },
        git_status = {
          symbols = {
            added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "✖", -- this can only be used in the git_status source
            renamed = "", -- this can only be used in the git_status source
            untracked = "",
            ignored = "",
            unstaged = "",
            staged = "", -- 
            conflict = "",
          },
        },
      },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_hidden = true,
          hide_by_name = {}, --"node_modules"
          hide_by_pattern = {}, --"*.meta", "*/src/*/tsconfig.json",
          always_show = { ".gitignore" }, -- remains visible even if other settings would normally hide it
          never_show = {}, --".DS_Store", "thumbs.db"
          never_show_by_pattern = {}, --".null-ls_*",
        },
        group_empty_dirs = false,
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = false,
        window = {
          mappings = {
            ["o"] = "system_open",
            ["l"] = "open",
            ["h"] = "close_node",
            ["L"] = "focus_preview",
            ["<space>"] = "toggle_node",
          },
        },
        commands = {
          system_open = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            path = vim.fn.shellescape(path, 1)
            vim.api.nvim_command("silent !xdg-open " .. path)
          end,
        },
      },
      mapping_options = { noremap = true, nowait = true },
      window = { position = "right", editor = "win" },
      -- sync_root_with_cwd = true,
      -- respect_buf_cwd = true,
      -- update_focused_file = {enable = true, update_root = true,},
      -- mappings = { ["<space>"] = "none", },
    },
  },
  {
    "echasnovski/mini.files",
    opts = {
      mappings = { go_in = "l", go_in_plus = "<CR>" },
      windows = { preview = true, width_focus = 30, width_preview = 30 },
      options = { use_as_default_explorer = true },
    },
    keys = {
      { "<leader>fm", '<CMD>lua require("mini.files").open()<CR>', desc = "Explorer [] mini" },
      { "<leader>fM", '<CMD>require("mini.files").open(vim.loop.cwd(), true)<CR>', desc = "Explorer [] mini" }, -- ·
    },
  },
  -- require'nvim-web-devicons'.setup
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        -- zsh = { icon = "", color = "#428850", cterm_color = "65", name = "Zsh" },
        -- lua = { icon = "", color = "#428850", name = "Lua" },
        -- Dockerfile = { icon = "", color = "#1795ea", name = "Dockerfile" },
        ["Dockerfile"] = {
          icon = "",
          color = "#1795ea",
          cterm_color = "25",
          name = "Dockerfile",
        },
      },
      color_icons = true, --  (default to true)
      default = true, --  (default to false)
      strict = false, -- (default to false)
      -- override_by_filename = {[".gitignore"] = {icon = "", color = "#f1502f", name = "Gitignore",},},
      override_by_filename = {
        ["Dockerfile"] = { icon = "", color = "#1795ea", name = "Dockerfile" },
      },
      override_by_extension = {
        ["txt"] = { icon = "", color = "#81e043", name = "txt" },
        ["log"] = { icon = "", color = "#81e043", name = "log" },
      },
    },
  },
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = { { "<Leader>f<Space>", "<CMD>Oil<CR>", desc = "Explorer [] oil" } },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      default_file_explorer = true,
      columns = { "icon" }, -- "permissions", "size", "mtime",
      buf_options = { swapfile = true }, -- buflisted = false, bufhidden = "hide",
      skip_confirm_for_simple_edits = false,
      -- win_options = {wrap = false, signcolumn = "no", cursorcolumn = false, foldcolumn = "0", spell = false, list = false, conceallevel = 3, concealcursor = "n",},
      -- restore_win_options = true,
      -- delete_to_trash = false,
      -- trash_command = "trash-put",
      -- prompt_save_on_select_new_entry = true,
      keymaps = {
        ["<BS>"] = "actions.parent",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["f"] = "<CMD>lua require'telescope.builtin'.find_files{}<CR>",
        ["q"] = "actions.close",
        ["P"] = "actions.preview",
        ["gy"] = "actions.copy_entry_path",
        ["gh"] = "actions.toggle_hidden",
      },
      use_default_keymaps = true,
      view_options = { show_hidden = false },
      float = { padding = 2, max_width = 0, max_height = 0, border = "rounded", win_options = { winblend = 10 } },
      -- override = function(conf) return conf end,
      preview = {
        max_width = 0.9, -- {100, 0.8} means "the lesser of 100 columns or 80% of total"
        min_width = { 40, 0.4 }, -- {40, 0.4} means "the greater of 40 columns or 40% of total"
        width = nil,
        max_height = 0.9, -- {80, 0.9} means "the lesser of 80 columns or 90% of total"
        min_height = { 5, 0.1 }, -- {5, 0.1} means "the greater of 5 columns or 10% of total"
        height = nil,
        border = "rounded",
        win_options = { winblend = 0 },
      },
      progress = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = { 10, 0.9 },
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        minimized_border = "none",
        win_options = { winblend = 0 },
      },
    },
  },
}

-- ██  ██  ██ █│E5108: Error executing lua: (mini.files) `path` is not a valid path ("/home/meta/.config/nvim/Starter")        │
-- ██  ██ ██   │stack traceback:                                                                                               │
--   ██ █        │  [C]: in function 'error'                                                                                     │
-- █           │  ...eta/.local/share/nvim/lazy/mini.files/lua/mini/files.lua:2490: in function 'error'                        │
-- █ shared @ m│  ...eta/.local/share/nvim/lazy/mini.files/lua/mini/files.lua:667: in function 'open'                          │
-- │  /home/meta/.config/nvim/lua/plugins/tree.lua:72: in function </home/meta/.config/nvim/lua/plugins/tree.lua:71│
--
-- {
--   "<leader>fE",
--   function()
--     require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
--   end,
--   desc = "Explorer NeoTree (cwd)",
-- },
-- { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
-- { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
-- is_hidden_file = function(name, bufnr)
--   return vim.startswith(name, ".")
-- end,
-- is_always_hidden = function(name, bufnr)
--   return false
-- end,
-- deactivate = function()
--   vim.cmd([[Neotree close]])
-- end,
--
-- https://neovimcraft.com/plugin/is0n/fm-nvim
-- config = function(_, opts)
--   require("mini.files").setup(opts)
--
--   local show_dotfiles = true
--   local filter_show = function(fs_entry)
--     return true
--   end
--   local filter_hide = function(fs_entry)
--     return not vim.startswith(fs_entry.name, ".")
--   end
--
--   local toggle_dotfiles = function()
--     show_dotfiles = not show_dotfiles
--     local new_filter = show_dotfiles and filter_show or filter_hide
--     require("mini.files").refresh({ content = { filter = new_filter } })
--   end
--
--   local files_set_cwd = function()
--     local cur_entry_path = require("mini.files").get_fs_entry().path
--     local cur_directory = vim.fs.dirname(cur_entry_path)
--     vim.fn.chdir(cur_directory)
--   end
--
--   vim.api.nvim_create_autocmd("User", {
--     pattern = "MiniFilesBufferCreate",
--     callback = function(args)
--       local buf_id = args.data.buf_id
--       vim.keymap.set("n", "<M-q>", function()
--         require("mini.files").close()
--       end, { buffer = buf_id })
--       -- vim.keymap.set("n", "gl", files_set_cwd, { buffer = buf_id })
--       -- vim.keymap.set("n", "gh", toggle_dotfiles, { buffer = buf_id })
--     end,
--   })
-- end,

-- XXX:
--   ["g?"] = "actions.show_help",
--   ["<CR>"] = "actions.select",
--   ["<C-s>"] = "actions.select_vsplit",
--   ["<C-h>"] = "actions.select_split",
--   ["<C-t>"] = "actions.select_tab",
--   ["<C-p>"] = "actions.preview",
--   ["<C-c>"] = "actions.close",
--   ["<C-l>"] = "actions.refresh",

--   --
