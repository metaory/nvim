--local util = require("util")
-- local Util = require("lazyvim.util")
local which_key = require("which-key")
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local nor = { noremap = true }
vim.g.maplocalleader = "\\"
-- local Util = require("lazyvim.util")
-- local function zmap(mode, lhs, rhs, opts)
--   local keys = require("lazy.core.handler").handlers.keys
--   if not keys.active[keys.parse({ lhs, mode = mode }).id] then
--     opts = opts or {}
--     opts.silent = opts.silent ~= false
--     vim.keymap.set(mode, lhs, rhs, opts)
--   end
-- end
map("n", "<C-h>", "<CMD>NavigatorLeft<CR>", opts)
map("n", "<C-l>", "<CMD>NavigatorRight<CR>", opts)
map("n", "<C-j>", "<CMD>NavigatorDown<CR>", opts)
map("n", "<C-k>", "<CMD>NavigatorUp<CR>", opts)

map("n", "<cr>", "<CR>", opts)
--[[
map("n", "<C-h>", "<CMD>lua require('Navigator').left()<CR>", opts)
map("n", "<C-l>", "<CMD>lua require('Navigator').right()<CR>", opts)
map("n", "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opts)
map("n", "<C-k>", "<CMD>lua require('Navigator').up()<CR>", opts)
]]
--[[
]]
-- map("n", "<leader>li", "<cmd>:LspInfo<cr>", { desc = "LSP Info" })

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

map("n", "<C-c>", ":normal gcc<CR>", opts)
map("i", "jk", "<ESC>", opts)

map("i", "<M-p>", [[<ESC>"+p]], opts)
map("i", "<M-e>", [[g$$]], opts)
map("n", "<M-Y>", [[gg"+yG]], opts)
map("n", "<M-y>", [["+y$]], opts)
map("v", "<M-y>", [["+y]], opts)
map("n", "<M-p>", [["+p]], opts)
map("n", "Y", [[y$]], opts)

-- vim.keymap.set("n", "_", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- vim.keymap.set("n", "_", "<CMD>lua require('oil').open_float()<CR>", { desc = "Open FT" })

map("n", "<leader>sT", "<CMD>lua require'telescope.builtin'.builtin{}<CR>", opts)
map("n", "<M-r>", "<CMD>lua require'telescope.builtin'.resume{}<CR>", opts)
map("", "<M-f>", ":Telescope find_files<CR>", opts)
map("", "<M-o>", ":Telescope oldfiles<CR>", opts)
map("", "<M-t>", "<cmd>TroubleToggle<CR>", opts)
-- map("", "<M-r>", ":Telescope frecency<CR>", opts)
map("", "<M-m>", ":Telescope keymaps<CR>", opts)
map("n", "<M-b>", ":Telescope buffers<CR>", opts)
map("n", "<M-C>", ":Telescope commands<CR>", opts)
map("n", "<M-c>", "<cmd>lua require('notify').dismiss({ silent = true, pending = true })<CR>", opts)
-- map("n", "<C-j>", "<CMD>lua require('Navigator').down()<CR>", opts)
-- function()
--   require("notify").dismiss({ silent = true, pending = true })
-- end,
map("n", "<M-d>", "<ESC>:", nor)

map("n", "<M-k>", "<CMD>BufferLineCycleNext<CR>", opts)
map("n", "<M-j>", "<CMD>BufferLineCyclePrev<CR>", opts)

map("n", "<C-s>", ':set buftype=""<cr> :w<CR><Esc>', opts)
map("n", "<M-s>", ':set buftype=""<cr> :w<CR><Esc>', opts)
-- map("n", "<M-s>", ":w<CR>", opts)
--
map("n", "<M-q>", ":q<CR>", opts)
map("n", "<M-Q>", ":qall!<CR>", opts)

which_key.register({
  t = {
    name = "Tabs",
    n = { "<cmd>tabnew<CR>", "New Tab" },
    c = { "<cmd>tabclose<CR>", "Close Tab" },
  },
}, { prefix = "<leader>" })

which_key.register({
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
  f = {
    name = "File",
    s = { ':set buftype=""<cr> :w<CR><Esc>', "Save File" },
  },
  l = {
    name = "LSP",
    L = { "<cmd>:Lazy<cr>", "Lazy" },
  },
}, { prefix = "<LocalLeader>" })

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

-- local bufopts = { noremap = true, silent = true, buffer = vim.fn.expand("%") }
-- map("n", "<leader>lr", "<cmd>vim.lsp.buf.rename", bufopts)
-- map("n", "<leader>lr", "nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>", opts)

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
-- vim.keymap.set("n", "<left>", "<C-w>h")
-- vim.keymap.set("n", "<down>", "<C-w>j")
-- vim.keymap.set("n", "<up>", "<C-w>k")
-- vim.keymap.set("n", "<right>", "<C-w>l")
-- vim.keymap.set("n", "<C-c>", "<cmd>normal! ciw<cr>a")
-- vim.keymap.set("n", "<leader>cR", util.runlua, { desc = "Run Lua" })
