-- BUG:
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"y"**
-- - rhs: `<Plug>(YankyYank)`

--local util = require("util")
-- local Util = require("lazyvim.util")
-- local which_key = require("which-key")
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
local nor = { noremap = true }

vim.g.maplocalleader = "\\"
vim.g.mapleader = " "

vim.api.nvim_command("exe 'set cedit=<C-y>'")

-- vim.keymap.del("n", "gc")
--
pcall(vim.keymap.del, "n", "<Leader>sr")
pcall(vim.keymap.del, "n", "<Leader>sR")
pcall(vim.keymap.del, "n", "<Leader>p")
pcall(vim.keymap.del, "n", "<Leader>l")
pcall(vim.keymap.del, "n", "<Leader>L")
pcall(vim.keymap.del, "n", "<Leader>e")
pcall(vim.keymap.del, "n", "<Leader>E")
pcall(vim.keymap.del, "n", "<Leader>K")
pcall(vim.keymap.del, "n", "<Leader><Space>")

vim.keymap.set("n", "<leader>il", ":LspInfo<CR>", { desc = "LSP Info" })
vim.keymap.set("n", "<leader>iz", ":Lazy<CR>", { desc = "Lazy Info" })
vim.keymap.set("n", "<leader>in", ":NullLsInfo<CR>", { desc = "Null-ls Info" })
vim.keymap.set("n", "<leader>if", ":verbose set filetype?<CR>", { desc = "FileType Info" })
-- vim.keymap.set("n", "<leader>f", ":lua require('noice').redirect('verbose set filetype?')<CR>", { desc = "FileType Info" })
-- vim.keymap.set("n", "<leader>f", ":Xdir verbose set filetype?<CR>", { desc = "FileType Info" })

vim.keymap.set("n", "<Leader>sr", "<CMD>lua require'telescope.builtin'.resume{}<CR>", { desc = "Resume" })
-- map("n", "<leader>L", "<CMD>Lazy<CR>", { noremap = true, desc = "Lazy" })

vim.keymap.set("n", "<leader>fr", function()
  local default = vim.fn.expand("%:t")
  vim.ui.input({
    prompt = "File Rename:",
    default = default,
  }, function(choice)
    if choice == nil then
      return
    end
    vim.notify(choice)
    vim.api.nvim_exec2(":w " .. choice, {})
    vim.api.nvim_exec2(":e#", {})
    vim.api.nvim_exec2(":!rm " .. default, {})
  end)
end, { noremap = true, desc = "File Rename" })

vim.keymap.set("n", "<leader>er", function()
  vim.ui.select({ "node", "lua" }, {
    prompt = "Runner",
  }, function(selected)
    local cmd = selected .. " " .. vim.fn.expand("%:p")
    vim.notify(cmd)
  end)
end, { noremap = true, desc = "Exec Run" })

vim.keymap.set("n", "<leader>ef", function()
  vim.ui.select(vim.fn.getcompletion("*", "filetype"), {
    prompt = "Select Filetype:",
  }, function(choice)
    if choice == nil then
      return
    end
    vim.notify(choice, vim.log.levels.INFO, { title = "Filetype Updated" })
    vim.o.filetype = choice
  end)
end, { desc = "Set File Type" })

map("n", "<leader>eoi", "<CMD>Neorg workspace mx<CR><CMD>Neorg toc<CR>", { desc = "Org Index" })
map("n", "<leader>eoo", "<CMD>Neorg workspace mx<CR>", { desc = "Org Workspace" })
map("n", "<leader>eoj", "<CMD>Neorg workspace mx<CR><CMD>Neorg journal toc update<CR>", { desc = "Org Journal" })
map("n", "<leader>eon", "<CMD>Neorg workspace mx<CR><CMD>Neorg journal today<CR>", { desc = "Org Today" })
-- stylua: ignore
map("n", "<leader>eoy", "<CMD>Neorg workspace mx<CR><CMD>Neorg journal yesterday<CR>", { desc = "Org Yesterday" })

map("n", "<leader>ehh", "<CMD>DevdocsOpenCurrentFloat<CR>", { noremap = true, desc = "Devdocs Current [+f]" })
map("n", "<leader>ehH", "<CMD>DevdocsOpenCurrent<CR>", { noremap = true, desc = "Devdocs Current" })
map("n", "<leader>eho", "<CMD>DevdocsOpenFloat<CR>", { noremap = true, desc = "Devdocs Index [+f]" })
map("n", "<leader>ehO", "<CMD>DevdocsOpen<CR>", { noremap = true, desc = "Devdocs Index" })

map("n", "<C-h>", "<CMD>NavigatorLeft<CR>", opt)
map("n", "<C-l>", "<CMD>NavigatorRight<CR>", opt)
map("n", "<C-j>", "<CMD>NavigatorDown<CR>", opt)
map("n", "<C-k>", "<CMD>NavigatorUp<CR>", opt)

