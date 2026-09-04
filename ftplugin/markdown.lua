-- vim.keymap.set("n", "ga", "z=")
vim.opt.textwidth = 80

-- Right click: move cursor to clicked position, then yank inside parentheses to clipboard
vim.keymap.set("n", "<RightMouse>", function()
  local pos = vim.fn.getmousepos()
  vim.api.nvim_set_current_win(pos.winid)
  vim.api.nvim_win_set_cursor(pos.winid, { pos.line, pos.column - 1 })
  vim.cmd('normal! "+yi(')
end, { buffer = true, desc = "Yank inside parens at click" })
