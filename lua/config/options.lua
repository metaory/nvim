-- set wildignore=*.o,*.a,__pycache__
-- vim.opt.wildignore = { '*.o', '*.a', '__pycache__' }

-- vim.opt.timeout = false
-- vim.opt.timeoutlen = 300
vim.opt.updatetime = 2000
vim.opt.list = true
-- vim.opt.listchars = {
--   eol = "⌐",
--   tab = "ᐧᐧᐧ",
--   trail = "~",
--   extends = "»",
--   precedes = "«",
-- }
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

vim.o.foldmethod = "indent"
vim.o.foldenable = false

-- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = true
-- vim.o.foldcolumn = "0"

vim.filetype.add({
  extension = {
    cconf = "python",
    frag = "glsl",
    -- jsx = "javascript.jsx",
    -- ["js.flow"] = "javascript.jsx",
    -- norg = "norg",
    -- rbi = "ruby",
    tmux = "tmux",
    tmuxtheme = "tmux",
    -- tsx = "typescript.tsx",
  },
  filename = {
    [".zalias"] = "zsh",
    [".nvimrc"] = "lua",
    -- ["kitty.conf"] = "kitty",
    ["picom.conf"] = "toml",
    ["tsconfig.json"] = "jsonc",
  },
  -- pattern = {
  -- [".*/%.vscode/.*%.json"] = "json5",
  -- ["Dockerfile-.*"] = "dockerfile",
  -- [".*/%.vscode/.*%.json"] = "json5",
  -- },
})

vim.go.commentstring = "# %s"

-- vim.go.autochdir = false

-- vim.opt.backup = true
vim.opt.cmdheight = 0
-- vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"

vim.o.spell = false
vim.o.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
--
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("state") .. "/undo"
--
vim.o.backup = true
vim.o.backupdir = vim.fn.stdpath("state") .. "/backup"

if vim.g.neovide then
  vim.opt.guifont = { "FiraCode Nerd Font Mono", "h9" }
  vim.g.neovide_scale_factor = 0.3
end

vim.opt.clipboard = "unnamed" -- Sync with system clipboard
vim.opt.scrolloff = 0 -- Lines of context
vim.opt.cursorcolumn = true
vim.opt.laststatus = 3
vim.opt.colorcolumn = "80"

-- XXX:
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- vim.g.node_host_prog = "/Users/folke/.pnpm-global/5/node_modules/neovim/bin/cli.js"
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- require("util.status")

