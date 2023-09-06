return {
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  -- { "nvim-treesitter/nvim-treesitter-context", cmd = "TSContextToggle" },
  { "echasnovski/mini.ai", enabled = false },
  { "RRethy/vim-illuminate", enabled = false },
  {
    "echasnovski/mini.cursorword",
    event = "VeryLazy",
    opts = { delay = 100 },
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.highlight.additional_vim_regex_highlighting = { "markdown" }
      vim.list_extend(opts.ensure_installed, { "jq" })
    end,
  },
}
-- ddwrite(opts, "treesitter")
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
