local keymap = vim.keymap.set

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

-- Store relative line number jumps in the jumplist.
keymap("n", "j", [[(v:count > 1 ? 'm`' . v:count : '') . 'gj']], { expr = true, silent = true })
keymap("n", "k", [[(v:count > 1 ? 'm`' . v:count : '') . 'gk']], { expr = true, silent = true })

keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
-- keymap({ "n" }, "<CR>", "viw", { desc = "Select word under cursor" })

-- save and quit
keymap("n", "<leader><Tab>d", ":tabclose<CR>", { silent = true, desc = "Close Tab" })
keymap("n", "<leader><Tab>n", ":tabnext<CR>", { silent = true, desc = "Next Tab" })
keymap("n", "<leader><Tab>p", ":tabprevious<CR>", { silent = true, desc = "Previous Tab" })

keymap("n", "x", '"_x', { silent = true })
local dd = function()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end
keymap("n", "dd", dd, { noremap = true, expr = true })
keymap("n", "Y", "y$", { silent = true })
keymap("n", "n", "nzzzv", { silent = true })
keymap("n", "N", "Nzzzv", { silent = true })
keymap("n", "gj", "mzJ`z", { silent = true, desc = "Join Line Below" })
keymap("v", "<", "<gv", { silent = true, desc = "Indent Less" })
keymap("v", ">", ">gv", { silent = true, desc = "Indent More" })
keymap("n", "<C-e>", "<Nop>", { silent = true, desc = "Scroll screen down" })
keymap("n", "<C-y>", "3<C-y>", { silent = true, desc = "Scroll screen up" })

-- disable Ex mode, I always enter in it by mistake
keymap("n", "Q", "<Nop>", { silent = true })

-- buffers
keymap("n", "<leader><leader>", "<C-^>", { silent = true, desc = "Last Buffer" })
keymap("n", "<leader>bn", "<cmd>enew<cr>", { silent = true, desc = "New File" })
keymap("n", "<leader>bq", "<cmd>q<cr>", { silent = true, desc = "Quit File" })
-- keymap("n", "<leader>bz", "<cmd>tab split<cr>", { silent = true, desc = "Zoom Buffer" })
keymap("n", "<leader>bo", function()
  local current_buffer = vim.api.nvim_get_current_buf()

  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if bufnr ~= current_buffer then
      vim.api.nvim_buf_delete(bufnr, {})
    end
  end
end, { desc = "Close Other Buffers" })
keymap("n", "<leader>bw", "<cmd>w<cr>", { silent = true, desc = "Write File" })
keymap("n", "<leader>bW", "<cmd>wa<cr>", { silent = true, desc = "Write All Files" })
keymap("n", "<leader>bQ", "<cmd>qa!<cr>", { silent = true, desc = "Quit nvim" })

-- keymap("n", "<leader>fm", "<cmd>messages<cr>", { silent = true, desc = "Messages" })
keymap("n", "<leader>fn", "<cmd>lua Snacks.notifier.show_history()<cr>", { silent = true, desc = "Noice" })

-- keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { silent = true, desc = "Toggle File Tree" })
-- keymap("n", "<leader>e", "<cmd>Yazi<CR>", { silent = true, desc = "Toggle File Tree" })

if vim.opt.diff:get() then
  keymap("n", "<leader>1", ":diffget LOCAL<CR>", { silent = true, desc = "Take Local" })
  keymap("n", "<leader>2", ":diffget BASE<CR>", { silent = true, desc = "Take Base" })
  keymap("n", "<leader>3", ":diffget REMOTE<CR>", { silent = true, desc = "Take Remote" })
end

keymap("n", "<leader>lj", "<cmd>%!jq<cr>", { silent = true, desc = "[JSON] Format" })
keymap("n", "<leader>lJ", "<cmd>%!jq -c<cr>", { silent = true, desc = "[JSON] Compact Format" })

keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", { silent = true, desc = "Format" })

keymap("n", "<F10>", function()
  if vim.o.conceallevel > 0 then
    vim.o.conceallevel = 0
  else
    vim.o.conceallevel = 2
  end
end, { silent = true, desc = "" })

keymap("n", "<F11>", function()
  if vim.o.concealcursor == "n" then
    vim.o.concealcursor = ""
  else
    vim.o.concealcursor = "n"
  end
end, { silent = true, desc = "" })

vim.g.tmux_resizer_resize_count = 2
vim.g.tmux_resizer_vertical_resize_count = 2
vim.g.tmux_resizer_no_mappings = 1
keymap("n", "<C-M-k>", "<cmd>:TmuxResizeUp<CR>", { silent = true })
keymap("n", "<C-M-j>", "<cmd>:TmuxResizeDown<CR>", { silent = true })
keymap("n", "<C-M-h>", "<cmd>:TmuxResizeLeft<CR>", { silent = true })
keymap("n", "<C-M-l>", "<cmd>:TmuxResizeRight<CR>", { silent = true })

