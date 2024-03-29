local load_textobjects = false

--[[ PARSER FILES treesitter-parsers
  Parsers are the heart of tree-sitter. They are libraries that tree-sitter will
    search for in the parser runtime directory. By default, Nvim bundles parsers
    for C, Lua, Vimscript, Vimdoc and Treesitter query files, but parsers can be
    installed manually or via a plugin like https://github.com/nvim-treesitter/nvim-treesitter.

  Parsers are searched for as parser/{lang}.* in any 'runtimepath' directory.
    If multiple parsers for the same language are found, the first one is used.
    (This typically implies the priority "user config > plugins > bundled".
    A parser can also be loaded manually using a full path:
    vim.treesitter.language.add('python', { path = "/path/to/python.so" })
]]

return {
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  -- TODO:
  -- { "nvim-treesitter/nvim-treesitter-context", cmd = "TSContextToggle" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  -- { "echasnovski/mini.ai", enabled = true },
  -- { "RRethy/vim-illuminate", enabled = false },
  {
    "echasnovski/mini.cursorword",
    event = "VeryLazy",
    init = function()
      -- disable rtp plugin, as we only need its queries for mini.ai
      -- In case other textobject modules are enabled, we will load them
      -- once nvim-treesitter is loaded
      -- print("ARE WEEEEEEEEEEEEEEEE")
      require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
      load_textobjects = true
    end,
    opts = { delay = 100 },
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { { "nvim-treesitter-textobjects" } },
    cmd = { "TSUpdateSync" },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>", desc = "Decrement selection", mode = "x" },
    },
    opts = {
      auto_install = true,
      sync_install = true,
      textobjects = {
        enable = true,
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          -- keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          -- ["af"] = "@function.outer",
          -- ["az"] = "@function.outer",
          -- ["if"] = "@function.inner",
          -- ["ac"] = "@class.outer",
          -- You can optionally set descriptions to the mappings (used in the desc parameter of
          -- nvim_buf_set_keymap) which plugins like which-key display
          -- ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
          -- You can also use captures from other query groups like `locals.scm`
          -- ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          -- },
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          -- selection_modes = {
          --   ["@parameter.outer"] = "v", -- charwise
          --   ["@function.outer"] = "V", -- linewise
          --   ["@class.outer"] = "<c-v>", -- blockwise
          -- },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true of false
          include_surrounding_whitespace = true,
        },
      },
      -- ensure_installed = {"ssh_config", "jq", "kdl", "yaml", "dockerfile", "json", "json5", "jsonc", "bash", "c", "html", "javascript", "jsdoc", "lua", "luadoc", "luap", "norg", "markdown", "markdown_inline", "python", "query", "regex", "tsx", "typescript", "vim", "vimdoc", "yaml",},
      -- TODO:: https://capnproto.org/
      ensure_installed = "all",
      ignore_install = {
        "c_sharp",
        "haskell",
        "java",
        "objc",
        "objcdump",
        "php",
        "phpdoc",
      },
      highlight = { enable = true },
      indent = { enable = true },
      -- highlight = { enable = true },
      -- indent = { enable = true },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)

      -- log:trace("_________________________________________", { load_textobjects = load_textobjects, opts = opts })
      if load_textobjects then
        -- PERF: no need to load the plugin, if we only need its queries for mini.ai
        if opts.textobjects then
          for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
            -- print("XXXXX" .. tostring(mod) .. "XXXXX")
            if opts.textobjects[mod] and opts.textobjects[mod].enable then
              -- print("------------------")
              local Loader = require("lazy.core.loader")
              Loader.disabled_rtp_plugins["nvim-treesitter-textobjects"] = nil
              local plugin = require("lazy.core.config").plugins["nvim-treesitter-textobjects"]
              require("lazy.core.loader").source_runtime(plugin.dir, "plugin")
              break
            end
          end
        end
      end
    end,
  },
}

-- -- { "RRethy/vim-illuminate", event = nil },
-- { "RRethy/vim-illuminate", dependencies = { "nvim-treesitter/nvim-treesitter" } },
-- { "windwp/nvim-ts-autotag", },
-- {
--   "nvim-treesitter/nvim-treesitter-context",
--   -- event = "BufReadPre",
--   -- enabled = true,
--   opts = { mode = "cursor" },
-- },

