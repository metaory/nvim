if true then
  return {}
end

-- https://github.com/0x6a68/echo-boomer-rice/blob/54d84a5f7a73383931c8a716deb82bff840054c5/.config/nvim/lua/plugins/extras/lang/styles.lua#L11
return {
  "stevearc/conform.nvim",
  lazy = false,
  config = true,
  opts = {
    formatters_by_ft = {
      zsh = { "shfmt" },
      sh = { "beautysh" },
      csh = { "beautysh" },
      ksh = { "beautysh" },
      bash = { "beautysh" },
      -- zsh = { "beautysh" },

      -- lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      -- python = { "isort", "black" },
      -- Use a sub-list to run only the first available formatter
      -- javascript = { { "prettierd", "prettier" } },
    },
  },
}
