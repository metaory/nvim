--[[
https://jacobsimpson.github.io/nvim-lua-manual/docs/communicating/
--]]
vim.g.vscode = false
vim.g.debug_treesitter = true

vim.filetype.add({
  extension = {
    cconf = "python",
    frag = "glsl",
    -- jsx = "javascript.jsx",
    -- ["js.flow"] = "javascript.jsx",
    norg = "norg",
    -- rbi = "ruby",
    tmux = "tmux",
    tmuxtheme = "tmux",
    -- tsx = "typescript.tsx",
  },
  filename = {
    [".zalias"] = "zsh",
    [".nvimrc"] = "lua",
    ["kitty.conf"] = "kitty",
    ["picom.conf"] = "toml",
    ["tsconfig.json"] = "jsonc",
  },
  pattern = {
    -- [".*/%.vscode/.*%.json"] = "json5",
    -- ["Dockerfile-.*"] = "dockerfile",
    -- [".*/%.vscode/.*%.json"] = "json5",
  },
})

if vim.loader then
  vim.loader.enable()
  -- vim.schedule(function() vim.notify("nvim loader is enabled") end)
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
require("config.lazy")

-- require("user.filetypes")
require("user.plugins.xredir")

-- require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })
-- require("luasnip.loaders.from_vscode").load()

-- vim.cmd([[ hi VimwikiLink guibg=#fff000 ]])

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

MxDump = function(t, f)
  local p = "/tmp/mx_lua_" .. f .. ".lua"
  local file, err = io.open(p, "a")
  if file then
    file:write(t) -- file:write(tostring(t))
    file:close()
  else
    print("error:", err)
  end
end
