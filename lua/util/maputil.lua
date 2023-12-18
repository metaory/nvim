local M = {}

M.keymap_del = function(lhs)
  local mode = "n"
  local key = lhs

  if vim.tbl_islist(lhs) then
    mode = lhs[1]
    key = lhs[2]
  end

  pcall(vim.keymap.del, mode, key)
end

M.keymap_set = function(t)
  local lhs, rhs, desc = unpack(t)

  local opts = { desc = desc }

  for k, v in pairs(t) do
    if type(k) == "string" then
      opts[k] = v
    end
  end

  local mode = opts.mode or "n"
  opts.mode = nil

  -- ddwrite({ x = "map_set", m = mode, l = lhs, r = rhs, opts }, "__map_set__")

  pcall(vim.keymap.set, mode, lhs, rhs, opts)
end

return M
