return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local c = require("user.colors").palette()
    opts.options.component_separators = { left = "⏽ ", right = "⏽" } -- " ", "⏽" ,"", "" ""
    opts.options.section_separators = { left = "", right = "" }
    opts.sections.lualine_c[4] = {
      function()
        return require("nvim-navic").get_location()
      end,
      cond = function()
        return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
      end,
      padding = 0,
    }
    opts.sections.lualine_y = {
      { "progress", separator = " ", padding = { left = 1, right = 0 } },
      { "location", padding = { left = 0, right = 1 } },
    }
    table.insert(opts.sections.lualine_x, {
      require("noice").api.status.search["get"],
      cond = require("noice").api.status.search["has"],
      color = { fg = c.yellow },
    })
    table.insert(opts.options.disabled_filetypes.statusline, "starter")
  end,
}
-- { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
-- opts = {options = {theme = "horizon", theme = "auto", disabled_filetypes = { statusline = { "starter" } },},},
-- ddwrite(opts, "lualine")
-- ddwrite(opts.sections.lualine_c, "lualine_c")
-- lualine_x = {
--   {
--     function() return require("noice").api.status.command.get() end,
--     cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
--     color = Util.fg("Statement"),
--   },
--   {
--     function() return require("noice").api.status.mode.get() end,
--     cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
--     color = Util.fg("Constant"),
--   },

-- {
--   "nvim-lualine/lualine.nvim",
--   event = "VeryLazy",
--   opts = function()
--     local icons = require("lazyvim.config").icons
--     local Util = require("lazyvim.util")
--
--     return {
--       options = {
--         theme = "auto",
--         globalstatus = true,
--         disabled_filetypes = { statusline = { "dashboard", "alpha" } },
--       },
--       sections = {
--         lualine_a = { "mode" },
--         lualine_b = { "branch" },
--         lualine_c = {
--           {
--             "diagnostics",
--             symbols = {
--               error = icons.diagnostics.Error,
--               warn = icons.diagnostics.Warn,
--               info = icons.diagnostics.Info,
--               hint = icons.diagnostics.Hint,
--             },
--           },
--           { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
--           { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
--           -- stylua: ignore
--           {
--             function() return require("nvim-navic").get_location() end,
--             cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
--           },
--         },
--         lualine_x = {
--           -- stylua: ignore
--           {
--             function() return require("noice").api.status.command.get() end,
--             cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
--             color = Util.fg("Statement"),
--           },
--           -- stylua: ignore
--           {
--             function() return require("noice").api.status.mode.get() end,
--             cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
--             color = Util.fg("Constant"),
--           },
--           -- stylua: ignore
--           {
--             function() return "  " .. require("dap").status() end,
--             cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
--             color = Util.fg("Debug"),
--           },
--           { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = Util.fg("Special") },
--           {
--             "diff",
--             symbols = {
--               added = icons.git.added,
--               modified = icons.git.modified,
--               removed = icons.git.removed,
--             },
--           },
--         },
--         lualine_y = {
--           { "progress", separator = " ", padding = { left = 1, right = 0 } },
--           { "location", padding = { left = 0, right = 1 } },
--         },
--         lualine_z = {
--           function()
--             return " " .. os.date("%R")
--           end,
--         },
--       },
--       extensions = { "neo-tree", "lazy" },
--     }
--   end,
-- },
-- INFO: require('lualine').get_config()
-- /home/meta/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/ui.lua:95
-- https://github.com/freddiehaddad/feline.nvim

-- TODO: https://github.com/nvim-lualine/lualine.nvim/tree/master#general-component-options

--
