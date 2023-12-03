local lib = require("user.lib")

-- vim.api.nvim_del_augroup_by_name("lazyvim_checktime")

--"TextChangedI", --"TextYankPost",
vim.api.nvim_create_user_command("AutoSave", lib.create_aut_save_au, { nargs = "?", desc = "Enable Auto Save" })

vim.api.nvim_create_user_command("CreateAutoRun", lib.create_auto_run_au, { nargs = "?" })

vim.api.nvim_create_user_command("LazyReload", lib.reload_plugin_cmd, { nargs = "?" })

vim.api.nvim_create_user_command("FileRename", lib.file_rename_cmd, { desc = "Rename current file" })

vim.api.nvim_create_user_command("OpenGithubLink", lib.open_github_link, { desc = "Open Github Repo", force = true })

vim.api.nvim_create_user_command("OpenWebLink", lib.open_web_link, { desc = "Open Web URL", force = true })

vim.api.nvim_create_user_command("Xdir", "lua require'noice'.redirect(<q-args>)", { nargs = "+", complete = "command" })

--[[
    -- style = "minimal",
  -- ddwrite({ b = buf, w = win, s = str, l = lines }, "live")
  -- vim.api.nvim_buf_add_highlight(help_state.buf, help_state.ns, "Special", 0, 0, -1)
-- vim.api.nvim_get_keymap()
vim.api.nvim_create_user_command("Redir", function(ctx)
  -- lua=vim.tbl_keys(vim.api)
  local lines = vim.split(vim.api.nvim_exec("lua=" .. ctx.args, true), "\n", { plain = true })
  -- mxdump(ctx.args, "ctx")
  vim.cmd("new")
  local bufnr = vim.api.nvim_get_current_buf()
  -- local bufnr = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(bufnr, "filetype", "lua")
  vim.api.nvim_buf_set_option(bufnr, "buftype", "nofile")
  vim.api.nvim_buf_set_option(bufnr, "bufhidden", "hide")
  vim.api.nvim_buf_set_option(bufnr, "buflisted", false)
  vim.api.nvim_buf_set_option(bufnr, "swapfile", false)
  vim.api.nvim_buf_set_option(bufnr, "modifiable", false)
  vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = bufnr })
  vim.opt_local.modified = false
end, { nargs = "+", complete = "command" })
-- :Redir lua=vim.tbl_keys(package.loaded)
]]

-- vim.diagnostic.set(config.ERROR_NS, bufnr, items)
-- nargs = "+",
-- complete = "command",
