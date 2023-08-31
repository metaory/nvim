-- if true then return {} end

return {
  "folke/noice.nvim",
  opts = function(_, opts)
    -- mxdump(vim.inspect(opts), "noice_pre")
    opts.lsp = vim.tbl_extend("force", {
      message = {
        enabled = true,
        view = "mini",
      },
      progress = {
        enabled = true,
        view = "mini",
      },
    }, opts.lsp)

    opts.commands = {
      all = {
        view = "split",
        opts = { enter = true, format = "details" },
        filter = {},
      },
    }
    -- mxdump(vim.inspect(opts), "noice_post")
    return opts
  end,
}
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

--[[
    commands = {
      history = {
        -- options for the message history that you get with `:Noice`
        view = "popup",
        opts = { enter = true, format = "details" },
        filter = {
          any = {
            { event = "notify" },
            { error = true },
            { warning = true },
            { event = "msg_show", kind = { "" } },
            { event = "lsp", kind = "message" },
          },
        },
      },
      -- :Noice last
      last = {
        view = "popup",
        opts = { enter = true, format = "details" },
        filter = {
          any = {
            { event = "notify" },
            { error = true },
            { warning = true },
            { event = "msg_show", kind = { "" } },
            { event = "lsp", kind = "message" },
          },
        },
        filter_opts = { count = 1 },
      },
      -- :Noice errors
      errors = {
        -- options for the message history that you get with `:Noice`
        view = "popup",
        opts = { enter = true, format = "details" },
        filter = { error = true },
        filter_opts = { reverse = true },
      },
    },
    notify = {
      -- Noice can be used as `vim.notify` so you can route any notification like other messages
      -- Notification messages have their level and other properties set.
      -- event is always "notify" and kind can be any log level as a string
      -- The default routes will forward notifications to nvim-notify
      -- Benefit of using Noice for this is the routing and consistent history view
      enabled = true,
      view = "notify",
    },
    lsp = {
      progress = {
        enabled = true,
        -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
        -- See the section on formatting for more details on how to customize.
        --- @type NoiceFormat|string
        format = "lsp_progress",
        --- @type NoiceFormat|string
        format_done = "lsp_progress_done",
        throttle = 1000 / 30, -- frequency to update lsp progress message
        view = "mini",
      },
      override = {
        -- override the default lsp markdown formatter with Noice
        ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
        -- override the lsp markdown formatter with Noice
        ["vim.lsp.util.stylize_markdown"] = false,
        -- override cmp documentation with Noice (needs the other options to work)
        ["cmp.entry.get_documentation"] = false,
      },
      hover = {
        enabled = true,
        silent = false, -- set to true to not show a message if hover is not available
        view = nil, -- when nil, use defaults from documentation
        ---@type NoiceViewOptions
        opts = {}, -- merged with defaults from documentation
      },
      signature = {
        enabled = true,
        auto_open = {
          enabled = true,
          trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
          luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
          throttle = 50, -- Debounce lsp signature help request by 50ms
        },
        view = nil, -- when nil, use defaults from documentation
        ---@type NoiceViewOptions
        opts = {}, -- merged with defaults from documentation
      },
      message = {
        -- Messages shown by lsp servers
        enabled = true,
        view = "notify",
        opts = {},
      },
      -- defaults for hover and signature help
      documentation = {
        view = "hover",
        ---@type NoiceViewOptions
        opts = {
          lang = "markdown",
          replace = true,
          render = "plain",
          format = { "{message}" },
          win_options = { concealcursor = "n", conceallevel = 3 },
        },
      },
    },
--
--]]
-- table.insert(opts.routes, {
--   filter = {
--     event = "lsp",
--     kind = "progress",
--     cond = function(message)
--       local client = vim.tbl_get(message.opts, "progress", "client")
--       return client == "lua_ls"
--     end,
--   },
--   opts = { skip = true },
-- })

