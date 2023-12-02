vim.g.debug_global_flag = false
require("util.debug")

vim.lsp.set_log_level(vim.log.levels[vim.g.debug_global_flag and "DEBUG" or "WARN"])

vim.loader.enable()

require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.commands")
require("config.autocmds")
-- require("user.theme").setup()

require("util.helper").lazy_notify()
