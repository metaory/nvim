-- BUG:
-- (mini.starter) `buf_id` in `refresh()` is not an identi

return {
  { "goolord/alpha-nvim", enabled = false },

  {
    "echasnovski/mini.starter",
    cond = function()
      return next(vim.fn.argv()) == nil
    end,
    opts = function()
      local logo = [[
    █    █  █   ██
    ██  ██  ██ ██    █████          Z
    ██████   ███    ██  ██      Z
    ██████   ███    ██       z
    ██  ██  ██ ██   ██     z
    ██  ██ ██   █    ██████
    ██ █
    █
    █ shared @ mxc-v1.9.0
        ]]
      local pad = string.rep(" ", 22)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end

      local starter = require("mini.starter")
      --stylua: ignore
      local config = {
        evaluate_single = true,
        header = logo,
        items = {
          -- starter.sections.builtin_actions(),
          starter.sections.recent_files(2),
          new_section("Find file",   "Telescope find_files", "Telescope"),
          new_section("Old files",   "Telescope oldfiles",   "Telescope"),
          new_section("Grep text",    "Telescope live_grep",  "Telescope"),
          new_section("Help tags",    "Telescope help_tags",  "Telescope"),
          new_section("init.lua",     "e $MYVIMRC",           "Config"),
          new_section("Lazy",         "Lazy",                 "Config"),
          new_section("New file",     "ene | startinsert",    "Built-in"),
          new_section("Quit",         "qa",                   "Built-in"),
          new_section("Session restore", [[lua require("persistence").load()]], "Session"),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(pad .. "░ ", false),
          starter.gen_hook.aligning("center", "center"),
        },
      }
      -- MxDump(vim.inspect(config), "dashx")
      -- nvim_buf_set_name({buffer}, {name})                      *nvim_buf_set_name()*
      return config
    end,
    -- config = function(_, opts)
    --   -- MxDebug(opts, "mini")
    --   require("mini.starter").setup(opts)
    --   -- vim.api.nvim_buf_set_name(0, "/tmp")
    -- end,
  },
}
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

-- MxDebug(opts, 'alpha')
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
