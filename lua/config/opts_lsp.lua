-- TODO: RUST LS
-- lspconfig.rust_analyzer.setup({ settings = { ["rust-analyzer"] = {} } })

-- - `util.find_git_ancestor`: a function that locates the first parent directory
--   containing a `.git` directory.
--
--    root_dir = util.find_git_ancestor
--
-- - `util.find_node_modules_ancestor`: a function that locates the first parent
--   directory containing a `node_modules` directory.
--    root_dir = util.find_node_modules_ancestor
--
-- - `util.find_package_json_ancestor`: a function that locates the first parent
--   directory containing a `package.json`.
--    root_dir = util.find_json_ancestor

-- https://github.com/WhoIsSethDaniel/dotfiles/blob/4478cc6d548e87b93283f1a40b29500bfbb875f6/.config/nvim/lua/plugins/lsp/init.lua
-- settings = {
--   config = {
--     ["files.extend-exclude"] = { "picom.conf" },
--   }, -- Custom config. Used together with any workspace config files, taking precedence for settings declared in both.
-- config = -- Custom config. Used together with any workspace config files, taking precedence for settings declared in both.
-- Equivalent to the typos --config cli argument.
-- diagnosticSeverity = -- How typos are rendered in the editor, eg: as errors, warnings, information, or hints.
-- logLevel = -- Logging level of the language server. Logs appear in the Output -> Typos pane.
-- path = -- Path to the typos-lsp binary. If empty the bundled binary will be used.
-- trace.server = -- Traces the communication between VS Code and the language server. Recommended for debugging only.,
-- },
-- local servers =

-- XXX: ------------------

-- local icons = require("user.theme").icons

