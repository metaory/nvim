local l = "<Leader>"
local lt = "\\"

local keymap_del = function(t)
  local mode, lhs = unpack(t)
  pcall(vim.keymap.del, mode, lhs)
end
local keymap_set = function(t)
  local lhs, rhs, desc = unpack(t)
  local opts = { desc = desc, noremap = true, silent = true }
  for k, v in pairs(t) do
    if type(k) == "string" then
      opts[k] = v
    end
  end
  local mode = opts.mode or "n"
  opts.mode = nil
  pcall(vim.keymap.set, mode, lhs, rhs, opts)
end
local toggle_set = function(t)
  local lhs, rhs, desc = unpack(t)
  keymap_set({
    lhs,
    function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(rhs, true, false, true), "nx", false)
      Snacks.notify(desc, { title = "Toggle" })
    end,
    desc,
  })
end

local quit_gracefully = function()
  local islast = #vim.api.nvim_list_wins() == 1
  local buftype = vim.bo.buftype
  local isnofile = buftype == "nofile"
  local ishelp = buftype == "help"
  vim.cmd((islast or isnofile or ishelp) and ":q" or ":bd")
end

local dd = function()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end

keymap_set({ "x", '"_x' })
keymap_set({ "dd", dd, nil, noremap = true, expr = true })

vim.tbl_map(keymap_set, {
  {
    "<RightMouse>",
    function()
      local pos = vim.fn.getmousepos()
      if pos.winid ~= 0 then
        vim.api.nvim_set_current_win(pos.winid)
        vim.api.nvim_win_set_cursor(0, { pos.line, pos.column - 1 })
      end
      vim.cmd('normal! "+yi"')
    end,
    silent = true,
    "Delete Buffer",
  },
})

keymap_set({
  "<F10>",
  function()
    vim.o.conceallevel = vim.o.conceallevel > 0 and 0 or 2
  end,
  "",
})
keymap_set({
  "<F11>",
  function()
    vim.o.concealcursor = vim.o.concealcursor == "n" and "" or "n"
  end,
  "",
})

vim.tbl_map(keymap_set, {
  { "Y", "y$" },
  { "n", "nzzzv" },
  { "N", "Nzzzv" },
  { "gj", "<ESC>:join<CR>$", "Join Line Below" },
  { "<", "<gv", "Indent Less", mode = "v" },
  { ">", ">gv", "Indent More", mode = "v" },
  { "<C-e>", "<Nop>", "Scroll screen down" },
  { "<C-y>", "3<C-y>", "Scroll screen up" },
  { "Q", "<Nop>" },
})

