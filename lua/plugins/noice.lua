-- INFO: <S-Enter>

-- https://github.com/WhoIsSethDaniel/dotfiles/blob/4478cc6d548e87b93283f1a40b29500bfbb875f6/.config/nvim/lua/plugins/noice-nvim.lua

-- stylua: ignore
local popup_format = { "{level} ", "{date} ", "{event}", { "{kind}", before = { ".", hl_group = "NoiceFormatKind" } }, " ",
  "{title} ", "{cmdline} ", "\n", "{message}" }

return {
  "folke/noice.nvim",
  keys = {
    -- stylua: ignore
    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline", },
  },
  opts = {
    health = { checker = true },
    lsp = {
      override = {
        -- ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        -- ["vim.lsp.util.stylize_markdown"] = true,
        -- ["cmp.entry.get_documentation"] = true,

        -- override the default lsp markdown formatter with Noice
        ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
        -- override the lsp markdown formatter with Noice
        ["vim.lsp.util.stylize_markdown"] = false,
        -- override cmp documentation with Noice (needs the other options to work)
        ["cmp.entry.get_documentation"] = false,
      },
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
      opts = {}, -- merged with defaults from documentation
    },
    -- defaults for hover and signature help
    documentation = {
      view = "hover",
      opts = {
        lang = "markdown",
        replace = true,
        render = "plain",
        format = { "{message}" },
        win_options = { concealcursor = "n", conceallevel = 3 },
      },
    },

    -- table.insert(opts.routes[1].filter.any, { find = "^E486:" })
    -- table.insert(opts.routes[1].filter.any, { find = "at TOP" })
    cmdline = {
      enabled = true, -- enables the Noice cmdline UI
      view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
      opts = {}, -- global options for the cmdline. See section on views
      format = {
        -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
        -- view: (default is cmdline view)
        -- opts: any options passed to the view
        -- icon_hl_group: optional hl_group for the icon
        -- title: set to anything or empty string to hide
        cmdline = { pattern = "^:", icon = "", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
        lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
        input = {}, -- Used by input()
        -- lua = false, -- to disable a format, set to `false`
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
            -- { find = "^{+" },
            -- { find = "}" },
            -- { error = true },
            -- { find = "^true" } },
            -- { find = "^false" } },
            -- { find = "<%w>+" },
            -- { find = "^{+" },
            -- error = false,
            -- { error = true },
            -- , warning = false,
            -- { kind = { "ERROR", vim.log.levels.ERROR, tostring(vim.log.levels.ERROR) } },
          },
        },
        view = "mini",
      },
      {
        filter = {
          event = "msg_show",
          any = {
            -- { find = "^{+" },
            { find = "}" },
            -- { find = "You selected" },
            -- { error = true },
            -- { find = "^true" } },
            -- { find = "^false" } },
            -- { find = "<%w>+" },
            -- { find = "^{+" },
            -- error = false,
            -- { error = true },
            -- , warning = false,
            -- { kind = { "ERROR", vim.log.levels.ERROR, tostring(vim.log.levels.ERROR) } },
          },
        },
        opts = { format = popup_format, win_options = { wrap = false } },
        view = "popup",
      },
      {
        filter = { event = "notify", any = { { min_length = 200 }, { min_height = 2 } } },
        opts = { format = popup_format, win_options = { wrap = true } },
        view = "popup",
      },
      { filter = { event = "notify" }, view = "notify" },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    commands = { all = { view = "split", opts = { enter = true, format = "details" }, filter = {} } },
    views = {
      popup = {
        size = { width = "70%", height = "50%" },
        format = { "{message}" },
        buf_options = { buftype = "nofile", filetype = "lua" },
        win_options = { wrap = false },
      },
      notify = {
        buf_options = { buftype = "nofile", filetype = "lua" },
        win_options = { wrap = false },
        -- replace = true,
      },
      split = {
        buf_options = { buftype = "nofile", filetype = "lua" },
        win_options = { wrap = false },
      },
      hover = {
        border = { style = "rounded" },
        size = { max_width = 80 },
      },
    },
  },
}

-- XXX: >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- XXX: <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

-- opts.format = {my_full = { "{level} ", "{date} ", "{event}", { "{kind}", before = { ".", hl_group = "NoiceFormatKind" } }, " ", "{title} ", "{cmdline} ", "\n", "{message}", },}

-- table.insert(opts.routes, {filter = {event = "notify", any = {{warn = true}, {error = true}},}, view = "notify",})

