-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

require("lspconfig").terraformls.setup({})
require("lspconfig").tflint.setup({})

-- require("lspconfig").terraformls.setup({})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.tf", "*.tfvars", "*.js" },
  callback = function()
    vim.lsp.buf.format()
  end,
})
