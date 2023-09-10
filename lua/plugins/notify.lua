-- INFO: <M-c> | <LEADER> un

return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>un",
      '<CMD>lua require("notify").dismiss({ silent = true, pending = true })<CR>',
      desc = "Dismiss all Notifications",
    },
  },
  opts = function(_, opts)
    return vim.tbl_deep_extend("force", opts, {
      timeout = 3000,
      background_colour = "#000000",
      max_height = function()
        return math.floor(vim.o.lines * 0.80)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    })
  end,
}
