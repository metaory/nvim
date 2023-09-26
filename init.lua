local util = require("util.debug")

if vim.loader then
  vim.loader.enable()
end

vim.g.debug_global_flag = false
vim.g.debug_nulls = vim.g.debug_global_flag
vim.g.debug_treesitter = vim.g.debug_global_flag
vim.lsp.set_log_level(vim.lsp.log_levels[vim.g.debug_global_flag and "INFO" or "WARN"])

_G.dd = util.dump
_G.ddwrite = util.dumpwrite
_G.live_inspect = util.live_inspect

require("config.commands")
require("config.options")
require("config.keymaps")
require("config.autocmds")
-- require("config.lazy")

if vim.g.debug_global_flag then
  vim.schedule(function()
    vim.notify("   DEBUG IS ENABLED  ", vim.log.levels.WARN, { title = "DEBUG" })
  end)
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup("plugins", {
  dev = { path = vim.fn.stdpath('config') .. "/dev", fallback = true },
  defaults = { lazy = true },
  install = { missing = true, colorscheme = { "ron" } },
  spec = nil,
  diff = { cmd = "git" },
  change_detection = { enabled = false, notify = false },
  checker = { enabled = false },
  performance = {
    cache = { enabled = true },
    reset_packpath = true,
    rtp = {
      reset = true,
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    throttle = 20,
    size = { width = 0.8, height = 0.8 },
    wrap = true,
    border = "none",
    pills = true,
    icons = { lazy = " " },
  },
  readme = {
    enabled = true,
    root = vim.fn.stdpath("state") .. "/lazy/readme",
    files = { "README.md", "lua/**/README.md" },
    skip_if_doc_exists = true,
  },
  build = { warn_on_override = true },
  debug = vim.g.debug_global_flag,
})

-- vim.g.loaded_node_provider = true
