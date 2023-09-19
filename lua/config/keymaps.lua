local async = require("util.async")
local util = require("util.maputil")
local ui = require("user.ui")

local keymap_del = util.keymap_del
local keymap_set = util.keymap_set

vim.g.maplocalLeader = "\\"
vim.g.mapLeader = " "

vim.api.nvim_command("exe 'set cedit=<C-y>'")

vim.tbl_map(keymap_del, {
  "<Leader>sr",
  "<Leader>sR",
  "<Leader>p",
  "<Leader>l",
  "<Leader>L",
  "<Leader>`",
  "<Leader>,",
  "<Leader>K",
  "<Leader><Space>",
  { "v", "<Leader>noop" },
  "<C-_>",
})

vim.tbl_map(keymap_set, {
  { "<Leader>il", "<CMD>LspInfo<CR>", "LSP Info" },
  { "<Leader>iz", "<CMD>Lazy<CR>", "Lazy Info" },
  { "<Leader>im", "<CMD>Mason<CR>", "Mason Info" },
  { "<Leader>in", "<CMD>NullLsInfo<CR>", "Null-ls Info" },
  { "<Leader>if", "<CMD>verbose set filetype?<CR>", "FileType Info" },
})

vim.tbl_map(keymap_set, {
  { "<Leader>ewi", "<CMD>Neorg workspace mx<CR><CMD>Neorg toc<CR>", "Wiki Index" },
  { "<Leader>eww", "<CMD>Neorg workspace mx<CR>", "Wiki Workspace" },
  { "<Leader>ewj", "<CMD>Neorg workspace mx<CR><CMD>Neorg journal toc update<CR>", "Wiki Journal" },
  { "<Leader>ewy", "<CMD>Neorg workspace mx<CR><CMD>Neorg journal yesterday<CR>", "Wiki Yesterday" },
  { "<Leader>ewn", "<CMD>Neorg workspace mx<CR><CMD>Neorg journal today<CR>", "Wiki Today" },
  { "<Leader>ewt", "<CMD>Neorg workspace mx<CR><CMD>Neorg journal tomorrow<CR>", "Wiki Tomorrow" },

  { "<Leader>ehh", "<CMD>DevdocsOpenCurrentFloat<CR>", "Devdocs Current [+f]" },
  { "<Leader>ehH", "<CMD>DevdocsOpenCurrent<CR>", "Devdocs Current" },
  { "<Leader>eho", "<CMD>DevdocsOpenFloat<CR>", "Devdocs Index [+f]" },
  { "<Leader>ehO", "<CMD>DevdocsOpen<CR>", "Devdocs Index" },

  { "<Leader>ezr", "<CMD>LazyReload<CR>", "Reload Lazy Plugin" },

  { "<Leader>exy", ":lua <C-R>* <C-y>", "Inspect Yank (CMD)" },
  { "<Leader>exx", ":Xdir lua =<C-R>: <C-y>", "Inspect Redirect (CMD)" },
  { "<Leader>exe", ":Xdir <C-R>=", "Inspect Expand (Redirect)" },
  { "<Leader>exl", ":Xdir <C-R>= <C-R><C-L>", "Inspect Expand Line (Redirect)" },
})

vim.tbl_map(keymap_set, {
  { "<Leader>uh", "<CMD>lua require('mini.hipatterns').enable()<CR>", "Toggle Color Highlight" },
  { "<Leader>sr", "<CMD>Telescope resume<CR>", "Resume" },
  { "<Leader>fr", "<CMD>FileRename<CR>", "File Rename" },
  { "<Leader>bb", "<CMD>e #<CR>", "Other Buffer" },
})

vim.tbl_map(keymap_set, {
  { "<C-h>", "<CMD>NavigatorLeft<CR>" },
  { "<C-l>", "<CMD>NavigatorRight<CR>" },
  { "<C-j>", "<CMD>NavigatorDown<CR>" },
  { "<C-k>", "<CMD>NavigatorUp<CR>" },
})

vim.tbl_map(keymap_set, {
  { "<C-f>", "<Right>", mode = "c" },
  { "<C-a>", "<Home>", mode = "c" },
  { "<C-b>", "<Left>", mode = "c" },
  { "<M-b>", "<C-b>", mode = "c" },
  { "<M-k>", "<Up>", mode = "c" },
  { "<M-j>", "<Down>", mode = "c" },
  { "<S-Enter>", "<CMD>lua require('noice').redirect(vim.fn.getcmdline())<CR>", mode = "c", "Redirect Cmdline" },
})

