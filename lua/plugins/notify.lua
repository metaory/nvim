-- INFO: <M-c> | <LEADER> un

return {
  "rcarriga/nvim-notify",
  lazy = false,
  keys = {
    {
      "<leader>un",
      '<CMD>lua require("notify").dismiss({ silent = true, pending = true })<CR>',
      desc = "Dismiss all Notifications",
    },
  },
  opts = {
    timeout = 3000,
    background_colour = "#000000",
    max_height = function()
      return math.floor(vim.o.lines * 0.80)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
  },
  init = function()
    -- local Util = require("lazyvim.util")
    -- if not Util.has("noice.nvim") then
    -- Util.on_very_lazy(function()
    vim.notify = require("notify")
    -- end)
    -- end
  end,
}
