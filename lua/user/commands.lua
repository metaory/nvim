vim.api.nvim_create_user_command("OpenGithubRepo", function(_)
  local ghpath = vim.api.nvim_eval("shellescape(expand('<cfile>'))")
  local formatpath = ghpath:sub(2, #ghpath - 1)
  local repourl = "https://www.github.com/" .. formatpath
  vim.fn.system({ "xdg-open", repourl })
end, {
  desc = "Open Github Repo",
  force = true,
})

vim.api.nvim_create_user_command("OpenWebUrl", function(_)
  local linenr = vim.fn.line(".")
  local line = vim.fn.getline(linenr)
  local constants = {
    pattern = "[%w@:%%._+~#=/%-?&]*",
    http_pattern = "https?://",
  }
  local url = line:match(constants.http_pattern .. "%w" .. constants.pattern)

  if url then
    vim.fn.system({ "xdg-open", url })
  else
    return print("💁 Woops is not url gais 🙅")
  end
end, {
  desc = "Open Web URL",
  force = true,
})

--[[
-- vim.api.nvim_get_keymap()
vim.api.nvim_create_user_command("Redir", function(ctx)
  -- lua=vim.tbl_keys(vim.api)
  local lines = vim.split(vim.api.nvim_exec("lua=" .. ctx.args, true), "\n", { plain = true })
  -- MxDump(ctx.args, "ctx")
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
