--[[
https://jacobsimpson.github.io/nvim-lua-manual/docs/communicating/
--]]

vim.g.vscode = false
vim.g.debug_treesitter = true

if vim.loader then
  vim.loader.enable()
  -- vim.schedule(function() vim.notify("nvim loader is enabled") end)
end

_G.dd = function(...)
  require("util.debug").dump(...)
end
-- vim.print = _G.dd

-- require("util.profiler").start()
--
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "LazyVimStarted",
--   callback = function()
--     vim.schedule(function()
--       require("util.profiler").stop()
--       vim.schedule(function()
--         vim.notify("LazyVimStarted")
--       end)
--     end)
--   end,
-- })

require("user.commands")
require("config.lazy")
-- U = require("util")
-- require("user.filetypes")
-- require("user.plugins.xredir")
-- require("user.plugins.qtoggle")
-- require('user.plugins.qtoggle').toggle_qf
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

_G.mxdump = function(t, f)
  local p = "/tmp/mx_lua_" .. f .. ".lua"
  local file, err = io.open(p, "a")
  if file then
    file:write(t) -- file:write(tostring(t))
    file:close()
  else
    print("error:", err)
  end
end