-- opts = {
--   lsp = {
--     override = {
--       ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--       ["vim.lsp.util.stylize_markdown"] = true,
--       ["cmp.entry.get_documentation"] = true,
--     },
--   },
--   -- format = {
--   --   notify = { "{kind}", "{message}" },
--   -- },
--
--   cmdline = {
--     enabled = true, -- enables the Noice cmdline UI
--     -- config.presets.cmdline_output_to_split
--     view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
--     -- opts = {}, -- global options for the cmdline. See section on views
--     ---@type table<string, CmdlineFormat>
--     format = {
--       -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
--       -- view: (default is cmdline view)
--       -- opts: any options passed to the view
--       -- icon_hl_group: optional hl_group for the icon
--       -- title: set to anything or empty string to hide
--       cmdline = { pattern = "^:", icon = "", lang = "vim" },
--       search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
--       search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
--       filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
--       lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
--       help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
--     },
--   },
--
--   -- views = {
--   -- cmdline_popup = {
--   --   border = { style = "none", padding = { 0, 1 } },
--   --   filter_options = {},
--   --   win_options = { winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder" },
--   -- },
--   -- notify = { filter_options = { title = "zz" }, },
--   -- },
--   -- format = { notify = { "{level}" }, },
--   -- notify = { opts = { filter_options = { title = "zz" }, }, },
--   markdown = {
--     hover = {
--       ["|(%S-)|"] = vim.cmd.help, -- vim help links
--       ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
--     },
--     highlights = {
--       ["|%S-|"] = "@text.reference",
--       ["@%S+"] = "@parameter",
--       ["^%s*(Parameters:)"] = "@text.title",
--       ["^%s*(Return:)"] = "@text.title",
--       ["^%s*(See also:)"] = "@text.title",
--       ["{%S-}"] = "@parameter",
--     },
--   },
--   health = { checker = true },
--   -- redirect = { view = "popup", filter = { event = "msg_show" }, },
--   messages = {
--     enabled = true,
--     -- opts = { format = { "{kind}" } },
--     view = "mini",
--     view_error = "notify",
--     view_warn = "notify",
--     view_history = "messages", -- view for :messages
--     view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
--   },
--   routes = {
--     {
--       view = "split",
--       filter = { event = "msg_show", min_height = 2 },
--     },
--     -- { view = "notify", filter = { event = "msg_show" } },
--     -- { view = "notify", filter = { event = "msg_show", kind = "" } },
--     -- { opts = { stop = true }, filter = { event = "msg_show" } },
--     -- {
--     --   filter = {
--     --     event = "msg_show",
--     --     any = {
--     --       { find = "%d+L, %d+B" },
--     --       { find = "; after #%d+" },
--     --       { find = "; before #%d+" },
--     --     },
--     --   },
--     --   view = "mini",
--     -- },
--   },
--   --     view = "notify",
--   --     filter = {
--   --       event = "msg_show",
--   --       -- error = true,
--   --       -- warning = false,
--   --       -- kind = {},
--   --       -- ["not"] = { kind = { "search_count" } },
--   --     },
--   --   },
--   -- },
--   --   {
--   --     view = "split",
--   --     filter = { event = "msg_show", min_height = 2 },
--   --   },
--   -- {
--   --   filter = {
--   --     event = "msg_show",
--   --     -- max_length = 10,
--   --     -- max_height = 10,
--   --     -- max_width = 2,
--   --     -- has = true,
--   --     -- any = {
--   --     --   { find = "%d+L, %d+B" },
--   --     --   { find = "; after #%d+" },
--   --     --   { find = "; before #%d+" },
--   --     -- },
--   --     ["not"] = { kind = { "search_count", "echo" } },
--   --   },
--   --   view = "mini",
--   -- },
--   -- {
--   --   filter = {
--   --     event = "msg_show",
--   --     -- min_width = 1,
--   --     min_length = 2,
--   --     -- min_length = 1,
--   --     ["not"] = { kind = { "echoerr" } },
--   --   },
--   --   view = "split",
--   -- },
--   -- },
--   presets = {
--     bottom_search = true,
--     command_palette = true,
--     long_message_to_split = true,
--     -- inc_rename = true,
--     -- lsp_doc_border = true,
--   },
--   -- views = { cmdline_popup = { border = { style = "none", padding = { 0, 1 }, }, filter_options = {}, win_options = { winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder", }, }, },
-- },
