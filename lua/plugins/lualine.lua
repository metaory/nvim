if true then
  return {}
end

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    ---@diagnostic disable-next-line: unused-local
    opts = function(plugin)
      -- local icons = require("lazyvim.config").icons

      local XC = require("mxc.palette")

      local bubbles_theme = {
        normal = {
          a = { fg = XC.sfg, bg = XC.sbg },
          b = { fg = XC.c15, bg = XC.c08 },
          c = { fg = XC.c03, bg = "none" },
        },
        command = { a = { fg = XC.c00, bg = XC.c03 } },
        -- opending = { a = { fg = XC.c00, bg = XC.c04 } },
        -- confirm = { a = { fg = XC.c00, bg = XC.c01 } },
        insert = { a = { fg = XC.wfg, bg = XC.wbg } },
        visual = { a = { fg = XC.efg, bg = XC.ebg } },
        replace = { a = { fg = XC.c00, bg = XC.c01 } },

        inactive = {
          a = { fg = XC.c15, bg = XC.c00 },
          b = { fg = XC.c15, bg = XC.c00 },
          c = { fg = XC.c15, bg = XC.c00 },
        },
      }

      -- local function fg(name)
      --   return function()
      --     ---@type {foreground?:number}?
      --     local hl = vim.api.nvim_get_hl_by_name(name, true)
      --     return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
      --   end
      -- end

      -- local empty = require("lualine.component"):extend()
      -- function empty:draw(default_highlight)
      --   self.status = ""
      --   self.applied_separator = ""
      --   self:apply_highlights(default_highlight)
      --   self:apply_section_separators()
      --   return self.status
      -- end

      -- Put proper separators and gaps between components in sections
      -- local function process_sections(sections)
      --   for name, section in pairs(sections) do
      --     local left = name:sub(9, 10) < "x"
      --     for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
      --       table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
      --     end
      --     for id, comp in ipairs(section) do
      --       if type(comp) ~= "table" then
      --         comp = { comp }
      --         section[id] = comp
      --       end
      --       comp.separator = left and { right = "" } or { left = "" }
      --     end
      --   end
      --   return sections
      -- end

      -- local function search_result()
      --   if vim.v.hlsearch == 0 then
      --     return ""
      --   end
      --   local last_search = vim.fn.getreg("/")
      --   if not last_search or last_search == "" then
      --     return ""
      --   end
      --   local searchcount = vim.fn.searchcount({ maxcount = 9999 })
      --   return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
      -- end

      -- local function modified()
      --   if vim.bo.modified then
      --     return "+"
      --   elseif vim.bo.modifiable == false or vim.bo.readonly == true then
      --     return "-"
      --   end
      --   return ""
      -- end
      --[[
%F – Display the full path of the current file.
%M – Modified flag shows if file is unsaved.
%Y – Type of file in the buffer.
%R – Displays the read-only flag.
%b – Shows the ASCII/Unicode character under cursor.
0x%B – Shows the hexadecimal character under cursor.
%l – Display the row number.
%c – Display the column number.
%p%% – Show the cursor percentage from the top of the file.
      ]]
      local function keymap()
        if vim.opt.iminsert:get() > 0 and vim.b.keymap_name then
          return "⌨ " .. vim.b.keymap_name
        end
        return ""
      end
      local function show_macro_recording()
        local recording_register = vim.fn.reg_recording()
        if recording_register == "" then
          return ""
        else
          return "Recording @" .. recording_register
        end
      end
      -- local ns = vim.api.nvim_create_namespace("showcmd_msg")
      -- local showcmd_msg = "x"
      -- vim.ui_attach(ns, { ext_messages = true }, function(event, ...)
      --   if event == "msg_showcmd" then
      --     local content = ...
      --     showcmd_msg = #content > 0 and content[1][2] or "y"
      --   end
      -- end)
      -- require("lualine").setup({ lualine_c = { function() return showcmd_msg end, }, })

      return {
        options = {
          theme = bubbles_theme,
          component_separators = "|",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            { "mode", separator = { left = "" }, right_padding = 2 },
          },
          lualine_b = {
            "filename",
            "branch",
            {
              "%M",
              cond = function()
                return vim.bo.modified
              end,
            },
            {
              "%q",
              cond = function()
                return vim.bo.buftype == "quickfix"
              end,
            },
            { keymap },
            { show_macro_recording },
            { "%S" }, -- incomplete - https://github.com/nvim-lualine/lualine.nvim/issues/949
            {
              "diff",
              -- color = { bg = XC.c01 },
            },
            -- "%Y",
          },
          lualine_c = { "fileformat" },
          lualine_x = {},
          lualine_y = { "filetype", "progress" },
          lualine_z = {
            {
              "%r", -- %R – Displays the read-only flag.

              -- cond = function()
              --   return vim.bo.readonly
              -- end,
            },
            { "location", separator = { right = "" }, left_padding = 2 }, -- █
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
        tabline = {},
        extensions = {},
      }
    end,
  },
}
