local function list(value, str, sep)
  sep = sep or ","
  str = str or ""
  value = type(value) == "table" and table.concat(value, sep) or value
  return str ~= "" and table.concat({ value, str }, sep) or value
end

vim.lsp.set_log_level("debug")
--[[
NOTE: LOG LEVELS
  0	Disabled. Normal operation.
  1	Enables Lua tracing for assignments to options, mappings, etc. No messages are produced by the verbosity level itself.
  2	Logs sourced files and ShaDa (session/history data) reads and writes.
  3	Logs UI information and terminal capabilities.
  4	Logs shell commands executed by Neovim.
  5	Logs searched tag files and include files.
  6	No additional message category; includes lower levels.
  7	No additional message category; includes lower levels.
  8	Logs files for which an autocommand group is executed.
  9	Logs individual autocommands as they execute.
  10 No additional message category; includes lower levels.
  11 Logs the process of finding items in a path.
  12 Logs Vimscript function calls.
  13 Logs exceptions being thrown, caught, completed, or discarded.
  14 Logs pending commands in a :finally clause.
  15 Logs Ex commands from scripts, truncated to 200 characters.
  16 Logs Ex commands without the level-15 truncation.
]]

vim.opt.verbose = 4
vim.opt.verbosefile = "/tmp/nvim-verbose.log"

vim.opt.helpheight = 30
vim.opt.fillchars = {
  horiz = "─",
  horizup = "⏊",
  horizdown = "┬",
  vert = "│",
  vertleft = "┤",
  vertright = "├",
  verthoriz = "┼",
  diff = "╱",
  eob = " ",
  foldclose = "",
  foldopen = "",
  fold = " ",
  foldsep = " ",
  msgsep = "─",
}
vim.opt.guicursor = {
  "n-c-sm:block-Cursor",
  "i-ci-ve:ver25-Cursor",
  "r-cr:hor20-Cursor",
  "o-v:block-Cursor-blinkwait300-blinkon200-blinkoff150",
}
vim.opt.conceallevel = 2
vim.opt.showmode = false
vim.opt.laststatus = 3
vim.opt.mouse = "a"
vim.opt.hidden = true
vim.opt.wildignore = vim.opt.wildignore + { "**/coverage/*", "**/node_modules/*", "**/.git/*" }
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 0
vim.opt.virtualedit = list({ "block" })
vim.opt.sidescrolloff = 0
vim.opt.clipboard = "unnamed"
vim.opt.enc = "utf-8"
vim.opt.background = "dark"
vim.opt.showtabline = 0
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.belloff = "all"
vim.opt.cursorline = true
vim.opt.updatetime = 50
vim.opt.confirm = true
vim.opt.wrap = false

vim.o.foldcolumn = "auto"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.opt.spell = false
vim.opt.spellfile = "/home/metaory/.config/nvim/spell/en.utf-8.add"
vim.opt.spelllang = { "en" }
vim.opt.dictionary = "/home/metaory/.config/nvim/spell/english-dict"

vim.opt.undolevels = 10000
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.timeoutlen = 300
vim.opt.pumheight = 10
vim.opt.pumwidth = 20
vim.opt.cmdheight = 0
vim.opt.sessionoptions = "blank,buffers,curdir,folds,tabpages,winsize,winpos,terminal"
-- vim.opt.diffopt:append("vertical") -- Show diffs in vertical splits
-- vim.opt.diffopt:append("foldcolumn:0") -- Show diffs in vertical splits
-- vim.opt.diffopt:append("indent-heuristic")
vim.opt.diffopt = list({
  "algorithm:histogram",
  "internal",
  "indent-heuristic",
  "filler",
  "closeoff",
  "iwhite",
  "context:5",
  "linematch:60",
})
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.formatoptions = "jcroqlnt"

vim.opt.splitright = false
vim.opt.splitbelow = true
vim.opt.viewoptions = {
  "cursor",
  "folds",
}
vim.opt.showmatch = false
if vim.fn.executable("rg") then
  -- if ripgrep installed, use that as a grepper
  vim.opt.grepprg = "rg --vimgrep --no-heading"
  vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

vim.g.editorconfig = false
vim.g.disable_autoformat = false
vim.g.markdown_recommended_style = 0

vim.o.formatexpr = "v:lua.require'metaory.utils'.formatexpr()"
