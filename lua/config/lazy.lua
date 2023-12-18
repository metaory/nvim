local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup("plugins", {
  dev = { path = vim.fn.stdpath("config") .. "/dev", fallback = true },
  defaults = { lazy = true, version = nil },
  install = { missing = true, colorscheme = { "onedark", "ron" } },
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
        "matchit",
        "matchparen",
        "gzip",
        "tarPlugin",
        "rplugin",
        "netrw",
        "netrwPlugin",
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
  -- debug = vim.g.debug_global_flag,
})
