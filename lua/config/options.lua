-- vim.cmd("filetype indent plugin off")
vim.cmd("filetype plugin indent off") -- https://neovim.io/doc/user/filetype.html#:~:text=Overview%3A-,%3Afiletype%2Doverview,-command%09%09%09%09detection%09plugin
vim.opt.list = true
vim.opt.fillchars = { foldopen = "", foldclose = "", fold = " ", foldsep = " ", diff = "╱", eob = " " }
vim.opt.updatetime = 2000

-- vim.g.ft_ignore_path = [[\.\(Z\|gz\|bz2\|zip\|tgz\)$]]
vim.o.foldmethod = "indent"
vim.o.foldenable = false
-- vim.opt.autoindent = false
-- vim.opt.smartindent = false

vim.filetype.add({
  extension = {
    cconf = "python",
    conf = "config",
    frag = "glsl",
    tmux = "tmux",
    tmuxtheme = "tmux",
  }, -- jsx = "javascript.jsx", ["js.flow"] = "javascript.jsx", norg = "norg", rbi = "ruby", tsx = "typescript.tsx",
  filename = {
    [".zalias"] = "zsh",
    [".nvimrc"] = "lua",
    ["Dockerfile"] = "dockerfile",
    ["tsconfig.json"] = "jsonc",
  }, -- ["kitty.conf"] = "kitty", ["picom.conf"] = "config", -- "toml",
  -- pattern = { [".*/%.vscode/.*%.json"] = "json5", ["Dockerfile-.*"] = "dockerfile", [".*/%.vscode/.*%.json"] = "json5", },
})

vim.opt.commentstring = "# %s"

vim.opt.cmdheight = 0

vim.o.verbosefile = vim.fn.stdpath("state") .. "/log"

vim.o.spell = false
vim.o.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("state") .. "/undo"

vim.o.backup = true
vim.o.backupdir = vim.fn.stdpath("state") .. "/backup"

vim.opt.clipboard = "unnamed"
vim.opt.scrolloff = 0
vim.opt.cursorcolumn = true
vim.opt.laststatus = 3

vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_node_provider = 0

-- vim.opt.timeout = false
-- vim.opt.timeoutlen = 300

-- set wildignore=*.o,*.a,__pycache__
-- vim.opt.wildignore = { '*.o', '*.a', '__pycache__' }
-- vim.opt.listchars = { eol = "⌐", tab = "ᐧᐧᐧ", trail = "~", extends = "»", precedes = "«", }

-- vim.go.autochdir = false
-- vim.opt.backup = true

-- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = true
-- vim.o.foldcolumn = "0"

-- if vim.g.neovide then
--   vim.opt.guifont = { "FiraCode Nerd Font Mono", "h9" }
--   vim.g.neovide_scale_factor = 0.3
-- end
-- vim.opt.colorcolumn = "80"

-- vim.g.node_host_prog = "/Users/folke/.pnpm-global/5/node_modules/neovim/bin/cli.js"

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
