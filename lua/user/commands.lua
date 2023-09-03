vim.api.nvim_create_user_command("MxReload", function()
  require("lazy.manage.reloader").enable()

  local plugins = require("lazy").plugins()
  -- mxdump(plugins, "plugins")

  local loaded = {}
  local dormant = {}
  local report = {}

  if vim.g.mx_reloaded_plug then
    table.insert(loaded, vim.g.mx_reloaded_plug)
  end

  table.sort(plugins, function(a, b)
    if a._.loaded == nil then
      return false
    end
    if b._.loaded == nil then
      return true
    end
    return a._.loaded.time < b._.loaded.time
  end)

  for _, v in pairs(plugins) do
    local p = v
    local pname = p.name
    local ploaded = p._.loaded ~= nil
    if ploaded then
      table.insert(loaded, pname)
      table.insert(report, { name = pname, time = p._.loaded.time })
    else
      table.insert(dormant, pname)
    end
  end

  table.sort(report, function(a, b)
    return a.time < b.time
  end)

  vim.ui.select(loaded, {
    prompt = "Select a Plugin to Reload:",
  }, function(choice)
    if choice == nil then
      return
    end
    vim.notify(choice, vim.log.levels.INFO, { title = "Plugin" })
    require("lazy.core.loader").reload(require("lazy.core.config").plugins[choice])
    vim.g.mx_reloaded_plug = choice
  end)
end, { nargs = "?", complete = "packadd" })

vim.api.nvim_create_user_command("MxFileRename", function()
  local default = vim.fn.expand("%:t")
  -- string.gsub(vim.api.nvim_command("echo expand('%:p')"), vim.api.nvim_command("echo getcwd()"))
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
end, {
  -- nargs = "+",
  -- complete = "command",
  desc = "Rename current file",
})

-- -----------------------------------------------------------------------------

vim.api.nvim_create_user_command("Xdir", "lua require'noice'.redirect(<q-args>)", { nargs = "+", complete = "command" })
-- "lua require'noice'.redirect('lua =' .. <q-args>)",

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