-- TLDR: Conditionally modify character at end of line
-- Description:
-- This function takes a delimiter character and:
--   * removes that character from the end of the line if the character at the end
--     of the line is that character
--   * removes the character at the end of the line if that character is a
--     delimiter that is not the input character and appends that character to
--     the end of the line
--   * adds that character to the end of the line if the line does not end with
--     a delimiter
-- Delimiters:
-- - ","
-- - ";"
---@param character string
---@return function
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

keymap("n", "<leader>c,", modify_line_end_delimiter(","), { desc = "[Add] ',' to end of line" })
keymap("n", "<leader>c;", modify_line_end_delimiter(";"), { desc = "[Add] ';' to end of line" })

-----------------------------------------------------------------------------//
-- Multiple Cursor Replacement
-- http://www.kevinli.co/posts/2017-01-19-multiple-cursors-in-500-bytes-of-vimscript/
-----------------------------------------------------------------------------//
keymap("n", "<leader>cn", "*``cgn", { desc = "[Replace] Next Occurrence" })
keymap("n", "<leader>cN", "*``cgN", { desc = "[Replace] Next Occurrence (Backwards)" })

keymap("n", "<leader>oc", function()
  local filenameAndLine = vim.fn.expand("%:t") .. ":" .. vim.fn.line(".")
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
  script = script:gsub("<<filenameAndLine>>", filenameAndLine)
  vim.system({
    "osascript",
    "-e",
    script,
  })
end, { desc = 'Open chrome dev tools and run "open file" with current file and line' })

-----------------------------------------------------------------------------//
-- tbl_map bindings (from nvim_ok)
-----------------------------------------------------------------------------//
local l = '<Leader>'
local lt = '\\'
local quit_gracefully = function()
  local islast = #vim.api.nvim_list_wins() == 1
  local buftype = vim.bo.buftype
  local isnofile = buftype == 'nofile'
  local ishelp = buftype == 'help'
  vim.cmd((islast or isnofile or ishelp) and ':q' or ':bd')
end

vim.api.nvim_command "exe 'set cedit=<C-y>'"
vim.tbl_map(keymap_del, {
  { 'n', '<leader>l' },
})
vim.tbl_map(keymap_set, {
  { '<C-a>', '<ESC>g0i', mode = 'i', silent = false },
  { '<C-e>', '<ESC>g$i', mode = 'i', silent = false },
  { '<C-f>', '<ESC>lli', mode = 'i', silent = false },
  { '<C-b>', '<ESC>i', mode = 'i', silent = false },
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
  { '<M-q>', quit_gracefully, silent = false, 'Exit' },
  { 'q', quit_gracefully, mode = 't' },
})
vim.tbl_map(keymap_set, {
  { '<M-j>', [[<CMD>bp<CR>]], 'Prev Buffer' },
  { '<M-k>', [[<CMD>bn<CR>]], 'Next Buffer' },
  { '<M-x>', [[<CMD>bdelete<CR>]], 'Delete Buffer' },
})
vim.tbl_map(keymap_set, {
  {
    '<RightMouse>',
    function()
      local pos = vim.fn.getmousepos()
      if pos.winid ~= 0 then
        vim.api.nvim_set_current_win(pos.winid)
        vim.api.nvim_win_set_cursor(0, { pos.line, pos.column - 1 })
      end
      vim.cmd 'normal! "+yi"'
    end,
    silent = true,
    'Delete Buffer',
  },
})
vim.tbl_map(keymap_set, {
  { l .. 'ct', [[:%s/\s\+$//e<CR>]], 'Trim trailing' },
})
vim.tbl_map(keymap_set, {
  { lt .. 'G', [[<Cmd>call glyph_palette#apply()<CR>]], 'Toggle Glyph' },
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
  { lt .. 'f', [[:set cmdheight=<C-r>=&cmdheight ? 0 : 1<CR><CR>]], "Toggle 'cmdheight'" },
  { lt .. 'V', [[:set verbose=<C-r>=&verbose > 3 ? 3 : 9<CR><CR>]], "Toggle 'verbose'" },
  {
    lt .. 'd',
    [[:lua vim.diagnostic[vim.diagnostic.is_disabled() and 'enable' or 'disable']()<CR>]],
    "Toggle 'diagnostic'",
  },
  { lt .. 'L', [[:lua vim.cmd(#vim.lsp.get_clients() == 0 and 'LspStart' or 'LspStop')<CR>]], 'Toggle LSP' },
  { lt .. 'l', [[<Cmd>set rnu! | set nu!<CR>]], 'Toggle Numbers' },
})
