local lib = require("user.lib")

local function augroup(name)
  return vim.api.nvim_create_augroup("mx_" .. name, { clear = true })
end
-- TODO:
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--   callback = function(ev)
--     -- Enable completion triggered by <c-x><c-o>
--     vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--     -- Buffer local mappings.
--     -- See `:help vim.lsp.*` for documentation on any of the below functions
--     local opts = { buffer = ev.buf }
--     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wl', function()
--       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, opts)
--     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
--     vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--     vim.keymap.set('n', '<space>f', function()
--       vim.lsp.buf.format { async = true }
--     end, opts)
--   end,
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "help", "txt" },
--   callback = function(args)
--     -- vim.schedule(function()
--     -- vim.bo[args.buf].syntax = "lua"
--     -- vim.bo[args.buf].filetype = "lua"
--     -- vim.bo.syntax = "lua"
--     -- vim.bo.filetype = "lua"
--     -- end)
--     -- if not pcall(vim.treesitter.start, args.buf, "lua") then
--     --   vim.bo[args.buf].syntax = "lua"
--     --   vim.bo[args.buf].filetype = "lua"
--     -- end
--     -- vim.notify("___FFFFFFFF_", vim.log.levels.DEBUG, { title = "_F_F_" })
--     -- vim.b["miniindentscope_disable"] = true
--     -- vim.api.nvim_exec2([[ TSBufEnable highlight ]], {})
--     -- vim.api.nvim_exec2([[ set syntax=help ]], {})
--   end,
-- })
-- vim.api.nvim_create_autocmd("BufReadPost", { pattern = { "*/playgrounds/*/*.*" }, callback = lib.create_auto_run_au })
vim.api.nvim_create_autocmd("BufReadPost", { pattern = { "*/playgrounds/*" }, callback = lib.create_auto_run_au })

vim.api.nvim_create_autocmd({ "CmdwinEnter" }, {
  callback = function(args)
    if not pcall(vim.treesitter.start, args.buf, "lua") then
      vim.bo[args.buf].filetype = "lua"
    end
    vim.api.nvim_exec2([[ TSBufDisable highlight ]], {})
    vim.api.nvim_exec2([[ TSBufEnable highlight ]], {})
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true })
  end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "norg" },
--   callback = function()
--     -- vim.notify("___XX__NN_CONFIG_WIKI____", vim.log.levels.ERROR, { title = "_XXXX_WIKI__" })
--     vim.keymap.set("n", "<C-i>", [[:insert \* hi... ]], { desc = "new journal entry", buffer = true })
--     -- vim.keymap.set("n", "yl", [[:normal "+yi"<CR>]], { desc = "yank inside quotes", buffer = true })
--     -- vim.keymap.set("n", "yx", [[:normal "+yi[<CR>]], { desc = "yank inside bracket", buffer = true })
--   end,
-- })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json" },
  callback = function()
    vim.keymap.set("n", "yl", [[:normal "+yi"<CR>]], { desc = "yank inside quotes", buffer = true })
    vim.keymap.set("n", "yx", [[:normal "+yi[<CR>]], { desc = "yank inside bracket", buffer = true })
  end,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--   callback = function(ev)
--     -- Enable completion triggered by <c-x><c-o>
--     -- vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
--     -- vim.notify("LSP ATTACHED!", vim.log.levels.DEBUG, { title = "LSP" })
--     -- local opts = { buffer = ev.buf }
--   end,
-- })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- XXX:  ::==>
-- local function supports_inlay_hints(bufnr)
--   local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
--   for _, client in ipairs(clients) do
--     if client.server_capabilities.inlayHintProvider then
--       return true
--     end
--   end
--   return false
-- end
-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function(args)
--     if supports_inlay_hints(args.buf) then
--       vim.lsp.inlay_hint(args.buf, true)
--     end
--   end,
-- })
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     if supports_inlay_hints(args.buf) then
--       vim.defer_fn(function()
--         vim.lsp.inlay_hint(args.buf, true)
--       end, 3000)
--     end
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufReadPost", {
--   callback = function()
--     vim.go.smartindent = false
--     vim.go.autoindent = false
--   end,
-- })
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "VeryLazy",
--   callback = function()
--     vim.notify("NOWWWWW", vim.log.levels.ERROR, { title = "OOOOOOOOOOOOOOOOOOOO" })
--   end,
-- })

-- INFO:
-- match: a string that matched the pattern (see <amatch>)
-- buf: the number of the buffer the event was triggered in (see <abuf>)
-- file: the file name of the buffer the event was triggered in (see <afile>)
-- data: a table with other relevant data that is passed for some events

-- local autocommands = vim.api.nvim_get_autocmds({
--   group = "lazyvim_checktime",
--   event = { "FocusGained", "TermClose", "TermLeave" },
-- })
-- LiveInspect(autocommands)
-- for _, au in ipairs(autocommands) do
--   ddwrite({ v = au }, "autocommands", "a")
-- end
-- vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
--   group = augroup("checktime"),
--   command = "checktime",
-- })