vim.tbl_map(keymap_set, {
  { "<M-J>", "<C-w>-" },
  { "<M-K>", "<C-w>+" },
  { "<M-H>", "<C-w><" },
  { "<M-L>", "<C-w>>" },
})

vim.tbl_map(keymap_set, {
  { "<M-w>", "<CMD>BufferLineCloseLeft<CR>", "Close All Buf to Left" },
  { "<M-e>", "<CMD>BufferLineCloseRight<CR>", "Close All Buf to Right" },

  { "<M-Left>", "<CMD>BufferLineMovePrev<CR>", "Move Buf Left" },
  { "<M-Right>", "<CMD>BufferLineMoveNext<CR>", "Move Buf Right" },

  { "<M-k>", "<CMD>BufferLineCycleNext<CR>", "Next Buf" },
  { "<M-j>", "<CMD>BufferLineCyclePrev<CR>", "Next Prev" },
})

vim.tbl_map(keymap_set, {
  { "gG", "<CMD>OpenGithubLink<CR>", "Open Github Link" },
  { "gL", "<CMD>OpenWebLink<CR>", "Open Link" },
  { "Y", [[y$]], "Copy till end-of-line (P)" },
  { "cp", [[:let @+ = expand("%:p") .. ':' .. line(".")<cr>]], "Copy Path (S)" },
})