map("c", "<C-f>", "<Right>", nor)
map("c", "<C-a>", "<Home>", nor)
map("c", "<C-b>", "<Left>", nor)
map("c", "<M-b>", "<C-b>", nor)
map("c", "<M-k>", "<Up>", nor)
map("c", "<M-j>", "<Down>", nor)

map("n", "<M-J>", "<C-w>-", nor)
map("n", "<M-K>", "<C-w>+", nor)
map("n", "<M-H>", "<C-w><", nor)
map("n", "<M-L>", "<C-w>>", nor)

map("n", "<M-w>", "<cmd>BufferLineCloseLeft<cr>", nor)
map("n", "<M-e>", "<cmd>BufferLineCloseRight<cr>", nor)
map("n", "<M-Left>", "<cmd>BufferLineMovePrev<cr>", nor)
map("n", "<M-Right>", "<cmd>BufferLineMoveNext<cr>", nor)

-- map("n", "<C-c>", ":normal gcc<CR>", opt)
-- { "<C-a>", function() return vim.bo[vim.api.nvim_win_get_buf(0)].modifiable and require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
vim.keymap.set("n", "<C-c>", function()
  local modifiable = vim.bo[vim.api.nvim_win_get_buf(0)].modifiable
  -- local lspAttached = #vim.lsp.get_active_clients() > 0
  -- and lspAttached
  -- else print("TODO")
  if modifiable then
    vim.cmd(":normal gcc<CR>")
  end
end, { silent = true })
map("i", "jk", "<ESC>", opt)

map("i", "<M-p>", [[<ESC>"+p]], opt)
map("i", "<M-e>", [[g$$]], opt)
map("n", "<M-Y>", [[gg"+yG]], opt) -- %y *
map("n", "<M-y>", [["+y$]], opt)
map("v", "<M-y>", [["+y]], opt)
map("n", "<M-p>", [["+p]], opt)
map("n", "Y", [[y$]], opt)
map(
  "n",
  "cp",
  [[:let @+ = expand("%:p") .. ':' .. line(".")<cr>]],
  -- [[:let @+ = expand("%:p") .. expand("<slnum>")<cr>]],
  -- echo expand("<cfile>")
  { noremap = true, silent = true, desc = "Copy Path" }
)
-- vim.cmd([[ nnoremap qq :let @q = '^'<cr>^qQ ]])
-- map("n", "qq", [[<ESC>:q<cr>]], { noremap = false, silent = true, desc = "Quit" })

-- map("n", "Y", [[y$]], opt)
-- map("n", "Q", [[ :q<CR> ]], opt)
--

-- { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
map(
  "n",
  "<leader>uh",
  "<CMD>lua require('mini.hipatterns').enable()<CR>",
  { noremap = true, silent = true, desc = "Toggle Color Highlight" }
)

-- map(
--   "n",
--   "<leader>sT",
--   "<CMD>lua require'telescope.builtin'.builtin{}<CR>",
--   { noremap = true, silent = true, desc = "Search Telescope" }
-- )

map(
  "n",
  "<leader>sx",
  "<CMD>lua require'telescope.builtin'.builtin{}<CR>",
  { noremap = true, silent = true, desc = "Search Telescope" }
)

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
map("n", "<M-g>", "<CMD>lua require'telescope.builtin'.live_grep{}<CR>", opt)
map("n", "<M-f>", ":Telescope find_files<CR>", opt)
map("n", "<M-F>", ":Telescope find_files hidden=true<CR>", opt) -- lua require("telescope.builtin").find_files({hidden=true})
map("n", "<M-o>", ":Telescope oldfiles<CR>", opt)
map("n", "<M-r>", "<CMD>lua require'telescope.builtin'.resume{}<CR>", opt)
map("n", "<M-m>", ":Telescope keymaps<CR>", opt)
-- map("n", "<M-b>", ":Telescope file_browser<CR>", opt) -- Telescope buffers
map("n", "<M-C>", ":Telescope commands<CR>", opt)
map("n", "<M-c>", "<cmd>lua require('notify').dismiss({ silent = true, pending = true })<CR>", opt)
map("n", "<C-q>", "<cmd>lua require('user.plugins.qtoggle').toggle_qf()<CR>", { desc = "Quickfix Toggle" })

map("n", "<M-d>", "<ESC>:<C-y>", nor)

map("n", "<M-k>", "<CMD>BufferLineCycleNext<CR>", opt)
map("n", "<M-j>", "<CMD>BufferLineCyclePrev<CR>", opt)

map("n", "<C-s>", ':set buftype=""<cr> :w<CR><Esc>', opt)
map("n", "<M-s>", ':set buftype=""<cr> :w<CR><Esc>', opt)
-- map("n", "<M-s>", ":w<CR>", opt)
--
map("n", "<M-q>", ":q<CR>", opt)
-- map("n", "<M-q>", ":bw<CR>", opt)
map("n", "<M-Q>", ":qall!<CR>", opt)

-- echo 'foo'
-- lua require("util.debug").dump(vim.opt.completeopt)
-- lua dd(vim.opt.completeopt)
-- map(
--   "n",
--   "<leader>Dd",
--   "<CMD>lua require('noice').redirect('@*')<CR>",
--   { silent = true, noremap = true, desc = "Inspect Yank" }
-- )
-- require("noice").redirect(function() print("test") end)

map("n", "<leader>ed", ":Xdir <C-R>: <C-y>", { noremap = true, desc = "Inspect Previous" })

map("n", "<leader>exy", ":lua <C-R>* <C-y>", { noremap = true, desc = "Inspect Yank (CMD)" })
map("n", "<leader>exx", ":Xdir lua =<C-R>: <C-y>", { noremap = true, desc = "Inspect Redirect (CMD)" })
map("n", "<leader>exe", ":Xdir <C-R>=", { noremap = true, desc = "Inspect Expand (Redirect)" })
map("n", "<leader>exl", ":Xdir <C-R>= <C-R><C-L>", { noremap = true, desc = "Inspect Expand Line (Redirect)" })
-- map("n", "<leader>dd", ":+<C-R><C-W> <C-y>", { noremap = true, desc = "Inspect Recent" })
-- vim.cmd("nnoremap <leader>R :Nredir <c-f>A")

map("c", "<S-Enter>", "<CMD>lua require('noice').redirect(vim.fn.getcmdline())<CR>", { desc = "Redirect Cmdline" })
-- vim.keymap.set("c", "<S-Enter>", function()
--   require("noice").redirect(vim.fn.getcmdline())
-- end, { desc = "Redirect Cmdline" })

map("n", "gG", "<CMD>OpenGithubRepo<CR>", { silent = true, desc = "Open Github Repo" })
map("n", "gL", "<CMD>OpenWebUrl<CR>", { silent = true, desc = "Open URL" })

map("n", "<leader>di", ":OverseerInfo<CR>", { desc = "OverSeer Info" })

map("n", "<leader>cM", ":Mason<CR>", { desc = "Mason" })
map("n", "<leader>ce", ":new | r ! node #<CR>", { desc = "Exec" })
map("n", "<leader>cc", ":make | cope<CR>", { desc = "Cope" })

-- ////////////////////////////////////////////////////////////////////////////

-- new | r ! node #
-- !}fmt
-- new | r ! <cmd>

-- vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
--   if not require("noice.lsp").scroll(4) then
--     return "<c-f>"
--   end
-- end, { silent = true, expr = true })

-- map("n", "<leader>rx", function() end, { silent = true, noremap = true, desc = "Inspect Recent" })
-- vim.keymap.set("n", "<leader>rx", function()
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
-- }, { prefix = "<leader>u" })

-- local bufopt = { noremap = true, silent = true, buffer = vim.fn.expand("%") }
-- map("n", "<leader>lr", "<cmd>vim.lsp.buf.rename", bufopt)
-- map("n", "<leader>lr", "nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>", opt)

-- zmap("n", "<leader>gg", function()
--   Util.float_term({ "gitui" }, { cwd = Util.get_root() })
-- end, { desc = "GitUI (root dir)" })
-- zmap("n", "<leader>gG", function()
--   Util.float_term({ "gitui" })
-- end, { desc = "GitUI (cwd)" })
-- vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
-- vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
-- vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
-- vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
-- vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
-- vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
-- vim.keymap.set("n", "<leader>sr", "<ESC>", { desc = "Make" })

-- vim.keymap.set("n", "<left>", "<C-w>h")
-- vim.keymap.set("n", "<down>", "<C-w>j")
-- vim.keymap.set("n", "<up>", "<C-w>k")
-- vim.keymap.set("n", "<right>", "<C-w>l")
-- vim.keymap.set("n", "<C-c>", "<cmd>normal! ciw<cr>a")
-- vim.keymap.set("n", "<leader>cR", util.runlua, { desc = "Run Lua" })
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
map("n", "<C-h>", "<CMD>lua require('Navigator').left()<CR>", opt)
map("n", "<C-l>", "<CMD>lua require('Navigator').right()<CR>", opt)
map("n", "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opt)
map("n", "<C-k>", "<CMD>lua require('Navigator').up()<CR>", opt)
]]
--[[
]]
-- map("n", "<leader>li", "<cmd>:LspInfo<cr>", { desc = "LSP Info" })

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
--   "<leader>uX",
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
-- vim.cmd("nnoremap <leader>R :Nredir <c-f>A")
-- vim.cmd("nnoremap <leader>R :Xdir <c-f>A")
-- map("n", "<leader>rr", ":Xdir <C-f>", { silent = true, noremap = true, desc = "Inspect Recent" })
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
-- }, { prefix = "<leader>" })
