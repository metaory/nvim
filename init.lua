vim.g.debug_global_flag = false

vim.lsp.set_log_level(vim.lsp.log_levels[vim.g.debug_global_flag and "DEBUG" or "WARN"])

vim.loader.enable()

require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.commands")
require("config.autocmds")

require("util.helper").lazy_notify()
require("util.debug")
