vim.g.vscode = false
vim.g.debug_treesitter = false

vim.filetype.add({
  extension = {
    cconf = "python",
    frag = "glsl",
    -- jsx = "javascript.jsx",
    ["js.flow"] = "javascript.jsx",
    norg = "norg",
    rbi = "ruby",
    tmux = "tmux",
    tmuxtheme = "tmux",
    -- tsx = "typescript.tsx",
  },
  filename = {
    [".nvimrc"] = "lua",
    ["picom.conf"] = "toml",
    ["kitty.conf"] = "toml",
    ["tsconfig.json"] = "jsonc",
  },
  pattern = {
    -- [".*/%.vscode/.*%.json"] = "json5",
    [".*/%.vscode/.*%.json"] = "json5",
  },
})

-- vim.loader = false
if vim.loader then
  vim.loader.enable()
  -- vim.schedule(function()
  --   vim.notify("nvim loader is enabled")
  -- end)
end

-- _G.dd = function(...) require("util.debug").dump(...) end
-- vim.print = _G.dd

-- require("util.profiler").start()

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "LazyVimStarted",
--   callback = function()
--     vim.schedule(function()
--       -- require("util.profiler").stop()
--     end)
--   end,
-- })

require("user.commands")
require("user.filetypes")
require("config.lazy")

-- vim.g.profile_loaders = true
--[[require("config.lazy")({
  debug = false,
  defaults = {
    lazy = true,
    -- cond = false,
  },
  performance = {
    cache = {
      enabled = true,
    },
  },
})
]]

-- require("util.dashboard").setup()

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "VeryLazy",
--   callback = function()
--     -- require("config.env")
--     require("util").version()
--   end,
-- })
