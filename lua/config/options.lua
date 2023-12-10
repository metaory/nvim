-- vim.cmd("filetype indent plugin off")
vim.cmd("filetype plugin indent off") -- https://neovim.io/doc/user/filetype.html#:~:text=Overview%3A-,%3Afiletype%2Doverview,-command%09%09%09%09detection%09plugin

-- lua vim.lsp.buf_attach_client(1)
-- XXX: ==>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
vim.opt.autowrite = true -- Enable auto write
-- vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 3 -- Hide * markup for bold and italic
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.formatoptions = "jcroqlnt" -- tcqj
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true -- Ignore case
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.laststatus = 0
vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.number = true -- Print line number
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.scrolloff = 4 -- Lines of context
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.shortmess:append({ W = true, I = true, c = true })
vim.opt.showmode = false -- Dont show mode since we have a statusline
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.spelllang = { "en" }
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.termguicolors = true -- True color support
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200 -- Save swap file and trigger CursorHold
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.winminwidth = 5 -- Minimum window width
vim.opt.wrap = false -- Disable line wrap
vim.opt.splitkeep = "screen"
vim.opt.shortmess:append({ C = true })
vim.g.markdown_recommended_style = 0
-- XXX: ==<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

vim.opt.list = true
vim.opt.fillchars = { foldopen = "", foldclose = "", fold = " ", foldsep = " ", diff = "╱", eob = " " }
-- XXX:
-- vim.opt.updatetime = 2000

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
    [".zsh-theme"] = "bash",
    [".zalias"] = "bash",
    [".zshrc"] = "bash",
    [".nvimrc"] = "lua",
    ["Dockerfile"] = "dockerfile",
    ["tsconfig.json"] = "jsonc",
  }, -- ["kitty.conf"] = "kitty", ["picom.conf"] = "config", -- "toml",
  -- pattern = { [".*/%.vscode/.*%.json"] = "json5", ["Dockerfile-.*"] = "dockerfile", [".*/%.vscode/.*%.json"] = "json5", },
})

-- vim.opt.commentstring = "# %s" -- BUG: <<<

vim.opt.cmdheight = 0

vim.o.verbosefile = vim.fn.stdpath("state") .. "/log"

vim.o.spell = false
vim.o.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("state") .. "/undo"

vim.o.backup = true
vim.o.backupdir = vim.fn.stdpath("state") .. "/backup"

vim.opt.clipboard = "unnamed" -- NOTE: <<<
vim.opt.scrolloff = 0 -- NOTE: <<<
vim.opt.cursorcolumn = true
vim.opt.laststatus = 3 -- NOTE: <<<

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
