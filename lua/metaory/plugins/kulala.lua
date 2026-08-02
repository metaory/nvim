return {
  "mistweaverco/kulala.nvim",
  keys = {
    { "<leader>Rs", desc = "Send request" },
    { "<leader>Ra", desc = "Send all requests" },
    { "<leader>Ro", desc = "Open Kulala" },
  },
  -- ft = { "http", "rest" },
  opts = {
    global_keymaps = {
      ["Open scratchpad"] = false,
    },
    global_keymaps_prefix = "<leader>R",
    kulala_keymaps_prefix = "",
    lsp = { formatter = true },
    -- needs `tree-sitter` CLI (pacman -S tree-sitter-cli)
    treesitter = {
      enable = vim.fn.executable("tree-sitter") == 1,
    },
    ui = {
      ---@type table<string, string|vim.api.keyset.highlight>
      syntax_hl = {
        ["@punctuation.bracket.kulala_http"] = "Number",
        ["@character.special.kulala_http"] = "Special",
        ["@operator.kulala_http"] = "Special",
        ["@variable.kulala_http"] = "String",
        ["@redirect_path.kulala_http"] = "Number",
        ["@external_body_path.kulala_http"] = "String",
      },
    },
  },
}
