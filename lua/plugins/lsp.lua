-- TODO: for zsh lint
local H = require("util.helper")

local icons = require("user.theme").icons

-- local ff = "ff"
--
-- local ffo = 122
--
return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    -- keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = require("config.opts_msn"),
    config = function(_, opts)
      require("mason").setup(opts)
      -- require("mason-lspconfig").setup()
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
    -- "jose-elias-alvarez/null-ls.nvim",
    "nvimtools/none-ls.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    -- config = true,
    opts = require("config.opts_nls"),
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "b0o/SchemaStore.nvim",
      -- { "folke/neoconf.nvim", cmd = "Neoconf", config = false },
      -- { "folke/neodev.nvim", opts = { debug = true } },
      "mason.nvim",
      "none-ls.nvim",
      "hrsh7th/cmp-nvim-lsp",
      -- "mfussenegger/nvim-lint",
      -- "mason-null-ls.nvim",
      -- "williamboman/mason-lspconfig.nvim",
    },
    opts = require("config.opts_lsp"),
    config = function(_, opts)
      -- local neoconf_plug = require("lazy.core.config").spec.plugins["neoconf.nvim"]
      --[[ XXX ]]
      -- ddwrite(neoconf_plug, "___plugin__neoconf_PLG_")
      -- local neoconf_opts = require("lazy.core.plugin").values(neoconf_plug, "opts", false)
      --[[ XXX ]]
      -- ddwrite(neoconf_opts, "__plugin__neoconf_OPT_")

      ddwrite(opts, "__plugin__LSPCONF_OPT_")

      -- require("neoconf").setup(neoconf_opts)
      require("user.format").create_autocmd(opts)

      -- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
      local lspconfig = require("lspconfig")
      -- lspconfig.marksman.setup(opts.servers.marksman or {})
      -- lspconfig.vale_ls.setup(opts.servers.vale_ls or {})
      -- lspconfig.bashls.setup(opts.servers.bashls or {})
      -- lspconfig.typos_lsp.setup(opts.servers.typos_lsp or {})
      -- lspconfig.tsserver.setup(opts.servers.tsserver or {})
      -- lspconfig.jsonls.setup(opts.servers.jsonls or {})
      -- lspconfig.lua_ls.setup(opts.servers.lua_ls)
      -- lspconfig.fennel_language_server.setup({})

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
      ddwrite({ x = "xx", k = vim.tbl_keys(opts.servers) }, "____SERVVV_")
      for key in pairs(opts.servers) do
        lspconfig[key].setup(opts.servers[key] or {})
      end
      -- vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
      vim.diagnostic.config(opts.diagnostics)

      -- if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
      --   opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
      --     or function(diagnostic)
      --       for d, icon in pairs(icons.diagnostics) do
      --         if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
      --           return "x" .. icon .. "y"
      --         end
      --       end
      --     end
      -- end
    end,
  },
}

-- {
--   "jay-babu/mason-null-ls.nvim",
--   opts = function()
--     return {
--       ensure_installed = nil, -- INFO: https://github.com/jay-babu/mason-null-ls.nvim?tab=readme-ov-file#primary-source-of-truth-is-null-ls
--
--       -- ensure_installed = { "stylua", "jq" },
--       -- Example: `automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }`
--       automatic_installation = true,
--       -- handlers = {
--       --   function() end, -- disables automatic setup of all null-ls sources
--       --   stylua = function(source_name, methods)
--       --     require("null-ls").register(require("null-ls").builtins.formatting.stylua)
--       --   end,
--       --   shfmt = function(source_name, methods)
--       --     -- custom logic
--       --     require("mason-null-ls").default_setup(source_name, methods) -- to maintain default behavior
--       --   end,
--       -- },
--     }
--   end,
--   config = function(_, opts)
--     --require("your.null-ls.config") -- require your null-ls config here (example below)
--     require("null-ls.config")
--     require("mason-null-ls").setup(opts)
--   end,
-- },
