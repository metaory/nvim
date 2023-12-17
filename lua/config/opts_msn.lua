return {
  -- log_level = vim.log.levels.INFO,
  log_level = vim.log.levels.DEBUG,
  ensure_installed = {
    "stylua",
    "shfmt",
    "beautysh",
    "markdownlint",
    "typos",
    "typos-lsp",

    -- "misspell",
    "cspell",
    "actionlint",
    "prettierd",
    "hadolint",
    "marksman",
    "eslint-lsp",
    -- "selene",
    "vale",
    "fennel-language-server",
    "bash-language-server",
    "lua-language-server",
    "json-lsp", -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
    "luacheck",
    "shellcheck",
  },
}
