return {
  -- { "williamboman/mason-lspconfig.nvim", },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { eslint = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").on_attach(function(client)
            client.server_capabilities.documentFormattingProvider = true
            -- if client.name == "eslint" then
            --   client.server_capabilities.documentFormattingProvider = true
            -- elseif client.name == "tsserver" then
            --   client.server_capabilities.documentFormattingProvider = false
            -- end
          end)
        end,
      },
      ["rust-analyzer"] = {
        checkOnSave = {
          allFeatures = true,
          overrideCommand = {
            "cargo",
            "clippy",
            "--workspace",
            "--message-format=json",
            "--all-targets",
            "--all-features",
          },
        },
      },
    },
  },
}
