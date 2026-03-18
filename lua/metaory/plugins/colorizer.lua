return {
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPost",
  filetypes = {
    "css",
    "less",
    "scss",
    "sass",
    "sh",
    "bash",
    "javascript",
    "jsx",
    "typescript",
    "tsx",
    "env",
    "vue",
    "lua",
    "yml",
  },
  config = function()
    require("colorizer").setup({
      filetypes = {
        "css",
        "less",
        "scss",
        "sass",
        "lua",
        "sh",
        "bash",
        "javascript",
        "jsx",
        "typescript",
        "tsx",
        "env",
        "vue",
        "yml",
        "tmux",
        "!TelescopePrompt",
        "!TelescopeResults",
        "!help",
        "!DiffviewFiles",
      },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = true,
        AARRGGBB = false,
        rgb_fn = true,
        hsl_fn = true,
        css = false,
        css_fn = false,
        mode = "background",
        tailwind = true,
        virtualtext = "■",
      },
      -- buftypes = {
      --   "*",
      --   "!prompt",
      --   "!popup",
      -- },
    })

    vim.cmd(
      [[autocmd ColorScheme * lua package.loaded['colorizer'] = nil; require('colorizer').setup(); require('colorizer').attach_to_buffer(0)]]
    )
  end,
}
