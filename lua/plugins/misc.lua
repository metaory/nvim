return {
  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    keys = { { "<leader>Z", "<cmd>Twilight<cr>", desc = "Twilight Mode" } },
  },
  {
    "echasnovski/mini.splitjoin",
    opts = { mappings = { toggle = "gj" } },
    keys = { { "gj", desc = "Split/Join" } },
  },
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>rr", function() require("spectre").open() end, desc = "Replace Spectre" },
    },
  },
  {
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<leader>rs",
        function()
          require("ssr").open()
        end,
        mode = { "n", "x" },
        desc = "Structural Replace",
      },
    },
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
}

-- {
--   "andymass/vim-matchup",
--   event = "BufReadPost",
--   enabled = false,
--   init = function()
--     vim.o.matchpairs = "(:),{:},[:],<:>"
--   end,
--   config = function()
--     vim.g.matchup_matchparen_deferred = 1
--     vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
--   end,
-- },

-- opts = function()
--   return {
--     callbacks = {
--       should_block = require("flatten").default_should_block,
--       should_nest = require("flatten").default_should_nest,
--       -- pre_open = function() end,
--       -- post_open = function(bufnr, winnr, filetype, is_blocking, is_diff) end,
--       -- block_end = function(filetype) end,
--     },
--     block_for = {
--       gitcommit = true,
--     },
--     allow_cmd_passthrough = true,
--     nest_if_no_args = false,
--     window = {
--       -- Options:
--       -- current        -> open in current window (default)
--       -- alternate      -> open in alternate window (recommended)
--       -- tab            -> open in new tab
--       -- split          -> open in split
--       -- vsplit         -> open in vsplit
--       -- smart          -> smart open (avoids special buffers)
--       -- OpenHandler    -> allows you to handle file opening yourself (see Types)
--       --
--       open = "alternate",
--       -- open = "current",
--       -- Options:
--       -- vsplit         -> opens files in diff vsplits
--       -- split          -> opens files in diff splits
--       -- tab_vsplit     -> creates a new tabpage, and opens diff vsplits
--       -- tab_split      -> creates a new tabpage, and opens diff splits
--       -- OpenHandler    -> allows you to handle file opening yourself (see Types)
--       diff = "tab_vsplit",
--       -- Affects which file gets focused when opening multiple at once
--       -- Options:
--       -- "first"        -> open first file of new files (default)
--       -- "last"         -> open last file of new files
--       focus = "first",
--     },
--     pipe_path = require("flatten").default_pipe_path,
--     one_per = {
--       kitty = true,
--       wezterm = true,
--     },
--   }
-- end,
-- {
--   "akinsho/toggleterm.nvim",
--   config = function()
--     require("configs.terminal.toggleterm")
--   end,
-- },
-- https://github.com/willothy/flatten.nvim
-- v ~/dev/forks/dotfiles-steve/.config/nvim/lua/plugins/misc.lua
-- {
--   "willothy/flatten.nvim",
--   -- ft = { "org" },
--   lazy = false,
--   opts = function()
--     -- local saved_terminal
--
--     return {
--       window = {
--         open = "alternate",
--       },
--       callbacks = {
--         should_block = require("flatten").default_should_block,
--         -- should_block = function(argv)
--         --   -- In this case, we would block if we find the `-b` flag
--         --   -- This allows you to use `nvim -b file1` instead of `nvim --cmd 'let g:flatten_wait=1' file1`
--         --   return vim.tbl_contains(argv, "-b")
--         --   -- Alternatively, we can block if we find the diff-mode option
--         --   -- return vim.tbl_contains(argv, "-d")
--         -- end,
--         pre_open = function()
--
--           -- local term = require("toggleterm.terminal")
--           -- local termid = term.get_focused_id()
--           -- saved_terminal = term.get(termid)
--         end,
--         post_open = function(bufnr, winnr, ft, is_blocking)
--           -- if is_blocking and saved_terminal then
--           --   saved_terminal:close()
--           -- else
--           --   vim.api.nvim_set_current_win(winnr)
--           -- end
--
--           -- if ft == "gitcommit" or ft == "gitrebase" then
--           --   vim.api.nvim_create_autocmd("BufWritePost", {
--           --     buffer = bufnr,
--           --     once = true,
--           --     callback = vim.schedule_wrap(function()
--           --       vim.api.nvim_buf_delete(bufnr, {})
--           --     end),
--           --   })
--           -- end
--         end,
--         -- block_end = function(filetype) end,
--         -- block_end = function()
--         --   vim.schedule(function()
--         --     if saved_terminal then
--         --       saved_terminal:open()
--         --       saved_terminal = nil
--         --     end
--         --   end)
--         -- end,
--       },
--     }
--   end,
--   config = true,
-- },
-- {
--   "Wansmer/treesj",
--   keys = {
--     { "gj", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
--   },
--   opts = { use_default_keymaps = false, max_join_length = 150 },
-- },
