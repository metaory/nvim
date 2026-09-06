local M = {}

local groups = {
  "Search",
  "IncSearch",
  "DiffAdd",
  "DiffDelete",
  "WarningMsg",
  "Question",
}

local namespaces = {}
local index = 1

function M.add()
  local word = vim.fn.input("Highlight lines: ")
  if word == "" then
    return
  end

  local namespace = vim.api.nvim_create_namespace("highlight-lines")
  local group = groups[index]

  index = index % #groups + 1
  namespaces[#namespaces + 1] = namespace

  for lnum, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
    if line:find(word, 1, true) then
      vim.api.nvim_buf_set_extmark(0, namespace, lnum - 1, 0, {
        line_hl_group = group,
      })
    end
  end
end

function M.clear()
  for _, namespace in ipairs(namespaces) do
    vim.api.nvim_buf_clear_namespace(0, namespace, 0, -1)
  end

  namespaces = {}
  index = 1
end

return M