vim.tbl_map(keymap_set, {
  { "<C-M-k>", [[<cmd>lua require("tmux").resize_top(step)<cr>]] },
  { "<C-M-j>", [[<cmd>lua require("tmux").resize_bottom(step)<cr>]] },
  { "<C-M-h>", [[<cmd>lua require("tmux").resize_left(step)<cr>]] },
  { "<C-M-l>", [[<cmd>lua require("tmux").resize_right(step)<cr>]] },
})
vim.tbl_map(keymap_set, {
  { "<C-a>", "<ESC>g0i", mode = "i", silent = true },
  { "<C-f>", "<ESC>lli", mode = "i", silent = true },
  { "<C-b>", "<ESC>i", mode = "i", silent = true },
})
vim.tbl_map(keymap_set, {
  { "<M-k>", "<Up>", mode = "c", silent = false },
  { "<M-j>", "<Down>", mode = "c", silent = false },
  { "<C-f>", "<Right>", mode = "c", silent = false },
  { "<C-a>", "<Home>", mode = "c", silent = false },
  { "<C-b>", "<Left>", mode = "c", silent = false },
  { "<M-b>", "<C-b>", mode = "c", silent = false },
  { "<M-e>", "<C-f>", mode = "c" },
  { "w!!", "!sudo tee %<CR>", mode = "c", silent = true },
})
vim.tbl_map(keymap_set, {
  { "<M-Y>", [[<ESC>gg"+yGg;zz]], mode = "n", "N Yank whole file (S)" },
  { "<M-Y>", [[<ESC>gg"+yGg;zz]], mode = "i", "I Yank whole file (S)" },
  { "<M-Y>", [["+y]], mode = "v", "V Yank whole file (S)" },
  { "<M-y>", [["+y]], mode = "v", "V Yank Selection (S)" },
  { "<M-y>", [["+y$]], mode = "n", "N Yank till end-of-line (S)" },
  { "<M-y>", [[<ESC>gg"+yGg;zz]], mode = "i", "I Yank whole file (S)" },
  { "<M-p>", [[<ESC>"+p]], mode = "i", "Paste (S)" },
})
vim.tbl_map(keymap_set, {
  { "<M-d>", "<ESC>:<C-y>", "Command" },
  { "<M-s>", "<ESC>:w<CR>", silent = true, "Save File" },
  { "<M-Q>", ":q<CR>", mode = "n", silent = true, "Exit" },
  {
    "<M-q>",
    function()
      local wins = vim.tbl_filter(function(win)
        return vim.api.nvim_win_get_config(win).relative == ""
      end, vim.api.nvim_tabpage_list_wins(0))
      if #wins > 1 then
        vim.cmd.close()
        return
      end
      vim.cmd(#vim.fn.getbufinfo({ buflisted = 1 }) > 1 and "bdelete" or "q")
    end,
    mode = "n",
    silent = true,
    "close",
  },
  { "q", quit_gracefully, mode = "t" },
  { "<leader>q", quit_gracefully, silent = false, "Exit" },
})
vim.tbl_map(keymap_set, {
  { "<M-j>", [[<CMD>bp<CR>]], "Prev Buffer" },
  { "<M-k>", [[<CMD>bn<CR>]], "Next Buffer" },
  { "<M-x>", [[<CMD>bdelete<CR>]], "Delete Buffer" },
})
vim.tbl_map(keymap_set, {
  {
    "<M-g>",
    function()
      require("snacks").picker.grep({ root = false })
    end,
    "Grep (cwd)",
  },
  {
    "<M-r>",
    function()
      require("snacks").picker.resume()
    end,
    "Resume Last Picker",
  },
})

vim.tbl_map(keymap_set, {
  {
    "<leader>fM",
    function()
      require("snacks").picker.man()
    end,
    "Man pages",
  },
  { "<leader>fn", "<cmd>lua Snacks.notifier.show_history()<cr>", "Noice" },
})

vim.tbl_map(keymap_set, {
  { "<esc>", "<cmd>noh<cr><esc>", "Escape and clear hlsearch", mode = "i" },
  { "<esc>", "<cmd>noh<cr><esc>", "Escape and clear hlsearch", mode = "n" },
})
vim.tbl_map(keymap_set, {
  { "<leader><Tab>d", ":tabclose<CR>", "Close Tab" },
  { "<leader><Tab>n", ":tabnext<CR>", "Next Tab" },
  { "<leader><Tab>p", ":tabprevious<CR>", "Previous Tab" },
})

if vim.opt.diff:get() then
  vim.tbl_map(keymap_set, {
    { "<leader>1", ":diffget LOCAL<CR>", "Take Local" },
    { "<leader>2", ":diffget BASE<CR>", "Take Base" },
    { "<leader>3", ":diffget REMOTE<CR>", "Take Remote" },
  })
end

vim.tbl_map(keymap_set, {
  { "<leader>lj", "<cmd>%!jq<cr>", "[JSON] Format" },
  { "<leader>lJ", "<cmd>%!jq -c<cr>", "[JSON] Compact Format" },
  { "<leader>lf", require("metaory.functions.format"), "Format" },
})

vim.tbl_map(keymap_set, {
  { "<leader>c,", require("metaory.functions.line_end_delimiter")(","), "[Add] ',' to end of line" },
  { "<leader>c;", require("metaory.functions.line_end_delimiter")(";"), "[Add] ';' to end of line" },
  { "<leader>cn", "*``cgn", "[Replace] Next Occurrence" },
  { "<leader>cN", "*``cgN", "[Replace] Next Occurrence (Backwards)" },
  { "<leader>ct", [[:%s/\s\+$//e<CR>]], "Trim trailing" },
})

vim.tbl_map(keymap_set, {
  { "<leader>oc", require("metaory.functions.inspect_cmd"), "Inspect cmd output" },
  { "<leader>ob", require("metaory.functions.open_browser"), "Open browser" },
})

-----------------------------------------------------------------------------//
-- tbl_map bindings (from nvim_ok)
-----------------------------------------------------------------------------//
vim.api.nvim_command("exe 'set cedit=<C-y>'")
vim.tbl_map(keymap_del, { { "n", "<leader>l" } })

vim.tbl_map(keymap_set, {
  { lt .. lt, [[<Cmd>AvanteAsk<CR>]], "Avante Ask" },
  { lt .. "i", require("metaory.functions.highlight_lines").add, "Highlight matches" },
  { lt .. "I", require("metaory.functions.highlight_lines").clear, "Clear Highlights" },
})

vim.tbl_map(toggle_set, {
  { lt .. "G", [[<Cmd>call glyph_palette#apply()<CR>]], "Toggle Glyph" },
  { lt .. "s", '<cmd>lua require("kulala").scratchpad()<cr>', "Toggle scratchpad" },
  { lt .. "O", [[<Cmd>    set cursorline! | set cursorcolumn!<CR>]], "Toggle CursorLine" },
  { lt .. "X", [[<Cmd>    TSContextToggle<CR>]], "Toggle TSContext" },
  { lt .. "h", [[<Cmd>    TSBufToggle highlight<CR>]], "Toggle TSHighlight" },
  { lt .. "H", [[<Cmd>lua require("mini.hipatterns").toggle()<CR>]], "Toggle Hipatterns" },
  { lt .. "m", [[<Cmd>lua MiniMap.toggle()<CR>]], "Toggle Map" },
  { lt .. "Z", [[<Cmd>lua MiniMisc.zoom()<CR>]], "Toggle Zoom " },
  { lt .. "T", [[<Cmd>lua vim.b.minitrailspace_disable = not vim.b.minitrailspace_disable<CR>]], "Toggle Trailspace" },
  { lt .. "C", [[<Cmd>lua vim.b.minicursorword_disable = not vim.b.minicursorword_disable<CR>]], "Toggle CursorWord" },
  { lt .. "w", [[:setlocal nowrap!<CR>]], "Toggle Wrap" },
  { lt .. "c", [[:setlocal conceallevel=<C-r>=&conceallevel == 0 ? 3 : 0<CR><CR>]], "Toggle 'conceallevel'" },
  { lt .. "f", [[:set cmdheight=<C-r>=&cmdheight ? 0 : 1<CR><CR>]], "Toggle cmdheight" },
  { lt .. "V", [[:set verbose=<C-r>=&verbose > 3 ? 3 : 9<CR><CR>]], "Toggle verbose" },
  { lt .. "d", [[:lua vim.diagnostic[vim.diagnostic.is_disabled() and 'enable' or 'disable']()<CR>]], "Toggle 'diagnostic'" },
  { lt .. "L", [[:lua vim.cmd(#vim.lsp.get_clients() == 0 and 'LspStart' or 'LspStop')<CR>]], "Toggle LSP" },
  { lt .. "l", [[<Cmd>set rnu! | set nu! | set signcolumn=no <CR>]], "Toggle Gutter" },
  { lt .. "F", [[<Cmd>lua vim.g.disable_autoformat = not vim.g.disable_autoformat<CR>]], "Toggle Autoformat" },
  { lt .. "n", [[<Cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>]], "Toggle Inlay hints" },
})

-- reference: count-aware j/k
-- vim.tbl_map(keymap_set, {
--   { 'j', [[(v:count > 1 ? 'm`' . v:count : '') . 'gj']], nil, expr = true },
--   { 'k', [[(v:count > 1 ? 'm`' . v:count : '') . 'gk']], nil, expr = true },
-- })

-- reference: buffer helpers
-- local close_other_buffers = function()
--   local current_buffer = vim.api.nvim_get_current_buf()
--   for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
--     if bufnr ~= current_buffer then
--       vim.api.nvim_buf_delete(bufnr, {})
--     end
--   end
-- end
-- vim.tbl_map(keymap_set, {
--   { '<leader><leader>', '<C-^>', 'Last Buffer' },
--   { '<leader>bn', '<cmd>enew<cr>', 'New File' },
--   { '<leader>bq', '<cmd>q<cr>', 'Quit File' },
--   { '<leader>bo', close_other_buffers, 'Close Other Buffers' },
--   { '<leader>bw', '<cmd>w<cr>', 'Write File' },
--   { '<leader>bW', '<cmd>wa<cr>', 'Write All Files' },
--   { '<leader>bQ', '<cmd>qa!<cr>', 'Quit nvim' },
-- })

-- reference: window resize
-- vim.tbl_map(keymap_set, {
--   { "<C-M-J>", "<C-w>-" },
--   { "<C-M-K>", "<C-w>+" },
--   { "<C-M-H>", "<C-w><" },
--   { "<C-M-L>", "<C-w>>" },
-- })
-- vim.g.tmux_resizer_resize_count = 2
-- vim.g.tmux_resizer_vertical_resize_count = 2
-- vim.g.tmux_resizer_no_mappings = 1
-- { "<C-M-k>", "<cmd>:TmuxResizeUp<CR>" }
-- { "<C-M-j>", "<cmd>:TmuxResizeDown<CR>" }
-- { "<C-M-h>", "<cmd>:TmuxResizeLeft<CR>" }
-- { "<C-M-l>", "<cmd>:TmuxResizeRight<CR>" }
-- { '<C-e>', '<ESC>g$i', mode = 'i', silent = false }
-- { 'gj', 'mzJ`z', 'Join Line Below' }
-- { '<leader>ol', ':Lazy<CR>', "Lazy" }
