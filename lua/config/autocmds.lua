-- vim.api.nvim_create_autocmd("User", {
--   pattern = "VeryLazy",

-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     -- mxdump(vim.print(vim.inspect(client)), "LspAttach-client")
--     if client.server_capabilities.hoverProvider then
--       vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
--     end
--   end,
-- })

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    if vim.g.mx_snip_loaded == 1 then
      return
    end
    require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })
    vim.g.mx_snip_loaded = 1
  end,
})

vim.api.nvim_create_autocmd({ "CmdwinEnter" }, {
  callback = function()
    vim.api.nvim_exec2([[ TSBufDisable highlight ]], {})
    vim.keymap.set("n", "q", ":q<CR>", { buffer = true })
  end,
})

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
