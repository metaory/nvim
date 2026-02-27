vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.do_filetype_lua = 1
vim.g.vim_json_conceal = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.projects_dir = vim.env.HOME .. "/dev"
vim.g.work_projects_dir = vim.env.HOME .. "/dev/port"

require("metaory.lazy")
require("metaory.options")
require("metaory.keymaps")
require("metaory.autocmd")
require("metaory.winbar")
