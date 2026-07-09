local M = {}

M.setup = function()
  local lang = require("metaory.lang")
  local handlers = require("metaory.plugins.lsp.handlers")

  require("lspconfig")

  for _, server in ipairs(lang.lsp_servers()) do
    if server.config then
      vim.lsp.config(server.name, server.config)
    end
    vim.lsp.enable(server.name)
  end

  vim.lsp.config("*", {
    capabilities = handlers.capabilities(),
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      handlers.on_attach(client, event.buf)
    end,
  })
end

return M
