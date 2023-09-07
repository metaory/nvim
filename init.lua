--[[
https://jacobsimpson.github.io/nvim-lua-manual/docs/communicating/
--]]
local util = require("util.debug")

vim.g.vscode = false
vim.g.debug_global_flag = false
vim.g.debug_treesitter = vim.g.debug_global_flag
vim.g.debug_nulls = vim.g.debug_global_flag
-- vim.g.loaded_node_provider = true

if vim.loader then
  vim.loader.enable()
end

_G.dd = util.dump
_G.ddwrite = util.dumpwrite
_G.live_inspect = util.live_inspect

require("user.commands")
require("config.lazy")

-- vim.schedule(function() vim.notify("nvim loader is enabled") end)
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

-- require("user.ui")
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

-- _G.dd = function(...)
--   require("util.debug").dump(...)
-- end
-- _G.mxdump = function(...)
--   require("util.debug").dumpwrite(...)
-- end

-- vim.ui_attach(vim.api.nvim_create_namespace("redirect messages"), { ext_messages = true }, function(event, ...)
--   local args = ...
--   ddwrite({ args = args, event = event }, "____RED____")
--   -- local kind, content = ...
--   -- if event == "msg_show" then
--   -- if string.find(kind, "err") then
--   --   level = vim.log.levels.ERROR
--   -- end
--   -- vim.notify(content, level, { title = "Message" })
--   -- end
-- end)
