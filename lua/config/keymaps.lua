--local util = require("util")
-- local Util = require("lazyvim.util")
local which_key = require("which-key")
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
local nor = { noremap = true }
vim.g.maplocalleader = "\\"
-- local Util = require("lazyvim.util")
-- local function zmap(mode, lhs, rhs, opt)
--   local keys = require("lazy.core.handler").handlers.keys
--   if not keys.active[keys.parse({ lhs, mode = mode }).id] then
--     opt = opt or {}
--     opt.silent = opt.silent ~= false
--     vim.keymap.set(mode, lhs, rhs, opt)
--   end
-- end
map("n", "<C-h>", "<CMD>NavigatorLeft<CR>", opt)
map("n", "<C-l>", "<CMD>NavigatorRight<CR>", opt)
map("n", "<C-j>", "<CMD>NavigatorDown<CR>", opt)
map("n", "<C-k>", "<CMD>NavigatorUp<CR>", opt)

map("n", "<cr>", "<CR>", opt)
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

map("n", "<C-c>", ":normal gcc<CR>", opt)
map("i", "jk", "<ESC>", opt)

map("i", "<M-p>", [[<ESC>"+p]], opt)
map("i", "<M-e>", [[g$$]], opt)
map("n", "<M-Y>", [[gg"+yG]], opt)
map("n", "<M-y>", [["+y$]], opt)
map("v", "<M-y>", [["+y]], opt)
map("n", "<M-p>", [["+p]], opt)
map("n", "Y", [[y$]], opt)

-- vim.keymap.set("n", "_", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- vim.keymap.set("n", "_", "<CMD>lua require('oil').open_float()<CR>", { desc = "Open FT" })

map("n", "<leader>uX", "<CMD>TSContextToggle<CR>", opt)
map("n", "<leader>sT", "<CMD>lua require'telescope.builtin'.builtin{}<CR>", opt)
-- map("n", "<leader>sh", "<CMD>lua require'telescope.builtin'.help_tags{}<CR>", opt)
map("n", "<M-a>", "<CMD>lua require'telescope.builtin'.live_grep{}<CR>", opt)
map("", "<M-f>", ":Telescope find_files<CR>", opt)
map("", "<M-o>", ":Telescope oldfiles<CR>", opt)
map("", "<M-t>", "<cmd>TroubleToggle<CR>", opt)
-- map("", "<M-r>", ":Telescope frecency<CR>", opt)
map("", "<M-m>", ":Telescope keymaps<CR>", opt)
map("n", "<M-b>", ":Telescope buffers<CR>", opt)
map("n", "<M-C>", ":Telescope commands<CR>", opt)
map("n", "<M-c>", "<cmd>lua require('notify').dismiss({ silent = true, pending = true })<CR>", opt)
-- map("n", "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opt)
-- function()
--   require("notify").dismiss({ silent = true, pending = true })
-- end,
map("n", "<M-d>", "<ESC>:", nor)

map("n", "<M-k>", "<CMD>BufferLineCycleNext<CR>", opt)
map("n", "<M-j>", "<CMD>BufferLineCyclePrev<CR>", opt)

map("n", "<C-s>", ':set buftype=""<cr> :w<CR><Esc>', opt)
map("n", "<M-s>", ':set buftype=""<cr> :w<CR><Esc>', opt)
-- map("n", "<M-s>", ":w<CR>", opt)
--
map("n", "<M-q>", ":q<CR>", opt)
map("n", "<M-Q>", ":qall!<CR>", opt)

which_key.register({
  t = {
    name = "Tabs",
    n = { "<cmd>tabnew<CR>", "New Tab" },
    c = { "<cmd>tabclose<CR>", "Close Tab" },
  },
  f = {
    name = "File",
    s = { ':set buftype=""<cr> :w<CR><Esc>', "Save File" },
  },
  l = {
    name = "LSP",
    L = { "<cmd>:Lazy<cr>", "Lazy" },
  },
}, { prefix = "<LocalLeader>" })

-- }, { prefix = "<leader>" })
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

-- COMMANDS -->
map("n", "gG", "<CMD>OpenGithubRepo<CR>", { silent = true, desc = "Open Github Repo" })
map("n", "gL", "<CMD>OpenWebUrl<CR>", { silent = true, desc = "Open URL" })

-- local bufopt = { noremap = true, silent = true, buffer = vim.fn.expand("%") }
-- map("n", "<leader>lr", "<cmd>vim.lsp.buf.rename", bufopt)
-- map("n", "<leader>lr", "nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>", opt)

-- zmap("n", "<leader>gg", function()
--   Util.float_term({ "gitui" }, { cwd = Util.get_root() })
-- end, { desc = "GitUI (root dir)" })
-- zmap("n", "<leader>gG", function()
--   Util.float_term({ "gitui" })
-- end, { desc = "GitUI (cwd)" })

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

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
vim.keymap.set("n", "<leader>di", ":OverseerInfo<CR>")

vim.keymap.set("n", "<leader>sr", "<ESC>")

vim.keymap.set("n", "<leader>cc", ":make | cope<CR>")

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
