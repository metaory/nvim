local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("metaory.plugins", {
  concurrency = 3,
  install = { colorscheme = { "tokyonight" } },
  -- lockfile = "~/dotfiles/nix/module/nvim/config/lazy-lock.json",
  ui = {
    border = "rounded",
  },
  git = {
    url_format = "git@github.com:%s.git",
    timeout = 300,
    filter = false,
    throttle = {
      enabled = true,
      rate = 2,
      duration = 5 * 1000,
    },
  },
  checker = {
    concurrency = 3,
  },
  dev = {
    path = "~/playgrounds/play-js",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
