--[[
https://jacobsimpson.github.io/nvim-lua-manual/docs/communicating/
--]]

vim.g.vscode = false
vim.g.debug_treesitter = false

if vim.loader then
  vim.loader.enable()
  -- vim.schedule(function() vim.notify("nvim loader is enabled") end)
end

-- return next(vim.fn.argv()) == nil

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
-- require("user.ui")
require("config.lazy")
-- require("user.plugins.ui")
-- U = require("util")
-- require("user.filetypes")
-- require("user.plugins.xredir")
-- require("user.plugins.qtoggle")
-- require('user.plugins.qtoggle').toggle_qf
-- require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })
-- require("luasnip.loaders.from_vscode").load()

-- vim.cmd([[ hi VimnikiLink guibg=#fff000 ]])

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
-- local inspect = require("inspect")

_G.mxdump = function(t, f, m)
  assert(t == nil)
  local p = "/tmp/mx_lua_" .. f .. ".lua"
  local file, err = io.open(p, m or "w")

  if type(t) ~= "string" then
    t = vim.inspect(t)
  end

  local str = "local ___ = function() end\n\nreturn " .. t
  str = string.gsub(str, "<%a+ %d+>", "___")
  str = string.gsub(str, "<%a+>", "___")
  str = string.gsub(str, "<%d+>", "___")

  local _, lines = string.gsub(str, "\n", "\n")

  if file then
    file:write(str)
    file:close()
    vim.notify(string.format("written %s lines to %s", lines + 1, p), vim.log.levels.WARN, { title = "mxdump" })
  else
    print("error:", err)
  end
end
