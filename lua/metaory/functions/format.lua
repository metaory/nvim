return function()
  local ok, conform = pcall(require, "conform")
  if ok and conform then
    conform.format({
      bufnr = 0,
      -- lsp_fallback = true,
      lsp_format = "fallback",
      async = false,
    })
  else
    vim.lsp.buf.format()
  end
end
