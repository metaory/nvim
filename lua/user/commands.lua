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
