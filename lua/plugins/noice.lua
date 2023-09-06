-- INFO: https://github.com/folke/noice.nvim/wiki/A-Guide-to-Messages
-- local Config = require("noice.config")

-- if true then return {} end

return {
  "folke/noice.nvim",
  keys = {
    {
      "<S-Enter>",
      function()
        require("noice").redirect(vim.fn.getcmdline())
      end,
      mode = "c",
      desc = "Redirect Cmdline",
    },
  },
  opts = function(_, opts)
    -- ddwrite(opts, "noice_pre")

    opts.lsp = vim.tbl_deep_extend("force", {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      message = { enabled = true, view = "notify", opts = {} },
      progress = { enabled = true, view = "mini" },
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
    }, opts.lsp)

    opts.commands = { all = { view = "split", opts = { enter = true, format = "details" }, filter = {} } }

    -- opts.notify = { enabled = true, view = "notify" }

    -- opts.redirect = {view = "popup", filter = { event = "msg_show" },}

    -- opts.messages = {
    --   enabled = true,
    --   view = "mini", -- opts = { format = { "{kind}" } },
    --   view_error = "notify",
    --   view_warn = "notify",
    --   view_history = "messages", -- view for :messages
    --   view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    -- }

    -- opts.nui = {win_options = {winhighlight = {FloatBorder = "DiagnosticError", Normal = "Constant",},},}

    -- table.remove(opts.routes, 1)
    -- { find = "E486:" },
    -- { find = "at TOP" },
    table.insert(opts.routes[1].filter.any, { find = "^E486:" })
    table.insert(opts.routes[1].filter.any, { find = "at TOP" })

    -- table.insert(opts.routes, {
    --   filter = {
    --     event = "msg_show",
    --     any = {
    --       -- { min_height = 2 },
    --       -- { min_length = 100 },
    --       -- { cmdline = true },
    --       -- { find = "\\<%w\\>" },
    --     },
    --     -- ["not"] = { kind = { "confirm" } },
    --   },
    --   view = "split",
    -- })
    -- table.insert(opts.routes, {
    --   filter = {
    --     event = "msg_show",
    --     ["not"] = { kind = { "confirm" } },
    --   },
    --   -- stop = false,
    --   view = "messages",
    -- })
    -- table.insert(opts.routes, {
    --   filter = {
    --     event = "msg_show",
    --     any = {
    --       { cmdline = true },
    --     },
    --   },
    --   view = "popup",
    -- })

    --   XXX:
    --    {
    --      view = Config.options.notify.view,
    --      filter = {
    --        event = "noice",
    --        kind = { "stats", "debug" },
    --      },
    --      opts = { lang = "lua", replace = true, title = "Noice" },
    --    },
    table.insert(opts.routes, {
      filter = {
        event = "notify",
        any = {
          { min_height = 10 },
          { min_width = 100 },
          -- { find = "^{+" },
        },
      },
      view = "split",
    })
    table.insert(opts.routes, { -- TODO:
      filter = {
        event = "notify",
        any = {
          {
            max_height = 2,
            max_width = 90,
            ["not"] = { find = "^{+" },
          },
        },
        ["not"] = { error = true },
      },
      view = "mini",
    })
    -- table.insert(opts.routes, { filter = {event = "notify",}, view = "notify",})
    -- ddwrite(opts, "noice_x")
    -- return opts
  end,
}
-- ["not"] = { find = "<%w>+" },
-- ["not"] = { find = "^{+" },
-- error = false,
-- ["not"] = { error = true },
-- , warning = false,
-- ["not"] = { kind = { "ERROR", vim.log.levels.ERROR, tostring(vim.log.levels.ERROR) } },
-- { min_height = 4, error = true },
-- table.insert(opts.routes, {
--   -- filter = { event = "msg_show", kind = "search_count" },
--   -- filter = { event = "msg_show", kind = "search_count" },
--   opts = { skip = true },
--   -- view = "mini",
-- })

