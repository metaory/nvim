local M = {}

local conform = require("conform")

-- require("conform").list_formatters(vim.api.nvim_get_current_buf())

function M.list_registered(bufnr)
  local registered = conform.list_formatters(bufnr)
  -- create a list of formatters
  local formatter_names = {}
  for _, v in ipairs(registered) do
    print(v.name)
    if v.name ~= "eslint_d" and v.name ~= "goimports-reviser" then
      local name = v.name
      if name == "prettierd" or name == "prettier" then
        name = " Prettier"
      end

      table.insert(formatter_names, name)
    end
  end
  return formatter_names
end

return M