-- make all keymaps silent by default
-- local keymap_set = vim.keymap.set
-- ---@diagnostic disable-next-line: duplicate-set-field
-- vim.keymap.set = function(mode, lhs, rhs, opts)
--   opts = opts or {}
--   opts.silent = opts.silent ~= false
--   return keymap_set(mode, lhs, rhs, opts)
-- end
-- vim.api.nvim_get_runtime_file("package.json", true) = {
--   "/home/meta/.local/share/nvim/lazy/friendly-snippets/package.json",
--   "/home/meta/.local/share/nvim/lazy/typescript.nvim/package.json",
-- }
--
-- vim.api.nvim_list_runtime_paths() = {
--   "/home/meta/.config/nvim",
--   "/home/meta/.local/share/nvim/lazy/lazy.nvim",
--   "/home/meta/.local/share/nvim/lazy/trouble.nvim",
--   "/home/meta/.local/share/nvim/lazy/nvim-ts-context-commentstring",
--   "/home/meta/.local/share/nvim/lazy/neo-tree.nvim",
--   "/home/meta/.local/share/nvim/lazy/friendly-snippets",
--   "/home/meta/.local/share/nvim/lazy/LuaSnip",
--   "/home/meta/.local/share/nvim/lazy/cmp_luasnip",
--   "/home/meta/.local/share/nvim/lazy/cmp-path",
--   "/home/meta/.local/share/nvim/lazy/cmp-buffer",
--   "/home/meta/.local/share/nvim/lazy/crates.nvim",
--   "/home/meta/.local/share/nvim/lazy/nvim-cmp",
--   "/home/meta/.local/share/nvim/lazy/nvim-navic",
--   "/home/meta/.local/share/nvim/lazy/nvim-web-devicons",
--   "/home/meta/.local/share/nvim/lazy/yanky.nvim",
--   "/home/meta/.local/share/nvim/lazy/todo-comments.nvim",
--   "/home/meta/.local/share/nvim/lazy/nvim-treesitter-textobjects",
--   "/home/meta/.local/share/nvim/lazy/nvim-treesitter",
--   "/home/meta/.local/share/nvim/lazy/null-ls.nvim",
--   "/home/meta/.local/share/nvim/lazy/mason-nvim-dap.nvim",
--   "/home/meta/.local/share/nvim/lazy/nvim-dap-virtual-text",
--   "/home/meta/.local/share/nvim/lazy/nvim-dap-ui",
--   "/home/meta/.local/share/nvim/lazy/one-small-step-for-vimkind",
--   "/home/meta/.local/share/nvim/lazy/nvim-dap",
--   "/home/meta/.local/share/nvim/lazy/rust-tools.nvim",
--   "/home/meta/.local/share/nvim/lazy/cmp-nvim-lsp",
--   "/home/meta/.local/share/nvim/lazy/mason-lspconfig.nvim",
--   "/home/meta/.local/share/nvim/lazy/mason.nvim",
--   "/home/meta/.local/share/nvim/lazy/neodev.nvim",
--   "/home/meta/.local/share/nvim/lazy/neoconf.nvim",
--   "/home/meta/.local/share/nvim/lazy/typescript.nvim",
--   "/home/meta/.local/share/nvim/lazy/SchemaStore.nvim",
--   "/home/meta/.local/share/nvim/lazy/nvim-lspconfig",
--   "/home/meta/.local/share/nvim/lazy/gitsigns.nvim",
--   "/home/meta/.local/share/nvim/lazy/mini.indentscope",
--   "/home/meta/.local/share/nvim/lazy/persistence.nvim",
--   "/home/meta/.local/share/nvim/lazy/nvim-notify",
--   "/home/meta/.local/share/nvim/lazy/nui.nvim",
--   "/home/meta/.local/share/nvim/lazy/mini.pairs",
--   "/home/meta/.local/share/nvim/lazy/noice.nvim",
--   "/home/meta/.local/share/nvim/lazy/mini.cursorword",
--   "/home/meta/.local/share/nvim/lazy/mini.comment",
--   "/home/meta/.local/share/nvim/lazy/bufferline.nvim",
--   "/home/meta/.local/share/nvim/lazy/plenary.nvim",
--   "/home/meta/.local/share/nvim/lazy/telescope.nvim",
--   "/home/meta/.local/share/nvim/lazy/project.nvim",
--   "/home/meta/.local/share/nvim/lazy/flash.nvim",
--   "/home/meta/.local/share/nvim/lazy/lualine.nvim",
--   "/home/meta/.local/share/nvim/lazy/mini.starter",
--   "/home/meta/.local/share/nvim/lazy/indent-blankline.nvim",
--   "/home/meta/.local/share/nvim/lazy/mini.clue",
--   "/home/meta/.local/share/nvim/lazy/tokyonight.nvim",
--   "/home/meta/.local/share/nvim/lazy/LazyVim",
--   "/usr/share/nvim/runtime",
--   "/usr/share/nvim/runtime/pack/dist/opt/matchit",
--   "/usr/lib/nvim",
--   "/home/meta/.local/state/nvim/lazy/readme",
--   "/home/meta/.local/share/nvim/lazy/cmp_luasnip/after",
--   "/home/meta/.local/share/nvim/lazy/cmp-path/after",
--   "/home/meta/.local/share/nvim/lazy/cmp-buffer/after",
--   "/home/meta/.local/share/nvim/lazy/crates.nvim/after",
--   "/home/meta/.local/share/nvim/lazy/cmp-nvim-lsp/after",
-- }
