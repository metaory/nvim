local buf, win

local function close()
  if win and vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_win_close(win, true)
  end
end

local function removeAscii(text)
  for k, v in pairs(text) do
    -- Remove all the ansi escape characters
    text[k] = string.gsub(v, "[\27\155][][()#;?%d]*[A-PRZcf-ntqry=><~]", "")
  end
  return text
end

local function zoom_toggle()
  local width = vim.api.nvim_get_option("columns")
  local max_width = math.ceil(width * 0.9)
  local min_width = math.ceil(width * 0.5)
  if vim.api.nvim_win_get_width(win) ~= max_width then
    vim.api.nvim_win_set_width(win, max_width)
  else
    vim.api.nvim_win_set_width(win, min_width)
  end
end

local function wrap()
  vim.cmd("set wrap!")
end

local function starts_with(str, start)
  return str:sub(1, #start) == start
end

local function redraw(cmd)
  local result = {}

  if cmd == nil or cmd == "" then
    table.insert(result, "Attempt to execute empty command!")
  elseif starts_with(cmd, "!") then
    -- System command
    result = removeAscii(vim.fn.systemlist(string.sub(cmd, 2)))
  else
    -- Vim EX command
    result = vim.fn.split(vim.fn.execute(cmd), "\n")
  end

  vim.api.nvim_buf_set_option(buf, "modifiable", true)

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, result)
  vim.api.nvim_buf_set_option(buf, "modifiable", false)
end

local function set_mappings()
  local mappings = {
    q = "close()",
    ["<cr>"] = "zoom_toggle()",
    w = "wrap()",
  }

  for k, v in pairs(mappings) do
    vim.api.nvim_buf_set_keymap(buf, "n", k, ':lua require"user.plugins.xredir".' .. v .. "<cr>", {
      nowait = true,
      noremap = true,
      silent = true,
    })
  end
end

local function create_win(filetype)
  filetype = (filetype == nil and "result") or filetype
  vim.api.nvim_command("botright vnew")
  win = vim.api.nvim_get_current_win()
  buf = vim.api.nvim_get_current_buf()

  vim.api.nvim_buf_set_name(0, "result #" .. buf)

  vim.api.nvim_win_set_width(0, 1000)
  vim.api.nvim_buf_set_option(0, "buftype", "nofile")
  vim.api.nvim_buf_set_option(0, "swapfile", false)
  vim.api.nvim_buf_set_option(0, "filetype", filetype)
  vim.api.nvim_buf_set_option(0, "bufhidden", "wipe")

  vim.api.nvim_command("setlocal wrap")
  vim.api.nvim_command("setlocal cursorline")

  set_mappings()
end

local function xredir(cmd, filetype)
  require("noice").redirect(cmd)
  -- print(vim.inspect(vim.tbl_keys(require 'tokyonight')))
  -- MxDump(cmd, "xdir-raw")

  -- local data = vim.api.nvim_exec2("lua =vim.opt.completeopt._value", {})

  -- MxDump(vim.inspect(data), "xdir-dat")

  -- lua require("noice").redirect("lua =vim.opt.completeopt._value")
  -- lua require("noice").redirect("lua print(vim.inspect(vim.opt.completeopt))")
  -- lua print(vim.inspect(vim.opt.completeopt))
  -- require("noice").redirect("lua =" .. cmd)
  -- require("noice").redirect(function() print("test") end)
  -- vim.cmd([[ setf vim ]])
end
-- local function xredir(cmd, filetype)
--   if win and vim.api.nvim_win_is_valid(win) then
--     vim.api.nvim_set_current_win(win)
--   else
--     create_win(filetype)
--   end
--
--   redraw(cmd)
-- end

-- vim.api.nvim_create_user_command("Xdir", xredir, { nargs = "+", complete = "command" })
vim.cmd([[ command! -nargs=1 -complete=command Xdir lua require'user.plugins.xredir'.xredir(<q-args>) ]])

return {
  xredir = xredir,
  close = close,
  zoom_toggle = zoom_toggle,
  wrap = wrap,
}
