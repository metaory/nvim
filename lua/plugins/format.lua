if true then
  return {}
end

return {
  "stevearc/conform.nvim",
  lazy = false,
  opts = {
    formatters_by_ft = {
      -- zsh = { "shfmt" },
      -- sh = { "beautysh" },
      -- csh = { "beautysh" },
      -- ksh = { "beautysh" },
      -- zsh = { "beautysh" },
      -- bash = { "beautysh" },

      -- lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      -- python = { "isort", "black" },
      -- Use a sub-list to run only the first available formatter
      -- javascript = { { "prettierd", "prettier" } },
    },
  },
}
