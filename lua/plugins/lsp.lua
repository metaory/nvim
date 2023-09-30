local H = require("util.helper")
local icons = require("user.theme").icons

local on_attach_custom = function(client, bufnr)
  local function buf_set_option(name, value)
    vim.api.nvim_buf_set_option(bufnr, name, value)
  end
  buf_set_option("omnifunc", "v:lua.MiniCompletion.completefunc_lsp")
  if vim.fn.has("nvim-0.8") == 1 then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  else
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
end

return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    -- keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "prettierd",
        "hadolint",
        "selene",
        "vale",
        "lua-language-server",
        "luacheck",
        "shellcheck",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local nls = require("null-ls")
      return {
        debug = vim.g.debug_global_flag,
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.diagnostics.hadolint, -- docker
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "b0o/SchemaStore.nvim",
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
      },
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = false,
      },
      -- add any global capabilities here
      capabilities = {},
      -- Automatically format on save
      autoformat = true,
      -- Enable this to show formatters used in a notification
      -- Useful for debugging formatter issues
      format_notify = false,
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      servers = {
        dockerls = {},
        docker_compose_language_service = {},
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectory = { mode = "auto" },
          },
        },
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        yamlls = {
          -- Have to add this for yamlls to understand that we support line folding
          capabilities = {
            textDocument = {
              foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
              },
            },
          },
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = new_config.settings.yaml.schemas or {}
            vim.list_extend(new_config.settings.yaml.schemas, require("schemastore").yaml.schemas())
          end,
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              keyOrdering = false,
              format = {
                enable = true,
              },
              validate = true,
              schemaStore = {
                -- Must disable built-in schemaStore support to use
                -- schemas from SchemaStore.nvim plugin
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = "",
              },
            },
          },
        },
        jsonls = {
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
          end,
          settings = {
            json = {
              format = {
                enable = true,
              },
              validate = { enable = true },
            },
          },
        },
      },
      setup = {
        eslint = function()
          vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(event)
              -- if not require("lazyvim.plugins.lsp.format").enabled() then
              --   -- exit early if autoformat is not enabled
              --   return
              -- end

              local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
              if client then
                local diag = vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
                if #diag > 0 then
                  vim.cmd("EslintFixAll")
                end
              end
            end,
          })
        end,
      },
    },
    config = function(_, opts)
      local plugin = require("lazy.core.config").spec.plugins["neoconf.nvim"]
      require("neoconf").setup(require("lazy.core.plugin").values(plugin, "opts", false))
      require("user.format").setup(opts)

      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.rust_analyzer.setup({ settings = { ["rust-analyzer"] = {} } })
      lspconfig.lua_ls.setup({
        handlers = {
          -- settings = { Lua = { workspace = { checkThirdParty = false } } },
          ["textDocument/definition"] = function(_, result, ctx, _)
            if result == nil or vim.tbl_isempty(result) then
              return nil
            end
            local client = vim.lsp.get_client_by_id(ctx.client_id)
            local res = vim.tbl_islist(result) and result[1] or result
            vim.lsp.util.jump_to_location(res, client.offset_encoding)
          end,
        },
        -- cmd = { sumneko_binary, "-E", sumneko_root .. "/main.lua" },
        -- /home/meta/.local/share/nvim/mason/bin/lua-language-server
        on_attach = function(client, bufnr)
          on_attach_custom(client, bufnr)
          client.server_capabilities.completionProvider.triggerCharacters = { ".", ":" }
        end,
        root_dir = function(fname)
          return lspconfig.util.root_pattern(".git")(fname) or lspconfig.util.path.dirname(fname)
        end,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
            diagnostics = {
              globals = { "vim", "describe", "it", "before_each", "after_each" },
              disable = { "need-check-nil" },
              workspaceDelay = -1,
            },
            workspace = { ignoreSubmodules = true },
            semantic = { annotation = false },
            telemetry = { enable = false },
          },
        },
      })

      local register_capability = vim.lsp.handlers["client/registerCapability"]

      vim.lsp.handlers["client/registerCapability"] = function(err, res, ctx)
        -- local ret = register_capability(err, res, ctx)
        -- local client_id = ctx.client_id
        -- local client = vim.lsp.get_client_by_id(client_id)
        -- local buffer = vim.api.nvim_get_current_buf()
        -- require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
        -- return ret
        return register_capability(err, res, ctx)
      end

      for name, icon in pairs(icons.diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      local inlay_hint = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
      if opts.inlay_hints.enabled and inlay_hint then
        H.on_attach(function(client, buffer)
          if client.supports_method("textDocument/inlayHint") then
            inlay_hint(buffer, true)
          end
        end)
      end

      if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
        opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
          or function(diagnostic)
            for d, icon in pairs(icons.diagnostics) do
              if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
                return icon
              end
            end
          end
      end

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
    end,
  },
}

