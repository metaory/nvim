local async = require("util.async")

local M = {}

M.input = async.wrap(function(opts, cb)
  vim.ui.input(opts, cb)
end, 2)

M.select = async.wrap(function(list, opts, cb)
  vim.ui.select(list, opts, cb)
end, 3)

return M
