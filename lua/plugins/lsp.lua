return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "vale",
        "rome",
        "stylua",
        "selene",
        -- "proselint",
        "luacheck",
        "shellcheck",
        "shfmt",
      })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.debug = true
      vim.list_extend(opts.sources, {
        -- nls.builtins.formatting.dprint.with({
        --   condition = function(utils)
        --     return utils.root_has_file({ "dprint.json" }) or vim.loop.fs_stat("dprint.json")
        --   end,
        -- }),
        -- nls.builtins.formatting.prettier.with({ filetypes = { "markdown" } }),
        nls.builtins.diagnostics.markdownlint.with({ filetypes = { "markdown" } }),
        -- nls.builtins.code_actions.proselint.with({ filetypes = { "markdown" } }),

        -- nls.builtins.diagnostics.deno_lint.with({ filetypes = { "javascript", "typescript" } }),
        -- nls.builtins.diagnostics.selene.with({
        --   filetypes = { "lua" },
        --   condition = function(utils) return utils.root_has_file({ "selene.toml" }) end,
        -- }),
        -- nls.builtins.formatting.isort,
        nls.builtins.formatting.black.with({ filetypes = { "python" } }),
        -- nls.builtins.diagnostics.flake8,
        nls.builtins.diagnostics.luacheck.with({
          filetypes = { "lua" },
          condition = function(utils)
            return utils.root_has_file({ ".luacheckrc" })
          end,
        }),
        -- table.remove()
      })

      -- mxdump(vim.inspect(nls.builtins), "null-ls-sources")
      -- mxdump(vim.inspect(opts), "null-ls-opt")
      -- mxdump(vim.inspect(nls.builtins.diagnostics), "null-ls-diag")
      --
      return opts
      -- return {
      --   root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      --   sources = opts.sources,
      --   -- nls.builtins.formatting.fish_indent,
      --   -- nls.builtins.diagnostics.fish,
      --   -- nls.builtins.formatting.stylua,
      --   -- nls.builtins.formatting.shfmt,
      --   -- nls.builtins.diagnostics.flake8,
      -- }
    end,
  },
}
--[[

return {
  -- neodev
  {
    "folke/neodev.nvim",
    opts = {
      debug = true,
      experimental = {
        pathStrict = true,
      },
      library = {
        --        runtime = "~/projects/neovim/runtime/",
      },
    },
  },

  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "vale",
        "rome",
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
      })
    end,
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    init = function()
      -- disable lsp watcher. Too slow on linux
      local ok, wf = pcall(require, "vim.lsp._watchfiles")
      if ok then
        wf._watchfunc = function()
          return function() end
        end
      end
    end,
    opts = {
      inlay_hints = { enabled = true },
      ---@type lspconfig.options
      servers = {
        -- rome = {
        --   root_dir = function(fname)
        --     return require("lspconfig").util.root_pattern("rome.json")(fname)
        --   end,
        --   mason = false,
        --   settings = {
        --     rome = {
        --       rename = true,
        --       -- requireConfiguration = true,
        --     },
        --   },
        -- },
        ansiblels = {},
        bashls = {},
        clangd = {},
        -- denols = {},
        cssls = {},
        dockerls = {},
        ruff_lsp = {},
        -- svelte = {},
        html = {},
        gopls = {},
        marksman = {},
        pyright = {
          enabled = false,
        },
        rust_analyzer = {
          -- settings = {
          --   ["rust-analyzer"] = {
          --     procMacro = { enable = true },
          --     cargo = { allFeatures = true },
          --     checkOnSave = {
          --       command = "clippy",
          --       extraArgs = { "--no-deps" },
          --     },
          --   },
          -- },
        },
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        lua_ls = {
          -- enabled = false,
          -- cmd = { "/home/folke/projects/lua-language-server/bin/lua-language-server" },
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  -- "--log-level=trace",
                },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = true,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
        vale_ls = {},
        vimls = {},
      },
      setup = {},
    },
  },

  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     diagnostics = { virtual_text = { prefix = "icons" } },
  --     setup = {
  --       clangd = function(_, opts)
  --         opts.capabilities.offsetEncoding = { "utf-16" }
  --       end,
  --     },
  --   },
  -- },

  -- {
  --   "mfussenegger/nvim-lint",
  --   lazy = false,
  --   config = function ()
  --     local lint = require('lint')
  --     lint.linters_by_ft = {
  --       markdown = {'markdownlint'},
  --       -- htmldjango = {'curlylint'},
  --       lua = {'codespell', 'luacheck'},
  --       -- ['yaml.ansible'] = {'ansible_lint'},
  --       yaml = {'yamllint'},
  --       gitcommit = {'codespell'},
  --       dockerfile = {'hadolint'},
  --       ghaction = {"actionlint"},
  --     }
  --   end,
  -- },
  -- create_autocmd({'BufWritePost', 'BufEnter'}, {
  --   group = api.nvim_create_augroup('lint', { clear = true }),
  --   callback = function() lint.try_lint() end,
  -- })
  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    -- enabled = false,
    -- dev = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        nls.builtins.formatting.dprint.with({
          condition = function(utils)
            return utils.root_has_file({ "dprint.json" }) or vim.loop.fs_stat("dprint.json")
          end,
        }),
        nls.builtins.formatting.prettier.with({ filetypes = { "markdown" } }),
        nls.builtins.diagnostics.markdownlint,
        nls.builtins.diagnostics.deno_lint,
        nls.builtins.diagnostics.selene.with({
          condition = function(utils)
            return utils.root_has_file({ "selene.toml" })
          end,
        }),
        nls.builtins.formatting.isort,
        nls.builtins.formatting.black,
        nls.builtins.diagnostics.flake8,
        nls.builtins.diagnostics.luacheck.with({
          condition = function(utils)
            return utils.root_has_file({ ".luacheckrc" })
          end,
        }),
      })

      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = opts.sources,
        -- nls.builtins.formatting.fish_indent,
        -- nls.builtins.diagnostics.fish,
        -- nls.builtins.formatting.stylua,
        -- nls.builtins.formatting.shfmt,
        -- nls.builtins.diagnostics.flake8,
      }
    end,
  },
}
--]]
-- tailwindcss = {
--   root_dir = function(...)
--     return require("lspconfig.util").root_pattern(".git")(...)
--   end,
-- },
-- tsserver = {
--   root_dir = function(...)
--     return require("lspconfig.util").root_pattern(".git")(...)
--   end,
--   single_file_support = false,
--   settings = {
--     typescript = {
--       inlayHints = {
--         includeInlayParameterNameHints = "literal",
--         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
--         includeInlayFunctionParameterTypeHints = true,
--         includeInlayVariableTypeHints = false,
--         includeInlayPropertyDeclarationTypeHints = true,
--         includeInlayFunctionLikeReturnTypeHints = true,
--         includeInlayEnumMemberValueHints = true,
--       },
--     },
--     javascript = {
--       inlayHints = {
--         includeInlayParameterNameHints = "all",
--         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
--         includeInlayFunctionParameterTypeHints = true,
--         includeInlayVariableTypeHints = true,
--         includeInlayPropertyDeclarationTypeHints = true,
--         includeInlayFunctionLikeReturnTypeHints = true,
--         includeInlayEnumMemberValueHints = true,
--       },
--     },
--   },
-- },
