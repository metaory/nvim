local lang = require("metaory.lang")

return {
  "stevearc/conform.nvim",
  ft = lang.fts_with_format(),
  config = function()
    require("conform").setup({
      formatters_by_ft = lang.formatters_by_ft(),
      formatters = {
        gofumpt = {
          env = {
            GOFUMPT_SPLIT_LONG_LINES = "on",
          },
        },
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

    vim.keymap.set("n", "<leader>lF", function()
      vim.g.disable_autoformat = not vim.g.disable_autoformat
      vim.notify("Auto formatting is " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
    end, { desc = "Auto Formatting" })

    require("which-key").add({
      { "<leader>lF", icon = "󰨚 " },
    })
  end,
}
