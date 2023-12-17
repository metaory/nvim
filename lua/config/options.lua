-- vim.cmd("filetype indent plugin off")
-- vim.cmd("filetype plugin indent off") -- https://neovim.io/doc/user/filetype.html#:~:text=Overview%3A-,%3Afiletype%2Doverview,-command%09%09%09%09detection%09plugin

vim.filetype.add({
  extension = {
    cconf = "python",
    conf = "config",
    frag = "glsl",
    tmux = "tmux",
    tmuxtheme = "tmux",
    ["zsh-theme"] = "bash",
    -- zsh = "bash",
    sh = "bash",
  }, -- jsx = "javascript.jsx", ["js.flow"] = "javascript.jsx", norg = "norg", rbi = "ruby", tsx = "typescript.tsx",
  filename = {
    -- ["config"] = "bash",
    [".zprofile"] = "bash",
    [".zalias"] = "bash",
    [".zshrc"] = "zsh",
    [".nvimrc"] = "lua",
    ["Dockerfile"] = "dockerfile",
    ["tsconfig.json"] = "jsonc",
  }, -- ["kitty.conf"] = "kitty", ["picom.conf"] = "config", -- "toml",
  -- pattern = { [".*/%.vscode/.*%.json"] = "json5", ["Dockerfile-.*"] = "dockerfile", [".*/%.vscode/.*%.json"] = "json5", },
})

vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.spelllang = { "en" }
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.fillchars = { foldopen = "", foldclose = "", fold = " ", foldsep = " ", diff = "╱", eob = " " }
-- lua vim.lsp.buf_attach_client(1)
-- XXX: ==>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- vim.opt.syntax = "help" -- Enable auto write
-- vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.o.clipboard = "unnamed" -- NOTE: <<<
vim.o.scrolloff = 0 -- NOTE: <<<
vim.o.cursorcolumn = true
vim.o.laststatus = 3 -- NOTE: <<<
vim.o.cmdheight = 0
vim.o.autowrite = true -- Enable auto write
vim.o.conceallevel = 3 -- Hide * markup for bold and italic
vim.o.confirm = true -- Confirm to save changes before exiting modified buffer
vim.o.cursorline = true -- Enable highlighting of the current line
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.formatoptions = "jcroqlnt" -- tcqj
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.grepprg = "rg --vimgrep"
vim.o.ignorecase = true -- Ignore case
vim.o.inccommand = "nosplit" -- preview incremental substitute
vim.o.laststatus = 0
vim.o.list = true -- Show some invisible characters (tabs...
vim.o.mouse = "a" -- Enable mouse mode
vim.o.number = true -- Print line number
vim.o.pumblend = 10 -- Popup blend
vim.o.pumheight = 10 -- Maximum number of entries in a popup
vim.o.relativenumber = true -- Relative line numbers
vim.o.scrolloff = 4 -- Lines of context
vim.o.shiftround = true -- Round indent
vim.o.shiftwidth = 2 -- Size of an indent
vim.o.showmode = false -- Dont show mode since we have a statusline
vim.o.sidescrolloff = 8 -- Columns of context
vim.o.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.smartcase = true -- Don't ignore case with capitals
vim.o.smartindent = true -- Insert indents automatically
vim.o.splitbelow = true -- Put new windows below current
vim.o.splitright = true -- Put new windows right of current
vim.o.tabstop = 2 -- Number of spaces tabs count for
vim.o.termguicolors = true -- True color support
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.updatetime = 200 -- Save swap file and trigger CursorHold
vim.o.wildmode = "longest:full,full" -- Command-line completion mode
vim.o.winminwidth = 5 -- Minimum window width
vim.o.wrap = false -- Disable line wrap
vim.o.splitkeep = "screen"
-- vim.opt.shortmess:append({ C = true })
vim.g.markdown_recommended_style = 0
-- XXX: ==<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

vim.o.list = true
-- XXX:
-- vim.opt.updatetime = 2000

-- vim.o.inccommand = "split"
-- vim.g.ft_ignore_path = [[\.\(Z\|gz\|bz2\|zip\|tgz\)$]]
vim.o.title = true
vim.o.ruler = true
vim.o.foldmethod = "indent"
vim.o.foldenable = false
-- vim.opt.autoindent = false
-- vim.opt.smartindent = false

-- vim.opt.commentstring = "# %s" -- BUG: <<<

vim.o.verbosefile = vim.fn.stdpath("state") .. "/log"

vim.o.spell = false
vim.o.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("state") .. "/undo"

vim.o.backup = true
vim.o.backupdir = vim.fn.stdpath("state") .. "/backup"

vim.o.shadafile = vim.fn.stdpath("state") .. "/main.shada"
-- vim.opt.shadafile = vim.fn.expand "$HOME" .. "/.local/share/nvim/shada/main.shada"
-- /home/meta/.local/state/nvim/shada/main.shada

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
