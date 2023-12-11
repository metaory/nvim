vim.g.debug_global_flag = false

vim.lsp.set_log_level(vim.log.levels[vim.g.debug_global_flag and "DEBUG" or "INFO"]) -- WARN

vim.loader.enable()

require("util.debug")
require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.commands")
require("config.autocmds")
-- require("user.theme").setup()

require("util.helper").lazy_notify()