--   Util.on_attach(function(client, buffer)
--     require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
--   end)
--
--
--   local servers = opts.servers
--   local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
--   local capabilities = vim.tbl_deep_extend(
--     "force",
--     {},
--     vim.lsp.protocol.make_client_capabilities(),
--     has_cmp and cmp_nvim_lsp.default_capabilities() or {},
--     opts.capabilities or {}
--   )
--
--   local function setup(server)
--     local server_opts = vim.tbl_deep_extend("force", {
--       capabilities = vim.deepcopy(capabilities),
--     }, servers[server] or {})
--
--     if opts.setup[server] then
--       if opts.setup[server](server, server_opts) then
--         return
--       end
--     elseif opts.setup["*"] then
--       if opts.setup["*"](server, server_opts) then
--         return
--       end
--     end
--     require("lspconfig")[server].setup(server_opts)
--   end
--
--   -- get all the servers that are available through mason-lspconfig
--   local have_mason, mlsp = pcall(require, "mason-lspconfig")
--   local all_mslp_servers = {}
--   if have_mason then
--     all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
--   end
--
--   local ensure_installed = {} ---@type string[]
--   for server, server_opts in pairs(servers) do
--     if server_opts then
--       server_opts = server_opts == true and {} or server_opts
--       if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
--         setup(server)
--       else
--         ensure_installed[#ensure_installed + 1] = server
--       end
--     end
--   end
--
--   if have_mason then
--     mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
--   end
--
--   if Util.lsp_get_config("denols") and Util.lsp_get_config("tsserver") then
--     local is_deno = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
--     Util.lsp_disable("tsserver", is_deno)
--     Util.lsp_disable("denols", function(root_dir)
--       return not is_deno(root_dir)
--     end)
--   end
-- ########################################################################

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

-- ------------------------------------------------------------------------------------

-- nls.builtins.formatting.dprint.with({ condition = function(utils) return utils.root_has_file({ "dprint.json" }) or vim.loop.fs_stat("dprint.json") end, }),
-- nls.builtins.formatting.prettier.with({ filetypes = { "markdown" } }),
-- nls.builtins.code_actions.proselint.with({ filetypes = { "markdown" } }),
-- nls.builtins.diagnostics.deno_lint.with({ filetypes = { "javascript", "typescript" } }),
-- nls.builtins.diagnostics.selene.with({ filetypes = { "lua" }, condition = function(utils) return utils.root_has_file({ "selene.toml" }) end, }),
-- nls.builtins.formatting.isort,
-- nls.builtins.diagnostics.flake8,

-- mxdump(vim.inspect(nls.builtins), "null-ls-sources")
-- mxdump(vim.inspect(opts), "null-ls-opt")
-- mxdump(vim.inspect(nls.builtins.diagnostics), "null-ls-diag")
--
-- return opts
-- return {
--   root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
--   sources = opts.sources,
--   -- nls.builtins.formatting.fish_indent,
--   -- nls.builtins.diagnostics.fish,
--   -- nls.builtins.formatting.stylua,
--   -- nls.builtins.formatting.shfmt,
--   -- nls.builtins.diagnostics.flake8,
-- }

-- TEST:
-- nls.builtins.diagnostics.luacheck.with({ filetypes = { "lua" }, condition = function(utils) return utils.root_has_file({ ".luacheckrc" }) end, }),

--
-- {
--   "mason.nvim",
--   opts = function(_, opts)
--     opts.ensure_installed = opts.ensure_installed or {}
--     vim.list_extend(opts.ensure_installed, { "hadolint" })
--   end,
-- },
-- {
--   "neovim/nvim-lspconfig",
-- opts = function(_, opts)
-- TODO:
-- lua_ls = {
--   settings = {
--     Lua = {
--       completion = { callSnippet = "Replace" },
--       workspace = { checkThirdParty = false <<
-- ddwrite(opts, "__lspconfig")
-- end,
-- opts = {
--   -- format_notify = true,
--   -- diagnostics = { virtual_text = { prefix = "icons" } },
--   -- setup = {bash = {}, bashls = {},},
-- },
-- },

-- opts = function(_, opts)
-- local nls = require("null-ls")
-- opts.debug = vim.g.debug_nulls
-- vim.list_extend(opts.sources, {
--   nls.builtins.formatting.prettier.with({ filetypes = { "json", "jsonc" } }),
--   nls.builtins.diagnostics.markdownlint.with({ filetypes = { "markdown" } }),
--   nls.builtins.formatting.black.with({ filetypes = { "python" } }),
-- })
--   ddwrite(opts, "__null-ls")
-- end,

-- "stylua", -- already <<
-- "shfmt", -- already <<
-- "json",
-- "bash",
-- "bashls",
-- "proselint",
-- "rome",