-- table.insert(opts.routes, {
--   filter = {
--     event = "notify",
--     any = {
--       { max_height = 2, max_width = 90, error = false, warning = false, ["not"] = { find = "^true" } },
--     },
--   },
--   view = "mini",
-- })
-- ["not"] = { find = "^{+" },
-- ["not"] = { error = true },
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
-- table.insert(opts.routes, {
--   filter = {
--     event = "notify",
--     any = {
--       { min_height = 10 },
--       { min_width = 100 },
--       -- { find = "^{+" },
--     },
--   },
--   view = "split",
-- })

-- INFO: DEFAULT VIEWS

-- opts.views = {
-- popupmenu = {
--   relative = "editor",
--   zindex = 65,
--   position = "auto", -- when auto, then it will be positioned to the cmdline or cursor
--   size = { width = "auto", height = "auto", max_height = 20, min_width = 10 },
--   win_options = {
--     winbar = "",
--     foldenable = false,
--     cursorline = true,
--     cursorlineopt = "line",
--     winhighlight = {Normal = "NoicePopupmenu", FloatBorder = "NoicePopupmenuBorder", CursorLine = "NoicePopupmenuSelected", PmenuMatch = "NoicePopupmenuMatch",},
--   },
--   border = { padding = { 0, 1 } },
-- },
-- cmdline_popupmenu = { view = "popupmenu", zindex = 200 },
-- virtualtext = { backend = "virtualtext", format = { "{message}" }, hl_group = "NoiceVirtualText" },
-- notify = {
--   backend = "notify",
--   fallback = "mini",
--   format = "notify",
--   replace = false,
--   merge = false,
-- },
-- split = {
--   backend = "split",
--   enter = false,
--   relative = "editor",
--   position = "bottom",
--   size = "20%",
--   close = {keys = { "q" },},
--   win_options = { winhighlight = { Normal = "NoiceSplit", FloatBorder = "NoiceSplitBorder" }, wrap = false },
-- },
-- messages = { view = "split", enter = true },
-- vsplit = { view = "split", position = "right" },
-- hover = {
--   view = "popup",
--   relative = "cursor",
--   zindex = 45,
--   enter = false,
--   anchor = "auto",
--   size = { width = "auto", height = "auto", max_height = 20, max_width = 120 },
--   border = { style = "none", padding = { 0, 2 } },
--   position = { row = 1, col = 0 },
--   win_options = { wrap = true, linebreak = true },
-- },
-- popup = {
--   backend = "popup",
--   relative = "editor",
--   close = {events = { "BufLeave" }, keys = { "q" },},
--   enter = true,
--   border = {style = "rounded",},
--   position = "50%",
--   size = { width = "70%", height = "50%" },
--   position = { row = "50%", col = "50%" },
--   win_options = {winhighlight = { Normal = "NoicePopup", FloatBorder = "NoicePopupBorder" }, winbar = "", foldenable = false,},
-- },
-- cmdline_output = { format = "details", view = "popup" },
-- cmdline = {
--   backend = "popup",
--   relative = "editor",
--   position = { row = "100%", col = 0 },
--   size = { height = "auto", width = "100%" },
--   border = { style = "none" },
--   win_options = { winhighlight = { Normal = "NoiceCmdline", IncSearch = "", CurSearch = "", Search = "" } },
-- },
-- cmdline_popup = {
--   backend = "popup",
--   relative = "editor",
--   focusable = false,
--   enter = false,
--   zindex = 200,
--   position = { row = "50%", col = "50%" },
--   size = { min_width = 60, width = "auto", height = "auto" },
--   border = { style = "rounded", padding = { 0, 1 } },
--   win_options = {
--     winhighlight = {
--       Normal = "NoiceCmdlinePopup",
--       FloatTitle = "NoiceCmdlinePopupTitle",
--       FloatBorder = "NoiceCmdlinePopupBorder",
--       IncSearch = "",
--       CurSearch = "",
--       Search = "",
--     },
--     winbar = "",
--     foldenable = false,
--     cursorline = false,
--   },
-- },
-- confirm = {
--   backend = "popup",
--   relative = "editor",
--   focusable = false,
--   align = "center",
--   enter = false,
--   zindex = 210,
--   format = { "{confirm}" },
--   position = { row = "50%", col = "50%" },
--   size = "auto",
--   border = { style = "rounded", padding = { 0, 1 }, text = { top = " Confirm " } },
--   win_options = {
--     winhighlight = { Normal = "NoiceConfirm", FloatBorder = "NoiceConfirmBorder" },
--     winbar = "",
--     foldenable = false,
--   },
-- },
-- mini = {
--  backend = "mini",
--  relative = "editor",
--  align = "message-right",
--  timeout = 2000,
--  reverse = true,
--  focusable = false,
--  position = { row = -1, col = "100%" }, -- col = 0,
--  size = "auto",
--  border = { style = "none" },
--  zindex = 60,
--  win_options = {winbar = "", foldenable = false, winblend = 30, winhighlight = { Normal = "NoiceMini", IncSearch = "", CurSearch = "", Search = "" },},
-- },
-- }
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "markdown",
--   callback = function(event)
--     vim.schedule(function()
--       vim.notify("NOW!!!!!!!!!!1")
--       require("noice.text.markdown").keys(event.buf)
--     end)
--   end,
-- })