-- pattern = { "*/playgrounds/*/*.lua,*/playgrounds/*/*.js" },
-- ddwrite(ui.runners, "runners")
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     -- mxdump(vim.print(vim.inspect(client)), "LspAttach-client")
--     if client.server_capabilities.hoverProvider then
--       vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
--     end
--   end,
-- })

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   group = "_luasnip_lazy_load",
--   callback = function(_)
--     require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })
--   end,
-- })
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   callback = function(args)
--     if vim.g.mx_snip_loaded == 1 then
--       return
--     end
--     require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })
--     vim.g.mx_snip_loaded = 1
--   end,
-- })

-- when passed a string vim.cmd(·)  is the same as vim.api.nvim_exec(·, false)
-- when passed a table  vim.cmd({}) it behaves like vim.api.nvim_cmd({}, {})
-- vim.cmd { cmd = 'write', args = { "myfile.txt" }, bang = true }

-- vim.cmd([[ TSBufDisable highlight ]])
-- vim.cmd([[ set syntax=vim ]])
-- vim.api.nvim_create_user_command("TSHighlightsUnderCursor", function()
--   require("nvim-treesitter-playground.hl-info").get_syntax_hl()
-- end, {})

-- vim.cmd([[ :autocmd CmdwinEnter * setf vim<CR> ]])
-- vim.api.nvim_create_autocmd({ "CmdwinEnter" }, {
--   callback = function()
--     vim.cmd([[ setlocal filetype=vim ]])
--   end,
-- })
-- show cursor line only in active window
-- vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
--   callback = function()
--     local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
--     if ok and cl then
--       vim.wo.cursorline = true
--       vim.api.nvim_win_del_var(0, "auto-cursorline")
--     end
--   end,
-- })
-- vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
--   callback = function()
--     local cl = vim.wo.cursorline
--     if cl then
--       vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
--       vim.wo.cursorline = false
--     end
--   end,
-- })

-- create directories when needed, when saving a file
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = vim.api.nvim_create_augroup("better_backup", { clear = true }),
--   callback = function(event)
--     local file = vim.loop.fs_realpath(event.match) or event.match
--     local backup = vim.fn.fnamemodify(file, ":p:~:h")
--     backup = backup:gsub("[/\\]", "%%")
--     vim.go.backupext = backup
--   end,
-- })

-- Fix conceallevel for json & help files
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "json", "jsonc" },
--   callback = function()
--     vim.wo.spell = false
--     vim.wo.conceallevel = 0
--   end,
-- })
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "javascript" },
--   callback = function()
--     -- vim.cmd([[ setlocal ai et sta sw=2 sts=2 ts=2 cin isk+=$ ]])
--     vim.cmd([[ set makeprg=node\ % >out.log\ 2>&1 ]])
--     -- vim.cmd( [[ set errorformat=%-P-----\ FILE\ \ :\ \ %f\ -----,Line\ %l\\,\ E:%n:\ %m,%-Q,%-GFound\ %s,%-GSome\ %s,%-Gfixjsstyle%s,%-Gscript\ can\ %s,%-G ]])
--   end,
-- })
-- au BufNewFile,BufRead *.js set makeprg=gjslint\ %
-- au BufNewFile,BufRead *.js set errorformat=%-P-----\ FILE\ \ :\ \ %f\ -----,Line\ %l\\,\ E:%n:\ %m,%-Q,%-GFound\ %s,%-GSome\ %s,%-Gfixjsstyle%s,%-Gscript\ can\ %s,%-G

-- INFO:
-- vim.notify(str, lvl, {
--   title = "stdout",
--   background_colour = "NotifyBackground",
--   icons = { DEBUG = "", ERROR = "", INFO = "", TRACE = "✎", WARN = "" },
--   minimum_width = 50,
--   render = "default",
--   stages = "fade_in_slide_out",
--   timeout = 10000,
--   top_down = true,
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = {"help", "alpha", "dashboard", "starter", "neo-tree", "Trouble", "lazy", "mason", "notify", "toggleterm", "lazyterm",},
--   callback = function()
--     vim.b["miniindentscope_disable"] = true
--   end,
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function(event)
--     vim.schedule(function()
--       ddwrite({ e = event }, "______MD______")
--       require("noice.text.markdown").keys(event.buf)
--     end)
--   end,
-- })

-- local parser = vim.treesitter.get_parser()
-- if not parser then
--   return vim.notify("No treesitter parser for the current buffer", vim.log.levels.ERROR)
-- end

-- local buf = vim.api.nvim_win_get_buf(win)

-- vim.bo.filetype = "lua"
-- vim.notify("auto cmd win enter", vim.log.levels.DEBUG, { title = "winEnter" })