vim.tbl_map(keymap_set, {
  { "jk", "<ESC>", mode = "i" },
  { "<M-e>", [[g$$]], mode = "i" }, -- BUG: <<
  { "<M-p>", [["+p]], "Paste System (S)" },
  { "<M-Y>", [[gg"+yG]], "Copy whole file (S)" },
  { "<M-y>", [["+y$]], "Copy till end-of-line (S)" },
  { "<M-p>", [[<ESC>"+p]], mode = "i", "Paste (S)" },
  { "<M-y>", [["+y]], mode = "v", "Copy Selection (S)" },
})

vim.tbl_map(keymap_set, {
  { "<M-c>", "<CMD>lua require('notify').dismiss({ silent = true, pending = true })<CR>", "Dismiss Notification" },
  { "<C-q>", "<CMD>lua require('user.qtoggle').toggle_qf()<CR>", "Quickfix Toggle" },
  { "<M-d>", "<ESC>:<C-y>", "Command" },
  { "<C-s>", ':set buftype=""<CR> :w<CR><Esc>', silent = true, "Save File" },
  { "<M-s>", ':set buftype=""<CR> :w<CR><Esc>', silent = true, "Save File" },
  { "<M-q>", ":q<CR>", silent = true, "Exit" },
  { "<M-Q>", ":qall!<CR>", silent = true, "Exit All" },
})

vim.tbl_map(keymap_set, {
  {
    "<c-f>",
    function()
      if not require("noice.lsp").scroll(4) then
        return "<c-f>"
      end
    end,
    mode = { "n", "i", "s" },
    silent = true,
    expr = true,
  },

  {
    "<c-b>",
    function()
      if not require("noice.lsp").scroll(-4) then
        return "<c-b>"
      end
    end,
    mode = { "n", "i", "s" },
    silent = true,
    expr = true,
  },

  {
    "<C-c>",
    function()
      if vim.bo.modifiable then
        vim.cmd(":normal gcc<CR>")
      end
    end,
    "Toggle Comment",
  },

  {
    "cd",
    function()
      local path = vim.fn.expand("%:p")
      local base = path:match("@?(.*/)")
      local ok, msg = pcall(vim.api.nvim_set_current_dir, base)
      vim.schedule(function()
        vim.notify(base, vim.log.levels[ok and "INFO" or "ERROR"], { title = msg or "Changed directory" })
      end)
    end,
    "Change Directory",
  },

  {
    "<Leader>eof",
    async.void(function()
      vim.bo.filetype = ui.select(vim.fn.getcompletion("*", "filetype"), { prompt = "Select FileType:" }) or vim.bo.filetype
      vim.notify(vim.bo.filetype, vim.log.levels.INFO, { title = "FileType Updated" })
    end),
    "Set File Type",
  },

  {
    "<Leader>eov",
    function()
      local old = vim.o.verbose
      local new = old == 0 and 16 or 0
      local msg = string.format("Updated Verbose Level from %s to %s", old, new)
      local lvl = vim.log.levels[vim.o.verbose == 0 and "INFO" or "WARN"]
      vim.notify(msg, lvl, { title = "Verbose Level" })
      vim.o.verbose = new
    end,
    "Set Verbose Level",
  },
})

-- ////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////

-- { "<Leader>ed", ":Xdir <C-R>: <C-y>", "Inspect Previous" },

-- map("n", "<Leader>cM", ":Mason<CR>", { desc = "Mason" })
-- map("n", "<Leader>ce", ":new | r ! node #<CR>", { desc = "Exec" })
-- map("n", "<Leader>cc", ":make | cope<CR>", { desc = "Cope" })

-- new | r ! node #
-- !}fmt
-- new | r ! <cmd>

-- vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
--   if not require("noice.lsp").scroll(4) then
--     return "<c-f>"
--   end
-- end, { silent = true, expr = true })

-- map("n", "<Leader>rx", function() end, { silent = true, noremap = true, desc = "Inspect Recent" })
-- vim.keymap.set("n", "<Leader>rx", function()
-- require("noice").redirect("hi")
-- require("noice").redirect("lua print(vim.fn.getreg())")
-- end)

-- which_key.register({
-- d = {
--   name = "Debug",
--   s = {
--     name = "+Search",
--     c = { ":Telescope dap commands<CR>", "Dap Commands" },
--     C = { ":Telescope dap configurations<CR>", "Dap Configurations" },
--     v = { ":Telescope dap variables<CR>", "Dap Variables" },
--     l = { ":Telescope dap list_breakpoints<CR>", "Dap Breakpoints" },
--     f = { ":Telescope dap frames<CR>", "Dap Frames" },
--   },
-- },
-- which_key.register({
--   h = {
--     name = "color",
--     h = { "<cmd>ColorizerToggle<cr>", "Toggle Colorizer" },
--     f = { "<cmd>lua require('colorizer').attach_to_buffer(0, { mode = 'foreground'})<cr>", "Foreground Colorizer" },
--     v = { "<cmd>lua require('colorizer').attach_to_buffer(0, { mode = 'virtualtext'})<cr>", "Virtual Colorizer" },
--   },
-- }, { prefix = "<Leader>u" })

-- local bufopt = { noremap = true, silent = true, buffer = vim.fn.expand("%") }
-- map("n", "<Leader>lr", "<cmd>vim.lsp.buf.rename", bufopt)
-- map("n", "<Leader>lr", "nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>", opt)

-- zmap("n", "<Leader>gg", function()
--   Util.float_term({ "gitui" }, { cwd = Util.get_root() })
-- end, { desc = "GitUI (root dir)" })
-- zmap("n", "<Leader>gG", function()
--   Util.float_term({ "gitui" })
-- end, { desc = "GitUI (cwd)" })
-- vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
-- vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
-- vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
-- vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
-- vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
-- vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
-- vim.keymap.set("n", "<Leader>sr", "<ESC>", { desc = "Make" })

-- vim.keymap.set("n", "<left>", "<C-w>h")
-- vim.keymap.set("n", "<down>", "<C-w>j")
-- vim.keymap.set("n", "<up>", "<C-w>k")
-- vim.keymap.set("n", "<right>", "<C-w>l")
-- vim.keymap.set("n", "<C-c>", "<cmd>normal! ciw<cr>a")
-- vim.keymap.set("n", "<Leader>cR", util.runlua, { desc = "Run Lua" })
-- align_to_char(length, reverse, preview, marks)
-- align_to_string(is_pattern, reverse, preview, marks)
-- align(str, reverse, marks)
-- operator(fn, opt)
-- Where:
--      length: integer
--      reverse: boolean
--      preview: boolean
--      marks: table (e.g. {1, 0, 23, 15})
--      str: string (can be plaintext or Lua pattern if is_pattern is true)

-- vim.keymap.set("x", "aa", function()
--   require("align").align_to_char(1, true)
-- end, opt) -- Aligns to 1 character, looking left
-- vim.keymap.set("x", "as", function()
--   require("align").align_to_char(2, true, true)
-- end, opt) -- Aligns to 2 characters, looking left and with previews
-- vim.keymap.set("x", "aw", function()
--   require("align").align_to_string(false, true, true)
-- end, opt) -- Aligns to a string, looking left and with previews
-- vim.keymap.set("x", "ar", function()
--   require("align").align_to_string(true, true, true)
-- end, opt) -- Aligns to a Lua pattern, looking left and with previews
--
-- -- Example gawip to align a paragraph to a string, looking left and with previews
-- vim.keymap.set("n", "gaw", function()
--   local a = require("align")
--   a.operator(a.align_to_string, { is_pattern = false, reverse = true, preview = true })
-- end, opt)
--
-- -- Example gaaip to aling a paragraph to 1 character, looking left
-- vim.keymap.set("n", "gaa", function()
--   local a = require("align")
--   a.operator(a.align_to_char, { length = 1, reverse = true })
-- end, opt)

-- map("n", "<cr>", "<CR>", opt)
-- echo luaeval('_A[1] + _A[2]', [1, 1])
-- echo luaeval('vim.opt.completeopt')
-- echo luaeval(getline("."))
-- vim.opt.completeopt

-- print(vim.inspect(vim.api.nvim_get_current_line()))
-- :enew|put=execute('lua =package.loaded')
-- :enew|put=execute("lua =vim.fn.expand('<cword>')")
-- vim.api.nvim_get_current_line()
-- package
-- print(vim.inspect(vim.opt.completeopt))
--[[
old_map("n", "<C-h>", "<CMD>lua require('Navigator').left()<CR>", opt)
old_map("n", "<C-l>", "<CMD>lua require('Navigator').right()<CR>", opt)
old_map("n", "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opt)
old_map("n", "<C-k>", "<CMD>lua require('Navigator').up()<CR>", opt)
]]
--[[
]]
-- map("n", "<Leader>li", "<cmd>:LspInfo<cr>", { desc = "LSP Info" })

-- map("c", "<C-a>", "<Home>", nor)
-- filetype=TelescopePrompt
--

-- local Util = require("lazyvim.util")
-- local function zmap(mode, lhs, rhs, opt)
--   local keys = require("lazy.core.handler").handlers.keys
--   if not keys.active[keys.parse({ lhs, mode = mode }).id] then
--     opt = opt or {}
--     opt.silent = opt.silent ~= false
--     vim.keymap.set(mode, lhs, rhs, opt)
--   end
-- end
-- vim.keymap.set("x", "aa", function()
-- vim.keymap.set("n", "<space>vv", function()
--   Util.float_term({ "ranger" }, {
--     cwd = Util.get_root(),
--     esc_esc = false,
--     ctrl_hjkl = false,
--   })
-- end, { desc = "TEST" })
-- vim.keymap.set("n", "_", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- vim.keymap.set("n", "_", "<CMD>lua require('oil').open_float()<CR>", { desc = "Open FT" })

-- vim.keymap.set(
--   "n",
--   "<Leader>uX",
--   "<CMD>TSContextToggle<CR>",
--   { noremap = true, silent = true, desc = "Toggle Context" }
-- )

-- OverseerOpen[!]
-- OverseerClose
-- OverseerToggle[!]
-- OverseerSaveBundle
-- OverseerLoadBundle[!]
-- OverseerDeleteBundle
-- OverseerRunCmd
-- OverseerRun
-- OverseerInfo
-- OverseerBuild
-- OverseerQuickAction
-- OverseerTaskAction
-- OverseerClearCache
-- map("n", "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opt)
-- function()
--   require("notify").dismiss({ silent = true, pending = true })
-- end,
-- map("n", "<M-d>", "<ESC>:", nor)
-- :vnew +pu=execute(' ')
-- vim.cmd("nnoremap <Leader>R :Nredir <c-f>A")
-- vim.cmd("nnoremap <Leader>R :Xdir <c-f>A")
-- map("n", "<Leader>rr", ":Xdir <C-f>", { silent = true, noremap = true, desc = "Inspect Recent" })
-- echo 'xorg'
-- ":lua require('user.plugins.xredir').redirect('@*')<CR>",
-- function() require("user.plugins.xredir").redirect("@*") end,

-- function() require("noice").redirect(vim.api.nvim_eval("expand('<C-f>')")) end
-- require("noice").redirect(cmd)
-- vim.cmd([[ setf vim ]])
-- require("noice").redirect(function() print("test") end)
-- vim.o.cedit = "<C-f>"
-- exe "set cedit=\<C-Y>"
--     function() require("telescope").extensions.yank_history.yank_history({}) end,
--     desc = "Yank history",

-- WHICH_KEY
-- which_key.register({
--   t = {
--     name = "Tabs",
--     n = { "<cmd>tabnew<CR>", "New Tab" },
--     c = { "<cmd>tabclose<CR>", "Close Tab" },
--   },
--   l = {
--     name = "LSP",
--     L = { "<cmd>:Lazy<cr>", "Lazy" },
--   },
-- }, { prefix = "<LocalLeader>" })
--
-- which_key.register({
--   -- t = { name = "EXEC", },
--   r = { name = "Replace" },
--   e = { name = "Exec", x = { name = "Experiments" }, h = { name = "DevDocs" } },
--   -- d = { x = { name = "CMD", }, },
--   i = {
--     name = "Info",
--     l = { ":LspInfo<CR>", "LSP Info" },
--     n = { ":NullLsInfo<CR>", "Null-ls Info" },
--     -- f = { ":verbose set filetype?<CR>", "FileType Info" },
--     -- f = { ":lua require('noice').redirect('verbose set filetype?')<CR>", "FileType Info" },
--     f = { ":Xdir verbose set filetype?<CR>", "FileType Info" },
--   },
--   f = {
--     name = "File",
--     s = { ':set buftype=""<cr> :w<CR><Esc>', "Save File" },
--   },
--   o = {
--     name = "Org",
--     i = { "<CMD>Neorg workspace mx<CR><CMD>Neorg toc<CR>", "Org Index" },
--     w = { "<CMD>Neorg workspace mx<CR>", "Org Workspace" },
--     j = { "<CMD>Neorg journal toc update<CR>", "Org Journal Index" },
--     t = { "<CMD>Neorg journal today<CR>", "Org Journal Today" },
--     y = { "<CMD>Neorg journal yesterday<CR>", "Org Journal Yesterday" },
--   },
-- }, { prefix = "<Leader>" })
-- pcall(vim.keymap.del, "n", "<Leader>fr")
-- pcall(vim.keymap.del, "n", "gr")
-- { "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "Goto Definition", has = "definition" },
-- map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
-- map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
-- pcall(vim.keymap.del, "n", "<Leader>fr")
-- vim.keymap.set("n", "<Leader>rc", ":IncRename<CR>", { desc = "Rename Cursor" })
-- vim.keymap.set("n", "<Leader>f", ":lua require('noice').redirect('verbose set filetype?')<CR>", { desc = "FileType Info" })
-- vim.keymap.set("n", "<Leader>f", ":Xdir verbose set filetype?<CR>", { desc = "FileType Info" })

-- map("n", "<Leader>L", "<CMD>Lazy<CR>", { noremap = true, desc = "Lazy" })
-- map("n", "<M-t>", ":TroubleToggle<CR>", { desc = "Trouble Toggle" })
-- { mode = "n", keys = "<Leader>eo", desc = "+Org" },
-- map("n", "<Leader>eo", "", { desc = "+Org" })
-- map("n", "<Leader>dd", ":+<C-R><C-W> <C-y>", { noremap = true, desc = "Inspect Recent" })
-- { mode = "n", keys = "<Leader>eh", desc = "+Help" },
-- map("n", "<Leader>eh", "", { desc = "+Help" })
-- { mode = "n", keys = "<Leader>eg", desc = "+Gen" },
-- { mode = "n", keys = "<Leader>ex", desc = "+Inspect" },
-- map("n", "<Leader>ex", "", { desc = "+Inspect" })
-- vim.cmd("nnoremap <Leader>R :Nredir <c-f>A")
-- vim.keymap.del("n", "gc")
-- https://github.com/neovim/neovim/pull/16591
--
-- vim.api.nvim_set_keymap("n", "gd", "lua require('some_module').func()", {})
-- vim.keymap.set("n", "gd", function() require('some_module').func() end)
-- set_keymap("<Leader>il", "<CMD>LspInfo<CR>")
-- set_keymap("<Leader>oo", "<CMD>LspInfo<CR>", "foo bar")
-- set_keymap("<Leader>oo", "<CMD>LspInfo<CR>", { desc = "mydesc", silent = true })
-- set_keymap("<Leader>oo", "<CMD>LspInfo<CR>", { desc = "mydesc", mode = { "n", "v", "x" }, silent = true })
-- local lspAttached = #vim.lsp.get_active_clients() > 0 and lspAttached else print("TODO")
-- map("n", "<C-c>", ":normal gcc<CR>", opt)
-- { "<C-a>", function() return vim.bo[vim.api.nvim_win_get_buf(0)].modifiable and require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
-- [[:let @+ = expand("%:p") .. expand("<slnum>")<cr>]],
-- echo expand("<cfile>")
-- vim.cmd([[ nnoremap qq :let @q = '^'<cr>^qQ ]])
-- map("n", "qq", [[<ESC>:q<cr>]], { noremap = false, silent = true, desc = "Quit" })

-- map("n", "Y", [[y$]], opt)
-- map("n", "Q", [[ :q<CR> ]], opt)
--

-- { "<Leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
-- map(
--   "n",
--   "<Leader>sT",
--   "<CMD>lua require'telescope.builtin'.builtin{}<CR>",
--   { noremap = true, silent = true, desc = "Search Telescope" }
-- )

-- TODO: Telescope search: >>
-- lua require("persistence").list()
-- | f           | \<c-f\>     | find\_project\_files       |
-- | b           | \<c-b\>     | browse\_project\_files     |
-- | d           | \<c-d\>     | delete\_project            |
-- | s           | \<c-s\>     | search\_in\_project\_files |
-- | r           | \<c-r\>     | recent\_project\_files     |
-- | w           | \<c-w\>     | change\_working\_directory |

-- project
-- lua =require("project_nvim").get_recent_projects()
-- lua =require("project_nvim").delete_project()
-- /home/meta/dev/forks/dotfiles-steve/vimplugins/aerial.nvim/lua/telescope/_extensions/aerial.lua
--lua require'telescope.builtin'.resume{}
--lua require'telescope.builtin'.live_grep{}
-- map("n", "<M-w>", ":Telescope grep_string<CR>", opt)
--[[
old_map("n", "<M-g>", ":Telescope live_grep<CR>", opt)
old_map("n", "<M-f>", ":Telescope find_files<CR>", opt)
old_map("n", "<M-F>", ":Telescope find_files hidden=true<CR>", opt) -- lua require("telescope.builtin").find_files({hidden=true})
old_map("n", "<M-o>", ":Telescope oldfiles<CR>", opt)
old_map("n", "<M-r>", ":Telescope resume<CR>", opt)
old_map("n", "<M-m>", ":Telescope keymaps<CR>", opt)
old_map("n", "<M-b>", ":Telescope file_browser<CR>", opt) -- Telescope buffers
old_map("n", "<M-C>", ":Telescope commands<CR>", opt)
old_map("n", "<Leader>sx", ":Telescope builtin<CR>", { desc = "Search Telescope" })
]]
-- map("n", "<Leader>sr", ":Telescope resume<CR>", { desc = "Resume" })
-- echo 'foo'
-- lua require("util.debug").dump(vim.opt.completeopt)
-- lua dd(vim.opt.completeopt)
-- map(
--   "n",
--   "<Leader>Dd",
--   "<CMD>lua require('noice').redirect('@*')<CR>",
--   { silent = true, noremap = true, desc = "Inspect Yank" }
-- )
-- require("noice").redirect(function() print("test") end)
-- vim.keymap.set("c", "<S-Enter>", function()
--   require("noice").redirect(vim.fn.getcmdline())
-- end, { desc = "Redirect Cmdline" })
-- local set = function(lhs, rhs, opts)
--   local mode = "n"
--   opts = opts or {}
--
--   if type(opts) == "string" then
--     opts = { desc = opts }
--   end
--
--   if opts.mode then
--     mode = opts.mode
--     opts.mode = nil
--   end
--
--   vim.keymap.set(mode, lhs, rhs, opts)
-- end
--
-- BUG:
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"y"**

--[[
    1 Lua assignments to options, mappings, etc.
    2 When a file is ":source"'ed, or |shada| file is read or written.
    3 UI info, terminal capabilities.
    4 Shell commands.
    5 Every searched tags file and include file.
    8 Files for which a group of autocommands is executed.
    9 Executed autocommands.
    11  Finding items in a path.
    12  Vimscript function calls.
    13  When an exception is thrown, caught, finished, or discarded.
    14  Anything pending in a ":finally" clause.
    15  Ex commands from a script (truncated at 200 characters).
    16  Ex commands.
]]
