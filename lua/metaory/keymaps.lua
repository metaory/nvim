local keymap_del = function(t)
  local mode, lhs = unpack(t)
  pcall(vim.keymap.del, mode, lhs)
end
local keymap_set = function(t)
  local lhs, rhs, desc = unpack(t)
  local opts = { desc = desc, noremap = true, silent = true }
  for k, v in pairs(t) do
    if type(k) == 'string' then
      opts[k] = v
    end
  end
  local mode = opts.mode or 'n'
  opts.mode = nil
  pcall(vim.keymap.set, mode, lhs, rhs, opts)
end

local l = '<Leader>'
local lt = '\\'
local quit_gracefully = function()
  local islast = #vim.api.nvim_list_wins() == 1
  local buftype = vim.bo.buftype
  local isnofile = buftype == 'nofile'
  local ishelp = buftype == 'help'
  vim.cmd((islast or isnofile or ishelp) and ':q' or ':bd')
end
local dd = function()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end
local function modify_line_end_delimiter(character)
  local delimiters = { ",", ";" }
  return function()
    local line = vim.api.nvim_get_current_line()
    local last_char = line:sub(-1)
    if last_char == character then
      vim.api.nvim_set_current_line(line:sub(1, #line - 1))
    elseif vim.tbl_contains(delimiters, last_char) then
      vim.api.nvim_set_current_line(line:sub(1, #line - 1) .. character)
    else
      vim.api.nvim_set_current_line(line .. character)
    end
  end
end
local close_other_buffers = function()
  local current_buffer = vim.api.nvim_get_current_buf()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if bufnr ~= current_buffer then
      vim.api.nvim_buf_delete(bufnr, {})
    end
  end
end
local open_chrome_devtools = function()
  local filenameAndLine = vim.fn.expand('%:t') .. ':' .. vim.fn.line('.')
  local script = [[
    tell application "Arc"
      activate
      tell application "System Events"
        keystroke "i" using {command down, option down}
        delay 0.5
        keystroke "p" using command down
        delay 1
        keystroke "<<filenameAndLine>>"
      end tell
    end tell
  ]]
  vim.system({ 'osascript', '-e', script:gsub('<<filenameAndLine>>', filenameAndLine) })
end
local rightmouse_yank = function()
  local pos = vim.fn.getmousepos()
  if pos.winid ~= 0 then
    vim.api.nvim_set_current_win(pos.winid)
    vim.api.nvim_win_set_cursor(0, { pos.line, pos.column - 1 })
  end
  vim.cmd 'normal! "+yi"'
end

vim.tbl_map(keymap_set, {
  { 'j', [[(v:count > 1 ? 'm`' . v:count : '') . 'gj']], nil, expr = true },
  { 'k', [[(v:count > 1 ? 'm`' . v:count : '') . 'gk']], nil, expr = true },
})
vim.tbl_map(keymap_set, {
  { '<esc>', '<cmd>noh<cr><esc>', 'Escape and clear hlsearch', mode = 'i' },
  { '<esc>', '<cmd>noh<cr><esc>', 'Escape and clear hlsearch', mode = 'n' },
})
vim.tbl_map(keymap_set, {
  { '<leader><Tab>d', ':tabclose<CR>', 'Close Tab' },
  { '<leader><Tab>n', ':tabnext<CR>', 'Next Tab' },
  { '<leader><Tab>p', ':tabprevious<CR>', 'Previous Tab' },
})
keymap_set({ 'x', '"_x' })
keymap_set({ 'dd', dd, nil, noremap = true, expr = true })
vim.tbl_map(keymap_set, {
  { 'Y', 'y$' },
  { 'n', 'nzzzv' },
  { 'N', 'Nzzzv' },
  -- { 'gj', 'mzJ`z', 'Join Line Below' },
  { 'gj', '<ESC>:join<CR>$', 'Join Line Below' },
  { '<', '<gv', 'Indent Less', mode = 'v' },
  { '>', '>gv', 'Indent More', mode = 'v' },
  { '<C-e>', '<Nop>', 'Scroll screen down' },
  { '<C-y>', '3<C-y>', 'Scroll screen up' },
  { 'Q', '<Nop>' },
})
-- vim.tbl_map(keymap_set, {
--   { '<leader><leader>', '<C-^>', 'Last Buffer' },
--   { '<leader>bn', '<cmd>enew<cr>', 'New File' },
--   { '<leader>bq', '<cmd>q<cr>', 'Quit File' },
--   { '<leader>bo', close_other_buffers, 'Close Other Buffers' },
--   { '<leader>bw', '<cmd>w<cr>', 'Write File' },
--   { '<leader>bW', '<cmd>wa<cr>', 'Write All Files' },
--   { '<leader>bQ', '<cmd>qa!<cr>', 'Quit nvim' },
-- })
keymap_set({ '<leader>fn', '<cmd>lua Snacks.notifier.show_history()<cr>', 'Noice' })
if vim.opt.diff:get() then
  vim.tbl_map(keymap_set, {
    { '<leader>1', ':diffget LOCAL<CR>', 'Take Local' },
    { '<leader>2', ':diffget BASE<CR>', 'Take Base' },
    { '<leader>3', ':diffget REMOTE<CR>', 'Take Remote' },
  })
end
local format_buf = function()
  local ok, conform = pcall(require, "conform")
  if ok and conform then
    conform.format({ bufnr = 0, lsp_fallback = true, async = false })
  else
    vim.lsp.buf.format()
  end
end
vim.tbl_map(keymap_set, {
  { '<leader>lj', '<cmd>%!jq<cr>', '[JSON] Format' },
  { '<leader>lJ', '<cmd>%!jq -c<cr>', '[JSON] Compact Format' },
  { '<leader>lf', format_buf, 'Format' },
})
keymap_set({
  '<F10>',
  function()
    vim.o.conceallevel = vim.o.conceallevel > 0 and 0 or 2
  end,
  '',
})
keymap_set({
  '<F11>',
  function()
    vim.o.concealcursor = vim.o.concealcursor == 'n' and '' or 'n'
  end,
  '',
})
vim.g.tmux_resizer_resize_count = 2
vim.g.tmux_resizer_vertical_resize_count = 2
vim.g.tmux_resizer_no_mappings = 1
vim.tbl_map(keymap_set, {
  { '<C-M-k>', '<cmd>:TmuxResizeUp<CR>' },
  { '<C-M-j>', '<cmd>:TmuxResizeDown<CR>' },
  { '<C-M-h>', '<cmd>:TmuxResizeLeft<CR>' },
  { '<C-M-l>', '<cmd>:TmuxResizeRight<CR>' },
})

vim.tbl_map(keymap_set, {
  { '<leader>c,', modify_line_end_delimiter(','), "[Add] ',' to end of line" },
  { '<leader>c;', modify_line_end_delimiter(';'), "[Add] ';' to end of line" },
})
-- vim.tbl_map(keymap_set, { { '<leader>ol', ':Lazy<CR>', "Lazy 󰒲" } })
vim.tbl_map(keymap_set, {
  { '<leader>cn', '*``cgn', '[Replace] Next Occurrence' },
  { '<leader>cN', '*``cgN', '[Replace] Next Occurrence (Backwards)' },
})
keymap_set({ '<leader>oc', open_chrome_devtools, 'Open chrome dev tools and run "open file" with current file and line' })

-----------------------------------------------------------------------------//
-- tbl_map bindings (from nvim_ok)
-----------------------------------------------------------------------------//
vim.api.nvim_command "exe 'set cedit=<C-y>'"
vim.tbl_map(keymap_del, {
  { 'n', '<leader>l' },
})
vim.tbl_map(keymap_set, {
  { '<C-a>', '<ESC>g0i', mode = 'i', silent = true },
  -- { '<C-e>', '<ESC>g$i', mode = 'i', silent = false },
  { '<C-f>', '<ESC>lli', mode = 'i', silent = true },
  { '<C-b>', '<ESC>i', mode = 'i', silent = true },
})
vim.tbl_map(keymap_set, {
  { '<M-k>', '<Up>', mode = 'c', silent = false },
  { '<M-j>', '<Down>', mode = 'c', silent = false },
  { '<C-f>', '<Right>', mode = 'c', silent = false },
  { '<C-a>', '<Home>', mode = 'c', silent = false },
  { '<C-b>', '<Left>', mode = 'c', silent = false },
  { '<M-b>', '<C-b>', mode = 'c', silent = false },
  { 'w!!', '!sudo tee %<CR>', mode = 'c', silent = true },
})
vim.tbl_map(keymap_set, {
  { '<C-M-J>', '<C-w>-' },
  { '<C-M-K>', '<C-w>+' },
  { '<C-M-H>', '<C-w><' },
  { '<C-M-L>', '<C-w>>' },
})
vim.tbl_map(keymap_set, {
  { '<M-Y>', [[<ESC>gg"+yGg;zz]], mode = 'n', 'N Yank whole file (S)' },
  { '<M-Y>', [[<ESC>gg"+yGg;zz]], mode = 'i', 'I Yank whole file (S)' },
  { '<M-Y>', [["+y]], mode = 'v', 'V Yank whole file (S)' },

  { '<M-y>', [["+y]], mode = 'v', 'V Yank Selection (S)' },
  { '<M-y>', [["+y$]], mode = 'n', 'N Yank till end-of-line (S)' },
  { '<M-y>', [[<ESC>gg"+yGg;zz]], mode = 'i', 'I Yank whole file (S)' },
  { '<M-p>', [[<ESC>"+p]], mode = 'i', 'Paste (S)' },
})
vim.tbl_map(keymap_set, {
  { '<M-d>', '<ESC>:<C-y>', 'Command' },
  { '<M-s>', '<ESC>:w<CR>', silent = true, 'Save File' },
  { '<M-Q>', ':qall!<CR>', silent = false, 'Exit All' },
  { '<M-q>', ':q<CR>', mode = 'n', silent = true, 'Exit' },
  { 'q', quit_gracefully, mode = 't' },
  { l .. 'q', quit_gracefully, silent = false, 'Exit' },
})
vim.tbl_map(keymap_set, {
  { '<M-j>', [[<CMD>bp<CR>]], 'Prev Buffer' },
  { '<M-k>', [[<CMD>bn<CR>]], 'Next Buffer' },
  { '<M-x>', [[<CMD>bdelete<CR>]], 'Delete Buffer' },
})
vim.tbl_map(keymap_set, {
  { '<M-g>', function() require('snacks').picker.grep { root = false } end, 'Grep (cwd)' },
  { '<M-r>', function() require('snacks').picker.resume() end, 'Resume Last Picker' },
  { l .. 'fM', function() require('snacks').picker.man() end, 'Man pages' },
})
vim.tbl_map(keymap_set, {
  { '<RightMouse>', rightmouse_yank, silent = true, 'Delete Buffer' },
})
vim.tbl_map(keymap_set, {
  { l .. 'ct', [[:%s/\s\+$//e<CR>]], 'Trim trailing' },
})
vim.tbl_map(keymap_set, {
  { lt .. 'G', [[<Cmd>call glyph_palette#apply()<CR>]], 'Toggle Glyph' },
  { lt .. 's', '<cmd>lua require("kulala").scratchpad()<cr>', 'Toggle scratchpad' },
  { lt .. 'O', [[<Cmd>    set cursorline! | set cursorcolumn!<CR>]], 'Toggle CursorLine' },
  { lt .. 'X', [[<Cmd>    TSContextToggle<CR>]], 'Toggle TSContext' },
  { lt .. 'h', [[<Cmd>    TSBufToggle highlight<CR>]], 'Toggle TSHighlight' },
  { lt .. 'H', [[<Cmd>lua require("mini.hipatterns").toggle()<CR>]], 'Toggle Hipatterns' },
  { lt .. 'm', [[<Cmd>lua MiniMap.toggle()<CR>]], 'Toggle Map' },
  { lt .. 'Z', [[<Cmd>lua MiniMisc.zoom()<CR>]], 'Toggle Zoom ' },
  { lt .. 'T', [[<Cmd>lua vim.b.minitrailspace_disable = not vim.b.minitrailspace_disable<CR>]], 'Toggle Trailspace' },
  { lt .. 'C', [[<Cmd>lua vim.b.minicursorword_disable = not vim.b.minicursorword_disable<CR>]], 'Toggle CursorWord' },
  { lt .. 'w', [[:setlocal nowrap!<CR>]], 'Toggle Wrap' },
  {
    lt .. 'c',
    [[:setlocal conceallevel=<C-r>=&conceallevel == 0 ? 3 : 0<CR><CR>]],
    "Toggle 'conceallevel'",
  },
  { lt .. 'f', [[:set cmdheight=<C-r>=&cmdheight ? 0 : 1<CR><CR>]], "Toggle cmdheight" },
  { lt .. 'V', [[:set verbose=<C-r>=&verbose > 3 ? 3 : 9<CR><CR>]], "Toggle verbose" },
  {
    lt .. 'd',
    [[:lua vim.diagnostic[vim.diagnostic.is_disabled() and 'enable' or 'disable']()<CR>]],
    "Toggle 'diagnostic'",
  },
  { lt .. 'L', [[:lua vim.cmd(#vim.lsp.get_clients() == 0 and 'LspStart' or 'LspStop')<CR>]], 'Toggle LSP' },
  { lt .. 'l', [[<Cmd>set rnu! | set nu!<CR>]], 'Toggle Numbers' },
})
