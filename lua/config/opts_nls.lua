return function()
  -- local nls_builtins = require("null-ls.builtins")
  local nls_utils = require("null-ls.utils")
  local nls_builtins = require("null-ls.builtins")
  return {
    -- debug = vim.g.debug_global_flag,
    debug = true,
    root_dir = nls_utils.root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
    sources = {
      nls_builtins.formatting.prettier.with({
        filetypes = { "html", "json", "yaml", "markdown" },
      }),
      nls_builtins.diagnostics.zsh,
      nls_builtins.diagnostics.luacheck,
      nls_builtins.formatting.stylua.with({
        filetypes = { "lua" },
        -- -- extra_args = { "--config-path", vim.fn.expand("~/.config/stylua.toml") },
        --   -- condition = function(utils)
        --   --   return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
        --   -- end,
      }),

      nls_builtins.formatting.beautysh.with({ filetypes = { "bash", "sh" } }),

      nls_builtins.diagnostics.markdownlint,
      nls_builtins.diagnostics.actionlint,
      nls_builtins.diagnostics.typos,
      nls_builtins.completion.spell,
      nls_builtins.completion.luasnip,
    },
  }
end

-- #### Defaults
-- - Filetypes: `{ "lua" }`
-- - Method: `diagnostics`
-- - Command: `luacheck`
-- - Args: `{ "--formatter", "plain", "--codes", "--ranges", "--filename", "$FILENAME", "-" }`

-- nls.builtins.diagnostics.shellcheck.with({
--   filetypes = { "bash", "sh" },
--   -- see :help vim.diagnostic.config()
--   -- diagnostic_config = {
--   --   underline = true,
--   --   virtual_text = false,
--   --   signs = true,
--   --   update_in_insert = false,
--   --   severity_sort = true,
--   -- },
-- }),
-- nls.builtins.code_actions.shellcheck.with({
--   filetypes = { "bash", "sh" },
-- }),
-- nls.builtins.diagnostics.misspell,
-- nls.builtins.diagnostics.cspell,
-- nls.builtins.code_actions.cspell,
-- nls.builtins.code_actions.shellcheck,
-- nls.builtins.diagnostics.shellcheck,
-- nls.builtins.diagnostics.shellcheck.with({ filetypes = { "bash", "sh", "zsh" }, config = { Filetypes = { "sh", "zsh" },},}),
-- Method= code_action,
-- Command = "shellcheck",
-- Args = { "--shell", "bash" },
-- "--shell=bash"
-- Args: { "--format", "json1", "--source-path=$DIRNAME", "--external-sources", "-" }
--   condition = has_exe("stylua"),
--   runtime_condition = has_root_pattern("stylua.toml", ".stylua.toml"),
-- }),
-- nls.builtins.formatting.prettier.with({ filetypes = { "json", "jsonc" } }),
-- nls.builtins.code_actions.refactoring,
-- formatting.prettier.with({ dynamic_command = function() return 'prettier' end, }),
-- nls.builtins.diagnostics.hadolint, -- docker
-- nls.builtins.formatting.shfmt,
-- nls.builtins.formatting.stylua.with({
--   condition = has_exe("stylua"),
--   runtime_condition = has_root_pattern("stylua.toml", ".stylua.toml"),
-- }),
-- Lua = {
--   diagnostics = {
--     globals = { "vim", "use", "s", "sn", "i", "rep", "c", "d", "f", "t", "fmta", "fmt" },
--   },
--   workspace = {
--     checkThirdParty = false,
--   },
--   completion = {
--     callSnippet = "Replace",
--   },
-- },
