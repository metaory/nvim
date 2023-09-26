if true then
  return
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        colorscheme = function() end,
        icons = {
          dap = { Stopped = { " ", "DiagnosticWarn", "DapStoppedLine" } },
          kinds = { Snippet = " ", Array = " " },
        },
      },
    },
    { "folke/lazy.nvim", version = "*" },
    { import = "plugins" },
  },
  defaults = { lazy = true },
  install = { missing = true, colorscheme = { "tokyonight", "onedark", "horizon", "catppuccin", "habamax" } },
  diff = { cmd = "git" },
  change_detection = { enabled = false, notify = false },
  checker = { enabled = false },
  performance = {
    cache = { enabled = true },
    -- reset_packpath = true,
    -- reset = true,
    rtp = {
      -- "matchit",
      -- "matchparen",
      -- "netrwPlugin",
      -- "rplugin",
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
  debug = vim.g.debug_global_flag,
})

-- custom_keys = { ["<localleader>d"] = false },
-- { import = "lazyvim.plugins.extras.coding.copilot" },
-- { import = "lazyvim.plugins.extras.lang.typescript" },
-- { import = "lazyvim.plugins.extras.lang.tailwind" },
-- { import = "lazyvim.plugins.extras.ui.mini-animate" },
-- { import = "lazyvim.plugins.extras.ui.edgy" },
-- { import = "lazyvim.plugins.extras.vscode" },
-- { import = "lazyvim.plugins.extras.dap.nlua" },
-- { import = "lazyvim.plugins.extras.util.mini-hipatterns", event = {} },
-- { import = "lazyvim.plugins.extras.test.core" },
-- { import = "lazyvim.plugins.extras.editor.flash" },
-- { import = "lazyvim.plugins.extras.util.project" },
-- { import = "user.pllugins.telescope-starter" },

-- cmd = " ", config = "", event = "", ft = " ", init = " ", import = " ", keys = " ", loaded = "●", not_loaded = "○", plugin = " ", runtime = " ", source = " ", start = "", task = "✔ ", list = { "●", "➜", "★", "‒" }, -- 

-- dev = { patterns = {} },
-- dev = { patterns = { "folke", "LazyVim" } },
-- dev = {
--   path = "~/projects",
--   patterns = {}, -- For example {"folke"}
--   fallback = false, -- Fallback to git when local plugin doesn't exist
-- },
-- local use_dev = true

-- { import = "lazyvim.plugins.extras.dap.core" },
-- { import = "lazyvim.plugins.extras.lang.rust" },
-- colorscheme = require("user.theme").setup,

-- { import = "lazyvim.plugins.extras.lang.docker" },
-- { import = "lazyvim.plugins.extras.lang.json" },
-- { import = "lazyvim.plugins.extras.lang.yaml" },
-- { import = "lazyvim.plugins.extras.linting.eslint" },
-- { import = "lazyvim.plugins.extras.formatting.prettier" },
-- { import = "lazyvim.plugins.extras.coding.yanky" },
-- { import = "lazyvim.plugins.extras.editor.mini-files" },
-- { import = "lazyvim.plugins.extras.ui.mini-starter" },