-- opts.commands = { all = { view = "split", opts = { enter = true, format = "details" }, filter = {} } }

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
-- opts.markdown = {
--   hover = {
--     ["|(%S-)|"] = vim.cmd.help, -- vim help links
--     ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
--   },
--   highlights = {
--     ["|%S-|"] = "@text.reference",
--     ["@%S+"] = "@parameter",
--     ["^%s*(Parameters:)"] = "@text.title",
--     ["^%s*(Return:)"] = "@text.title",
--     ["^%s*(See also:)"] = "@text.title",
--     ["{%S-}"] = "@parameter",
--   },
-- }
-- opts.cmdline = {
--   enabled = true, -- enables the Noice cmdline UI
--   view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
--   opts = {}, -- global options for the cmdline. See section on views
--   format = {
--     -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
--     -- view: (default is cmdline view)
--     -- opts: any options passed to the view
--     -- icon_hl_group: optional hl_group for the icon
--     -- title: set to anything or empty string to hide
--     cmdline = { pattern = "^:", icon = "", lang = "vim" },
--     search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
--     search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
--     filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
--     lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
--     help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
--     input = {}, -- Used by input()
--   },
-- }

-- opts.lsp = vim.tbl_deep_extend("force", {
--   --   -- message = { enabled = true, view = "notify", opts = {} },
--   --   -- progress = { enabled = true, view = "mini" },
--   hover = { enabled = true, silent = false, view = nil, opts = {} },
--   signature = {enabled = true, auto_open = { enabled = true, trigger = true, luasnip = true, throttle = 50 }, view = nil, opts = {},},
--   documentation = {view = "hover", opts = {lang = "markdown", replace = true, render = "plain", format = { "{message}" }, win_options = { concealcursor = "n", conceallevel = 3 },},},
-- }, opts.lsp)
-- opts.popupmenu = { enabled = true, backend = "nui", kind_icons = {} } ---@type 'nui'|'cmp'
-- opts.format = {
--   default = { "{level} ", "{title} ", "{message}" },
--   notify = { "xo{message}{message}" },
--   foo_format = { "{message}" },
-- }
-- opts = { format = { "xo" } },

-- opts.lsp = vim.tbl_deep_extend("force", {
--   progress = {
--     enabled = true,
--     format = "lsp_progress",
--     format_done = "lsp_progress_done",
--     throttle = 1000 / 30,
--     view = "mini",
--   },
-- }, opts.lsp)
-- opts = {
--   title = "XOtify",
--   on_open = function(win)
--     local buf = vim.api.nvim_win_get_buf(win)
--     if not pcall(vim.treesitter.start, buf, "vim") then
--       vim.bo[buf].filetype = "vim"
--     end
--     ddwrite(win, "XOOXOXO")
--   end,
-- },

-- XXX: vim.treesitter.language.require_language

-- TEST:
-- table.insert(opts.routes, {
--   filter = {
--     event = "lsp",
--     kind = "progress",
--     cond = function(message)
--       local client = vim.tbl_get(message.opts, "progress", "client")
--       return client == "lua_ls" -- skip lua-ls progress
--     end,
--   },
--   opts = { skip = true },
-- })

-- find = "let%s+",
-- opts = { buf_options = { buftype = "nofile", filetype = "javascript" } },

-- history = {view = "split",},
-- last = {view = "popup",},
-- errors = {view = "popup",},

-- INFO: https://github.com/folke/noice.nvim/wiki/A-Guide-to-Messages
-- local Config = require("noice.config")
--
