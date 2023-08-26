-- if true then return {} end

return {
  "folke/noice.nvim",
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
    },
  },
  -- opts = function(_, opts)
  --   table.insert(opts.routes, {
  --     filter = {
  --       event = "notify",
  --       find = "No information available",
  --     },
  --     opts = { skip = true },
  --   })
  --   local focused = true
  --   vim.api.nvim_create_autocmd("FocusGained", {
  --     callback = function()
  --       focused = true
  --     end,
  --   })
  --   vim.api.nvim_create_autocmd("FocusLost", {
  --     callback = function()
  --       focused = false
  --     end,
  --   })
  --
  --   table.insert(opts.routes, {
  --     filter = {
  --       event = "lsp",
  --       kind = "progress",
  --       cond = function()
  --         return not focused
  --       end,
  --     },
  --     opts = { skip = true },
  --   })
  --
  --   table.insert(opts.routes, {
  --     filter = {
  --       cond = function()
  --         return not focused
  --       end,
  --     },
  --     view = "notify_send",
  --     opts = { stop = false },
  --   })
  --
  --   table.insert(opts.routes, {
  --     view = "split",
  --     filter = { event = "msg_show", min_height = 20 },
  --   })
  --
  --   table.insert(opts.routes, {
  --     view = "notify",
  --     filter = { event = "msg_showmode" },
  --   })
  --
  --   opts.commands = {
  --     all = {
  --       view = "split",
  --       opts = { enter = true, format = "details" },
  --       filter = {},
  --     },
  --   }
  --
  --   vim.api.nvim_create_autocmd("FileType", {
  --     pattern = "markdown",
  --     callback = function(event)
  --       vim.schedule(function()
  --         require("noice.text.markdown").keys(event.buf)
  --       end)
  --     end,
  --   })
  -- end,
}
