local async = require("util.async")
local ui = require("user.ui")

local M = {}

local auto_run_files = {}
local auto_run_files_ignore = {}

M.create_auto_run_au = async.void(function()
  local path = vim.fn.expand("%:p")
  local file = vim.fn.expand("%:t")
  local ft = vim.bo.filetype

  local ignore = vim.tbl_contains(auto_run_files_ignore, path)
  local existing = vim.tbl_contains(auto_run_files, path)

  if existing or ignore then
    return
  end

  local runner = ui.runners[ft] or (vim.fn.executable(ft) == 1 and ft)

  if not runner then
    table.insert(auto_run_files_ignore, path)
    vim.notify(string.format("No Runner Found for %s", vim.bo.filetype), vim.log.levels.ERROR, { title = "Runner" })
    return
  end

  if vim.endswith(file, "rc") then
    return
  end

  ui.schedule()

  local confirm = ui.confirm(string.format("Create BufWrite Run AutoCMD for %s?", file))

  if confirm == false then
    table.insert(auto_run_files_ignore, path)
    return
  end

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { path },
    callback = async.void(function()
      if vim.endswith(file, ".nvim.lua") then
        return dofile(file)
      end

      local cmd = string.format("%s %s", runner, path)

      local l = vim.fn.systemlist(cmd)

      if #l == 0 then
        vim.notify("NO OUTPUT", vim.log.levels.ERROR, { title = "stdout" })
        return
      end

      local pass = nil
      local l1 = l[1]

      if string.match(l1, "true") or string.match(l1, "false") then
        pass = l1 == "true"
        table.remove(l, 1)
      end

      local str = table.concat(l, "\n")
      local lvl = pass and vim.log.levels.INFO or vim.log.levels.ERROR

      require("noice").cmd("dismiss")
      vim.notify(str, lvl, { title = "stdout", timeout = 6000 })
    end),
  })

  vim.notify(string.format("created autocmd for %s", path), vim.log.levels.INFO, { title = "autocmd" })
  table.insert(auto_run_files, path)
end)

M.reload_plugin_cmd = async.void(function()
  require("lazy.manage.reloader").enable()

  local plugins = require("lazy").plugins()

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

  local choice = ui.select(loaded, { prompt = "Select a Plugin to Reload:" })
  if choice == nil then
    return
  end
  vim.notify(string.format("reloading %s", choice), vim.log.levels.INFO, { title = "Plugin" })
  require("lazy.core.loader").reload(require("lazy.core.config").plugins[choice])
  vim.g.mx_reloaded_plug = choice
end)

M.file_rename_cmd = async.void(function()
  local default = vim.fn.expand("%:t")
  local choice = ui.input({ prompt = "File Rename:", default = default })
  if choice == nil then
    return
  end
  vim.notify(choice)
  vim.api.nvim_exec2(":w " .. choice, {})
  vim.api.nvim_exec2(":e#", {})
  vim.api.nvim_exec2(":!rm " .. default, {})
end)

M.open_github_link = function(_)
  local ghpath = vim.api.nvim_eval("shellescape(expand('<cfile>'))")
  local formatpath = ghpath:sub(2, #ghpath - 1)
  local repourl = "https://www.github.com/" .. formatpath
  vim.fn.system({ "xdg-open", repourl })
end

M.open_web_link = function(_)
  local linenr = vim.fn.line(".")
  local line = vim.fn.getline(linenr)
  local constants = { pattern = "[%w@:%%._+~#=/%-?&]*", http_pattern = "https?://" }
  local url = line:match(constants.http_pattern .. "%w" .. constants.pattern)

  if not url then
    return print("💁 Woops is not url gais 🙅")
  end

  vim.fn.system({ "xdg-open", url })
end

return M

-- local runners = vim.tbl_values(ui.runners)
-- local ft_ex = vim.fn.executable(vim.bo.filetype) == 1 and vim.bo.filetype
-- vim.tbl_contains(vim.tbl_keys(ui.runners), vim.bo.filetype)
-- local runner = ui.runners[vim.bo.filetype] or ui.select(runners, { prompt = "Select a runner:" })
-- ui.runners[vim.bo.filetype] = runner

-- vim.api.nvim_echo({
--   { vim.fn.strftime("%FT%T", 22), "NotifyLogTime" },
--   { " ", "MsgArea" },
--   { "NotifyLogTitle" },
--   { "MsgArea" },
--   { "Notify" .. 33 .. "Title" },
--   { " ", "MsgArea" },
--   { "Notify" .. 44 .. "Title" },
--   { " ", "MsgArea" },
--   { "MsgArea" },
-- }, false, {})

-- local notifynvim = require("notify")
-- vim.notify = nil
-- vim.notify = function(msg, lvl, opt)
--   if opt.on_open == nil then
--     opt.on_open = function(win)
--       local buf = vim.api.nvim_win_get_buf(win)
--       vim.api.nvim_buf_set_option(buf, "filetype", "lua")
--     end
--   end
--   require("notify")(msg, lvl, opt)
-- end

-- render = "minimal",
-- render = "simple",
-- on_open = function(win)
--   -- vim.api.nvim_win_set_option(win, "conceallevel", 3)
--   -- vim.api.nvim_win_set_option(win, "spell", false)
--   local buf = vim.api.nvim_win_get_buf(win)
--   vim.treesitter.start(buf, "lua")
--   vim.api.nvim_buf_set_option(buf, "filetype", "lua")
-- end,
-- on_open = function(win)
--   local buf = vim.api.nvim_win_get_buf(win)
-- end,

-- on_open = function(win)
-- local buf = vim.api.nvim_win_get_buf(win)
-- if not pcall(vim.treesitter.start, buf, ft) then
--   vim.bo[buf].filetype = ft
-- end
-- vim.bo[buf].filetype = ft
-- vim.api.nvim_exec2([[ TSBufDisable highlight ]], {})
-- vim.api.nvim_exec2([[ TSBufEnable highlight ]], {})
-- ddwrite({ w = win }, "________________________", "a")
-- end,
