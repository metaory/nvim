local util = require("lspconfig.util")

return {
  init_options = {
    typescript = {},
  },
  before_init = function(_, config)
    local typescript = config.init_options and config.init_options.typescript
    if not typescript or typescript.tsdk then
      return
    end
    typescript.tsdk = util.get_typescript_server_path(config.root_dir)
    if typescript.tsdk == "" and vim.g.tsdk then
      typescript.tsdk = vim.g.tsdk
    end
  end,
}
