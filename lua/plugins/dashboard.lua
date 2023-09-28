return {
  -- { "goolord/alpha-nvim", enabled = false },
  {
    "echasnovski/mini.starter",
    event = "VimEnter",
    cond = function()
      return next(vim.fn.argv()) == nil
    end,
    opts = function()
      local pad = string.rep(" ", 10)
      local logo = pad .. table.concat(require("user.header"), "\n" .. pad)
      local starter = require("mini.starter")
      local telescope = starter.sections.telescope()()
      table.remove(telescope, 1)

      local config = {
        evaluate_single = true,
        auto_open = false,
        header = logo,
        items = {
          starter.sections.recent_files(4, true, true),
          telescope,
          { name = "init.lua", action = "e $MYVIMRC", section = "Config" },
          { name = "Lazy", action = "Lazy", section = "Config" },
          { name = "Restore", action = [[lua require("persistence").load()]], section = "Session" },
          starter.sections.builtin_actions(),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(pad .. "░ ", false),
          starter.gen_hook.aligning("center", "center"),
        },
      }
      return config
    end,
  },
}
-- config = function(_, opts)
--   -- mxdebug(opts, "mini")
--   require("mini.starter").setup(opts)
--   -- vim.api.nvim_buf_set_name(0, "/tmp")
-- end,
-- mxdump(vim.inspect(config), "dashx")
-- nvim_buf_set_name({buffer}, {name})                      *nvim_buf_set_name()*
-- {
--   "goolord/alpha-nvim",
--   event = "VimEnter",
--   opts = function(_, dashboard)
--     local button = dashboard.button("p", " " .. " Projects", ":Telescope projects <CR>")
--     button.opts.hl = "AlphaButtons"
--     button.opts.hl_shortcut = "AlphaShortcut"
--     table.insert(dashboard.section.buttons.val, 4, button)
--     local logo = [[
--   █    █  █   ██
--   ██  ██  ██ ██    █████          Z
--   ██████   ███    ██  ██      Z
--   ██████   ███    ██       z
--   ██  ██  ██ ██   ██     z
--   ██  ██ ██   █    ██████
--   ██ █
--   █
--   █ shared @ mxc-v1.9.0
--       ]]
--
--     dashboard.section.header.val = vim.split(logo, "\n")
--   end,
-- },

-- mxdebug(opts, 'alpha')
-- return vim.list_extend({
--     header = logo,
-- }, opts)
-- dashboard.section.header.val = vim.split(logo, "\n")
-- dashboard.section.buttons.val = {
--   dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
--   dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
--   dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
--   dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
--   dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
--   dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
--   dashboard.button("l", "Z " .. " Lazy", ":Lazy<CR>"),
--   dashboard.button("q", " " .. " Quit", ":qa<CR>"),
-- }
-- BUG:
-- (mini.starter) `buf_id` in `refresh()` is not an identi

-- new_section("Find file",   "Telescope find_files", "Telescope"),
-- new_section("Old files",   "Telescope oldfiles",   "Telescope"),
-- new_section("Grep text",    "Telescope live_grep",  "Telescope"),
-- new_section("Help tags",    "Telescope help_tags",  "Telescope"),
-- { name = "New file", action = "ene | startinsert", section = "Built-in" },
-- { name = "Quit", action = "qa", section = "Built-in" },
--stylua: ignore
