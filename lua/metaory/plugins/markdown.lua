return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "mdx", "Avante" },
    after = { "nvim-treesitter" },
    requires = { "nvim-mini/mini.nvim", opt = true },
    config = function()
      -- vim.api.nvim_set_hl(0, "RenderMarkdownBullet", { fg = "#ffffff", default = true })
      -- vim.api.nvim_set_hl(0, "@markup.list.markdown", { fg = "#ffffff", default = true })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#16161e" })
      -- vim.api.nvim_set_hl(0, "CodeBlock", { bg = "#16161e" })
      -- vim.api.nvim_set_hl(0, "CodeInline", { bg = "#1A1B26", fg = "#9199ed" })
      -- vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline", { link = "CodeInline" })
      -- vim.api.nvim_set_hl(0, "@markup.raw", { link = "CodeInline" })
      -- vim.api.nvim_set_hl(0, "@markup.list", { link = "@markup.strong" })
      vim.api.nvim_set_hl(0, "@markup.strong", { fg = XC.c09, bold = true })
      vim.api.nvim_set_hl(0, "@markup.italic", { fg = XC.cc3, italic = true })
      vim.api.nvim_set_hl(0, "@markup.muted", { fg = XC.cc7 })
      vim.api.nvim_set_hl(0, "@markup.strikethrough", { fg = XC.wk6, bold = true, strikethrough = true })
      vim.api.nvim_set_hl(0, "@markup.underline", { fg = XC.wk9, bold = true })
      vim.api.nvim_set_hl(0, "@markup.raw.block.markdown", { fg = XC.cc6, bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = XC.c15, bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownBullet", { fg = XC.sbg, default = true })
      vim.api.nvim_set_hl(0, "@markup.list.markdown", { fg = XC.cy7, default = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = XC.sk0 })
      vim.api.nvim_set_hl(0, "CodeBlock", { bg = XC.sk1 })
      vim.api.nvim_set_hl(0, "CodeInline", { bg = XC.wk1, fg = XC.wk7 })
      vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline", { link = "CodeInline" })
      vim.api.nvim_set_hl(0, "@markup.list", { link = "@markup.strong" })
      vim.api.nvim_set_hl(0, "@markup.raw", { link = "CodeInline" })
      require("render-markdown").setup({
        file_types = { "markdown", "mdx", "Avante" },
        render_modes = true,
        sign = { enabled = false },
        anti_conceal = {},
        heading = {
          border = true,
          above = "",
          width = "block",
          below = "─",
          right_pad = 1,
          backgrounds = {
            "RenderMarkdownH1Bg",
            "RenderMarkdownH2Bg",
            "RenderMarkdownH3Bg",
            "RenderMarkdownH4Bg",
            "RenderMarkdownH5Bg",
            "RenderMarkdownH6Bg",
          },
          foregrounds = {
            "RenderMarkdownH1",
            "RenderMarkdownH2",
            "RenderMarkdownH3",
            "RenderMarkdownH4",
            "RenderMarkdownH5",
            "RenderMarkdownH6",
          },
        },
        bullet = {
          enabled = true,
          icons = { "•", "∘", "▪", "▫", "" },
          highlight = "@markup.strong",
        },
        dash = {
          highlight = "Comment",
        },
        pipe_table = {
          head = "Comment",
          row = "Comment",
          filler = "Comment",
        },
        code = {
          border = "thin",
          left_pad = 2,
          render_modes = true,
          width = "block",
          min_width = 80,
          highlight = "RenderMarkdownCode",
          highlight_inline = "RenderMarkdownCodeInline",
          position = "right",
          language_pad = 1,
        },
      })
    end,
  },
}
