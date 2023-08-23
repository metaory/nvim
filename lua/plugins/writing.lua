return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prettierd")
      table.insert(opts.ensure_installed, "proselint")
      table.insert(opts.ensure_installed, "write-good")
      table.insert(opts.ensure_installed, "alex")
    end,
  },
  -- TODO: https://github.com/mfussenegger/nvim-lint
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.prettierd)
      table.insert(opts.sources, nls.builtins.diagnostics.proselint)
      table.insert(opts.sources, nls.builtins.code_actions.proselint)
      table.insert(opts.sources, nls.builtins.diagnostics.alex)
      table.insert(opts.sources, nls.builtins.diagnostics.write_good)

      -- opts.sources = vim.list_extend(opts.sources, {
      --   nls.builtins.diagnostics.proselint,
      --   nls.builtins.code_actions.proselint,
      --   nls.builtins.diagnostics.alex,
      --   nls.builtins.diagnostics.write_good,
      -- })
    end,
  },
}