-- table.insert(opts.routes, {
--   filter = { event = "notify", any = { { min_height = 20 } } },
--   view = "split",
-- })
-- { find = "^{+" },
-- { find = "^{+" },
-- { find = "%d+L, %d+B" },
-- { find = "; before #%d+" },
-- { find = "; after #%d+" },
-- │1 line less; after #178  13:38:56
-- table.insert(opts.routes[1].filter.any, { find = ";AUTOCMD #%d+", kind = "" })
-- opts.routes = nil
-- opts.routes = {
-- table.insert(opts.routes, {
--   filter = { event = "notify", kind = tostring(vim.log.levels.ERROR) },
--   opts = { skip = true },
-- })
-- any = {
-- { kind = tostring(vim.log.levels.INFO) },
-- { find = ";AUTOCMD #%d+", kind = vim.log.levels.WARN },
-- },
-- kind = "ERROR",
-- find = "AUTOCMD",
-- { kind = vim.log.levels.ERROR },
-- { kind = tostring(vim.log.levels.ERROR) },
-- { kind = "ERROR" },
-- { warning = true },
-- min_height = 10,
-- ["not"] = { kind = { "ERROR", "3", "echo" } },
-- kind = tostring(vim.log.levels.ERROR),
-- opts = {}
-- table.insert(opts.routes, {
--   filter = {
--     find = ";AUTOCMD #%d+",
--     event = "notify",
--   },
--   view = "notify",
-- })
-- }
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

-- INFO:
-- local opts = {
--   {
--     view = Config.options.cmdline.view,
--     opts = Config.options.cmdline.opts,
--     filter = { event = "cmdline" },
--   },
--   {
--     view = "confirm",
--     filter = {
--       any = {
--         { event = "msg_show", kind = "confirm" },
--         { event = "msg_show", kind = "confirm_sub" },
--         -- { event = "msg_show", kind = { "echo", "echomsg", "" }, before = true },
--         -- { event = "msg_show", kind = { "echo", "echomsg" }, instant = true },
--         -- { event = "msg_show", find = "E325" },
--         -- { event = "msg_show", find = "Found a swap file" },
--       },
--     },
--   },
--   {
--     view = Config.options.messages.view_history,
--     filter = {
--       any = {
--         { event = "msg_history_show" },
--         -- { min_height = 20 },
--       },
--     },
--   },
--   {
--     view = Config.options.messages.view_search,
--     filter = {
--       event = "msg_show",
--       kind = "search_count",
--     },
--   },
--   {
--     filter = {
--       any = {
--         { event = { "msg_showmode", "msg_showcmd", "msg_ruler" } },
--         { event = "msg_show", kind = "search_count" },
--       },
--     },
--     opts = { skip = true },
--   },
--   {
--     view = Config.options.messages.view,
--     filter = {
--       event = "msg_show",
--       kind = { "", "echo", "echomsg" },
--     },
--     opts = { replace = true, merge = true, title = "Messages" },
--   },
--   {
--     view = Config.options.messages.view_error,
--     filter = { error = true },
--     opts = { title = "Error" },
--   },
--   {
--     view = Config.options.messages.view_warn,
--     filter = { warning = true },
--     opts = { title = "Warning" },
--   },
--   {
--     view = Config.options.notify.view,
--     filter = { event = "notify" },
--     opts = { title = "Notify" },
--   },
--   {
--     view = Config.options.notify.view,
--     filter = {
--       event = "noice",
--       kind = { "stats", "debug" },
--     },
--     opts = { lang = "lua", replace = true, title = "Noice" },
--   },
--   {
--     view = Config.options.lsp.progress.view,
--     filter = { event = "lsp", kind = "progress" },
--   },
--   {
--     view = Config.options.lsp.message.view,
--     opts = Config.options.lsp.message.opts,
--     filter = { event = "lsp", kind = "message" },
--   },
-- }
