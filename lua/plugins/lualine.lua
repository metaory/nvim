return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(plugin)
      local icons = require("lazyvim.config").icons

      local XC = require("mxc.palette")

      local colors = {
        red = XC.c01,
        grey = XC.c07,
        black = XC.c08,
        white = XC.sk3,
        light_green = XC.c10,
        orange = XC.c03,
        green = XC.c02,
      }

      local theme = {
        normal = {
          a = { fg = XC.sfg, bg = XC.sbg },
          b = { fg = XC.wbg, bg = XC.sk3 },
          c = { fg = XC.ebg, bg = XC.sk2 },
          z = { fg = XC.efg, bg = XC.ebg },
        },
        insert = { a = { fg = XC.wfg, bg = XC.wbg } },
        visual = { a = { fg = XC.efg, bg = XC.ebg } },
        replace = { a = { fg = XC.cf3, bg = XC.c03 } },
      }

      local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      local empty = require("lualine.component"):extend()
      function empty:draw(default_highlight)
        self.status = ""
        self.applied_separator = ""
        self:apply_highlights(default_highlight)
        self:apply_section_separators()
        return self.status
      end

      -- Put proper separators and gaps between components in sections
      local function process_sections(sections)
        for name, section in pairs(sections) do
          local left = name:sub(9, 10) < "x"
          for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
            table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
          end
          for id, comp in ipairs(section) do
            if type(comp) ~= "table" then
              comp = { comp }
              section[id] = comp
            end
            comp.separator = left and { right = "" } or { left = "" }
          end
        end
        return sections
      end

      local function search_result()
        if vim.v.hlsearch == 0 then
          return ""
        end
        local last_search = vim.fn.getreg("/")
        if not last_search or last_search == "" then
          return ""
        end
        local searchcount = vim.fn.searchcount({ maxcount = 9999 })
        return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
      end

      local function modified()
        if vim.bo.modified then
          return "+"
        elseif vim.bo.modifiable == false or vim.bo.readonly == true then
          return "-"
        end
        return ""
      end

      return {
        options = {
          theme = theme,
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
          component_separators = "",
          section_separators = { left = "", right = "" },
        },
        sections = process_sections({
          lualine_a = { "mode" },
          lualine_b = {
            "branch",
            "diff",
            {
              "diagnostics",
              source = { "nvim" },
              sections = { "error" },
              diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
            },
            {
              "diagnostics",
              source = { "nvim" },
              sections = { "warn" },
              diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
            },
            { "filename", file_status = false, path = 1 },
            { modified, color = { bg = colors.red } },
            {
              "%w",
              cond = function()
                return vim.wo.previewwindow
              end,
            },
            {
              "%r",
              cond = function()
                return vim.bo.readonly
              end,
            },
            {
              "%q",
              cond = function()
                return vim.bo.buftype == "quickfix"
              end,
            },
          },
          -- lualine_c = {},
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
              -- color = { fg = "#f0f0f0", bg = "#f00f00" },
            },
            -- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            -- { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
            -- stylua: ignore
            {
              function() return require("nvim-navic").get_location() end,
              cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
              separator = { right = "x" , left = "y" },
              -- color = fg("Constant")
              padding = { left = 1, right = 2 },
              color = { fg = "#f0f0f0", bg = "#f00f00" }
              -- color = fg("Statement")
            },
          },
          -- lualine_x = {},
          lualine_x = {
            -- stylua: ignore
            {
              function() return require("noice").api.status.command.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              color = fg("Statement")
              -- color = { fg = "#f0f0f0", bg = "#f00f00" }
            },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              -- color = fg("Constant") ,
              color = { fg = "#f0f0f0", bg = "#f00f00" }
            },
            { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
          },
          lualine_y = { search_result, "filetype" },
          lualine_z = { "%l:%c", "%p%%/%L" },
        }),
        inactive_sections = {
          lualine_c = { "%f %y %m" },
          lualine_x = {},
        },
        extensions = { "neo-tree" },
      }
    end,
  },
}