-- {
--   "nvim-treesitter/nvim-treesitter",
--   dependencies = {
--     {
--       "nvim-treesitter/nvim-treesitter-context",
--       opts = { mode = "cursor" },
--       config = true,
--     },
--     {
--       "nvim-treesitter/nvim-treesitter-textobjects",
--       -- config = true,
--       init = function()
--         -- disable rtp plugin, as we only need its queries for mini.ai
--         -- In case other textobject modules are enabled, we will load them once nvim-treesitter is loaded
--         require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
--         -- load_textobjects = true
--       end,
--       --
--     },
--   },
--   opts = {
--     ensure_installed = {
--       "astro",
--       "bash",
--       "c",
--       "cmake",
--       -- "comment", -- comments are slowing down TS bigtime, so disable for now
--       "cpp",
--       "css",
--       "diff",
--       -- "fish",
--       "gitignore",
--       "go",
--       "graphql",
--       "html",
--       "http",
--       -- "java",
--       "javascript",
--       "jsdoc",
--       "jsonc",
--       "lua",
--       "luap",
--       "markdown",
--       "markdown_inline",
--       "meson",
--       -- "ninja",
--       "nix",
--       "norg",
--       "org",
--       -- "php",
--       "python",
--       "query",
--       "regex",
--       "rust",
--       "scss",
--       "sql",
--       "svelte",
--       "teal",
--       "toml",
--       "tsx",
--       "typescript",
--       "vhs",
--       "vim",
--       "vimdoc",
--       "vue",
--       "wgsl",
--       "yaml",
--       -- "wgsl",
--       "json",
--     },
--     -- incremental_selection = {
--     --   enable = true,
--     --   keymaps = {
--     --     init_selection = "<C-space>",
--     --     node_incremental = "<C-space>",
--     --     scope_incremental = false,
--     --     node_decremental = "<bs>",
--     --   },
--     -- },
--     matchup = {
--       enable = true,
--     },
--     -- highlight = { enable = true },
--     query_linter = {
--       enable = true,
--       use_virtual_text = true,
--       lint_events = { "BufWrite", "CursorHold" },
--     },
--     playground = {
--       enable = true,
--       disable = {},
--       updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
--       persist_queries = true, -- Whether the query persists across vim sessions
--       keybindings = {
--         toggle_query_editor = "o",
--         toggle_hl_groups = "i",
--         toggle_injected_languages = "t",
--         toggle_anonymous_nodes = "a",
--         toggle_language_display = "I",
--         focus_language = "f",
--         unfocus_language = "F",
--         update = "R",
--         goto_node = "<cr>",
--         show_help = "?",
--       },
--     },
--     highlight = {
--       enable = true,
--       -- disable = { "c", "rust" },
--       -- disable = function(lang, buf)
--       --   local max_filesize = 100 * 1024 -- 100 KB
--       --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
--       --   if ok and stats and stats.size > max_filesize then
--       --     return true
--       --   end
--       -- end,
--
--       -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--       -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--       -- Using this option may slow down your editor, and you may see some duplicate highlights.
--       -- Instead of true it can also be a list of languages
--       -- additional_vim_regex_highlighting = true,
--       -- additional_vim_regex_highlighting = { "vim" },
--     },
--   },
-- },
-- {
--   "nvim-treesitter/nvim-treesitter",
--   dependencies = {
--     { "windwp/nvim-ts-autotag", opts = {} },
--   },
-- },
-- opts = function(_, opts)
-- opts.highlight.additional_vim_regex_highlighting = { "markdown" }
-- opts.textobjects = {
--   select = {
--     enable = true,
--     lookahead = true,
--     keymaps = {
--       ["af"] = "@function.outer",
--       ["if"] = "@function.inner",
--       ["ij"] = "@block.inner",
--       ["ac"] = "@class.outer",
--       ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
--       ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
--     },
--     selection_modes = {
--       ["@parameter.outer"] = "v", -- charwise
--       ["@function.outer"] = "V", -- linewise
--       ["@class.outer"] = "<c-v>", -- blockwise
--     },
--     include_surrounding_whitespace = true,
--   },
-- }
-- opts.indent.enable = false
-- vim.list_extend(opts.ensure_installed, { "jq" })
-- ddwrite(opts, "treesitter")
-- end,
