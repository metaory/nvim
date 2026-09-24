local lang = require("metaory.lang")

return {
  "stevearc/conform.nvim",
  ft = lang.fts_with_format(),
  config = function()
    require("conform").setup({
      formatters_by_ft = lang.formatters_by_ft(),
      formatters = {
        biome = { require_cwd = true },
        prettier = {
          options = {
            ft_parsers = { astro = "astro" },
          },
        },
      },
      format_on_save = function(buf)
        if vim.g.disable_autoformat then
          return
        end
        return { bufnr = buf, timeout_ms = 3000, lsp_format = false }
      end,
    })
  end,
}
