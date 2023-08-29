-- set wildignore=*.o,*.a,__pycache__
-- vim.opt.wildignore = { '*.o', '*.a', '__pycache__' }

vim.g.mapleader = " "

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
  pattern = {
    -- [".*/%.vscode/.*%.json"] = "json5",
    -- ["Dockerfile-.*"] = "dockerfile",
    -- [".*/%.vscode/.*%.json"] = "json5",
  },
})

vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- vim.go.autochdir = false

vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldcolumn = "0"

vim.opt.backup = true
vim.opt.cmdheight = 0
vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"

if vim.g.neovide then
  vim.opt.guifont = { "FiraCode Nerd Font Mono", "h9" }
  vim.g.neovide_scale_factor = 0.3
end

vim.opt.clipboard = "unnamed" -- Sync with system clipboard
vim.opt.scrolloff = 0 -- Lines of context
vim.opt.cursorcolumn = true
vim.opt.laststatus = 3
vim.opt.colorcolumn = "80"
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
