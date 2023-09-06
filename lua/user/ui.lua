local async = require("util.async")

local M = {}

M.runners = { javascript = "node" }

M.input = async.wrap(function(opts, cb)
  vim.ui.input(opts, cb)
end, 2)

M.select = async.wrap(function(list, opts, cb)
  vim.ui.select(list, opts, cb)
end, 3)

M.input_ft_runner = async.wrap(function(_, cb)
  local cmd = M.runners[vim.bo.filetype] or vim.bo.filetype
  vim.ui.input({ prompt = "command", default = cmd }, cb)
end, 2)

M.confirm = function(msg, list)
  msg = msg or "confirm?!!"
  list = list or { "Yes", "No" }
  local choices = table.concat(list, "\n")

  return vim.fn.confirm(msg, choices) == 1
end

M.defer = async.wrap(function(timeout, cb)
  timeout = timeout or 3000
  vim.defer_fn(cb, timeout)
end, 2)

M.schedule = async.wrap(function(cb)
  vim.schedule(cb)
end, 1)

return M
