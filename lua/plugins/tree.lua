return {
  {
    -- enabled = false,
    "nvim-neo-tree/neo-tree.nvim",
    -- ft = "*",
    -- lazy = true,
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_hidden = true,
          hide_by_name = {
            --"node_modules"
          },
          hide_by_pattern = { -- uses glob style patterns
            --"*.meta",
            --"*/src/*/tsconfig.json",
          },
          always_show = { -- remains visible even if other settings would normally hide it
            ".gitignore",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            --".DS_Store",
            --"thumbs.db"
          },
          never_show_by_pattern = { -- uses glob style patterns
            --".null-ls_*",
          },
        },
        group_empty_dirs = false,
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
        window = { mappings = { ["o"] = "system_open" } },
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
    },
  },
}
