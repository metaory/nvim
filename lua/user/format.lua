local Util = require("lazy.core.util")

local M = {}

M.opts = nil

function M.enabled()
  return M.opts["autoformat"]
end

function M.toggle()
  if vim.b["autoformat"] == false then
    vim.b.autoformat = nil
    -- M.o.autoformat = true
  else
    M.o.autoformat = not M.o.autoformat
  end
  if M.o.autoformat then
    Util.info("Enabled format on save", { title = "Format" })
  else
    Util.warn("Disabled format on save", { title = "Format" })
  end
end

---@param _? {force?:boolean}
function M.format(_)
  -- ddwrite({ x = "format", opts = "no_opts", mopts = M.opts, z = "-----format" }, "__M_format__", "w")

  -- if true then return end
  -- if vim.b["autoformat"] == false and not (opts and opts.force) then
  --   return
  -- end

  local buf = vim.api.nvim_get_current_buf()
  local formatters = M.get_formatters(buf)
  local client_ids = vim.tbl_map(function(client)
    return client.id
  end, formatters.active)

  if #client_ids == 0 then
    return
  end

  -- TODO: zsh lint
  vim.lsp.buf.format(vim.tbl_deep_extend("force", {
    bufnr = buf,
    filter = function(client)
      return vim.tbl_contains(client_ids, client.id)
    end,
  }, require("util.helper").opts("nvim-lspconfig").format or {}))
end

-- Gets all lsp clients that support formatting.
-- When a null-ls formatter is available for the current filetype,
-- only null-ls formatters are returned.
function M.get_formatters(bufnr)
  local ft = vim.bo[bufnr]["filetype"] or vim.bo.filetype
  -- check if we have any null-ls formatters for the current filetype
  local null_ls = package.loaded["null-ls"] and require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") or {}

  local ret = {
    active = {},
    available = {},
    null_ls = null_ls,
  }

  local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
  for _, client in ipairs(clients) do
    if M.supports_format(client) then
      if (#null_ls > 0 and client["name"] == "null-ls") or #null_ls == 0 then
        table.insert(ret.active, client)
      else
        table.insert(ret.available, client)
      end
    end
  end

  return ret
end

-- Gets all lsp clients that support formatting
-- and have not disabled it in their client config
function M.supports_format(client)
  local client_caps = client["config"] and client["config"]["capabilities"] or {}
  if client_caps.documentFormattingProvider == false then
    return false
  end
  return client["supports_method"]("textDocument/formatting")
    or client["supports_method"]("textDocument/rangeFormatting")
end

function M.create_autocmd(opts)
  M.opts = opts or {}
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("MXFormat", {}),
    callback = function()
      if M.opts["autoformat"] then
        -- require("lint").try_lint()
        M.format()
      end
    end,
  })
end

return M

-- function M.notify(formatters)
--   local lines = { "# Active:" }
--
--   for _, client in ipairs(formatters.active) do
--     local line = "- **" .. client.name .. "**"
--     if client.name == "null-ls" then
--       line = line
--         .. " ("
--         .. table.concat(
--           vim.tbl_map(function(f)
--             return "`" .. f.name .. "`"
--           end, formatters.null_ls),
--           ", "
--         )
--         .. ")"
--     end
--     table.insert(lines, line)
--   end
--
--   if #formatters.available > 0 then
--     table.insert(lines, "")
--     table.insert(lines, "# Disabled:")
--     for _, client in ipairs(formatters.available) do
--       table.insert(lines, "- **" .. client.name .. "**")
--     end
--   end
--
--   vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO, {
--     title = "Formatting",
--     on_open = function(win)
--       vim.api.nvim_win_set_option(win, "conceallevel", 3)
--       vim.api.nvim_win_set_option(win, "spell", false)
--       local buf = vim.api.nvim_win_get_buf(win)
--       -- local buf = vim.api.nvim_get_current_buf()
--       ddwrite({ pre_buf = buf, X = "__PRE_TS_START_" }, "_PRE_TS_START")
--       vim.treesitter.start(buf, "markdown")
--       ddwrite({ pst_buf = buf, X = "__PST_TS_START_" }, "_PST_TS_START")
--     end,
--   })
-- end
-- if M.opts.format_notify then
--   M.notify(formatters)
-- end