return function()
  return {
    -- options for vim.diagnostic.config()
    diagnostics = {
      underline = true,
      update_in_insert = false,
      -- signs = { text = { [vim.diagnostic.severity.ERROR] = 'E', ... } }
      -- linehl
      -- numhl
      -- linehl = { [vim.diagnostic.severity.ERROR] = "Visual" },
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
        -- prefix = function(diagnostic)
        --   for d, icon in pairs(icons.diagnostics) do
        --     if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
        --       return "x"
        --       -- return "x" .. icon .. "y"
        --     end
        --   end
        --   return "o"
        -- end,
      },

      -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
      -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported

      severity_sort = true,
    },
    -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
    -- Be aware that you also will need to properly configure your LSP server to
    -- provide the inlay hints.
    inlay_hints = {
      enabled = true,
    },
    -- add any global capabilities here
    -- capabilities = {},
    capabilities = vim.tbl_deep_extend(
      "force",
      {},
      require("cmp_nvim_lsp").default_capabilities(),
      vim.lsp.protocol.make_client_capabilities()
    ),

    -- capabilities = vim.lsp.protocol.make_client_capabilities(),
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
      typos_lsp = {
        filetypes = { "go", "lua", "markdown", "sql", "vim", "yaml", "gohtmltmpl", "json", "sh", "bash", "toml" },
        -- https://github.com/tekumara/setup/blob/a469214135e12b80e0fb9c8481cd9953a0a87e0f/dotfiles/Library/Application%20Support/Code/User/settings.json#L251
        settings = {
          typos = {
            diagnosticSeverity = "Warning",
          },
        },
      },

      marksman = {
        cmd = { "marksman", "server" },
        filetypes = { "markdown", "markdown.mdx" },
        root_dir = function()
          return require("lspconfig.util").root_pattern(".git", ".marksman.toml")
        end,
        single_file_support = true,
      },
      -- vale_ls = {
      --   filetypes = { "markdown", "md", "text" },
      --   cmd = { "vale", "--config=/home/meta/.config/vale/.vale.ini" },
      --   single_file_support = true,
      --   root_dir = function(fname)
      --     return require("lspconfig.util").root_pattern(".git")(fname) or require("lspconfig.util").path.dirname(fname)
      --   end,
      -- },
      bashls = {
        -- cmd = { "bash-language-server", "start" },
        -- filetypes = { "sh", "bash", "zsh", "zshrc" },
        filetypes = { "sh", "bash" },
        settings = {
          format = {
            enable = true,
          },
          bashIde = {
            -- globPattern = "*@(.sh|.zsh|.inc|.bash|.command)",
            globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
            -- globPattern = "*@(.sh|.zsh|.inc|.bash|.command)",
          },
        },
        single_file_support = true,
      },
      -- dockerls = {},
      -- docker_compose_language_service = {},
      -- eslint = {
      --   settings = {
      --     -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
      --     workingDirectory = { mode = "auto" },
      --   },
      -- },
      yamlls = {
        -- Have to add this for yamlls to understand that we support line folding
        -- diagnostics = {},
        -- capabilities = {
        --   textDocument = {
        --     foldingRange = {
        --       dynamicRegistration = false,
        --       lineFoldingOnly = true,
        --     },
        --   },
        -- },
        -- lazy-load schemastore when needed
        -- on_new_config = function(new_config)
        --   new_config.settings.yaml.schemas = new_config.settings.yaml.schemas or {}
        --   vim.list_extend(new_config.settings.yaml.schemas, require("schemastore").yaml.schemas())
        -- end,
        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            keyOrdering = false,
            format = { enable = true },
            schemaStore = {
              -- You must disable built-in schemaStore support if you want to use
              -- this plugin and its advanced options like `ignore`.
              enable = false,
              -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
              url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
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
            format = { enable = true },
            validate = { enable = true },
            schemas = require("schemastore").json.schemas(),
          },
        },
      },
      lua_ls = {
        -- mason = false, -- set to false if you don't want this server to be installed with mason
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
          -- client.server_capabilities.documentFormattingProvider = true
          -- client.server_capabilities.documentRangeFormattingProvider = true
          -- client.server_capabilities.documentFormattingProvider = false
          -- client.server_capabilities.documentRangeFormattingProvider = false
          client.server_capabilities.completionProvider.triggerCharacters = { ".", ":" }
          vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
          -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.MiniCompletion.completefunc_lsp")
          -- on_attach_custom(client, bufnr)
        end,
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(".git")(fname) or require("lspconfig.util").path.dirname(fname)
        end,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
            checkThirdParty = false,
            format = {
              defaultConfig = {
                insert_final_newline = "true",
                quote_style = "single",
                trailing_table_separator = "always",
              },
            },
            diagnostics = {
              globals = {
                -- VIM
                "vim",
                "ddwrite",
                -- TESTS
                "describe",
                "it",
                "before_each",
                "after_each",
                -- AWM
                "client",
                "awesome",
                "keygrabber",
                "mouse",
                "screen",
                "tag",
                "mousegrabber",
                "timer",
                "restore",
                "modkey",
                "root",
              },
              disable = {
                -- "need-check-nil"
              },
              workspaceDelay = -1,
            },
            library = {
              vim.fn.expand("$VIMRUNTIME"),
              -- require("neodev.config").types(),
              "${3rd}/busted/library",
              "${3rd}/luassert/library",
              "${3rd}/luv/library",
            },
            workspace = {
              ignoreSubmodules = true,
              checkThirdParty = false,
            },
            semantic = { annotation = false },
            hint = { enable = true, setType = true },
            telemetry = { enable = false },
          },
        },
      },
    },
  }
end
-- setup = {
-- eslint = function()
--   vim.api.nvim_create_autocmd("BufWritePre", {
--     callback = function(event)
--       -- if not require("lazyvim.plugins.lsp.format").enabled() then
--       --   -- exit early if autoformat is not enabled
--       --   return
--       -- end
--
--       local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
--       if client then
--         local diag = vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
--         if #diag > 0 then
--           vim.cmd("EslintFixAll")
--         end
--       end
--     end,
--   })
-- end,
-- },
-- require('lspconfig')['efm'].setup{
-- settings = ..., -- You must populate this according to the EFM readme
--   filetypes = {}, -- Populate this according to the note below
--   single_file_support = false, -- This is the important line for supporting older version of EFM
-- }

-- local register_capability = vim.lsp.handlers["client/registerCapability"]
--
-- vim.lsp.handlers["client/registerCapability"] = function(err, res, ctx)
-- local ret = register_capability(err, res, ctx)
-- local client_id = ctx.client_id
-- local client = vim.lsp.get_client_by_id(client_id)
-- local buffer = vim.api.nvim_get_current_buf()
-- require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
-- return ret
--   return register_capability(err, res, ctx)
-- end
-- require("user.format").setup(vim.tbl_deep_extend("force", opts, { autoformat = false }))
-- lspconfig.pyright.setup({})
