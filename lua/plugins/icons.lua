--stylua: ignore
local missing_icons = {"sol", "prisma", "xls", "xlsx", "xml", "vh", "vhd", "vhdl", "v", "tscn", "tex", "tbc", "svg", "sv", "ppt", "ps1", "psd1", "psm1", "opus", "mint", "huff", "f90", "doc", "docx", "csv", "cs", "r", "webpack",}

-- TODO:
-- ~/.config/nvim/lua/plugins/tree.lua:34
-- ~/.config/nvim/lua/plugins/comment.lua:47
-- 更

return {
  "nvim-tree/nvim-web-devicons",
  opts = function()
    local src = require("nvim-web-devicons").get_icons()
    -- local c = require("user.theme").palette()

    local dopatch = function(i, l)
      local list = {}
      for _, v in pairs(l) do
        src[v].icon = i
        table.insert(list, src[v])
      end
      return list
    end

    return {
      color_icons = true, --  (default to true)
      default = false, --  (default to false)
      strict = false, -- (default to false)
      override = {},
      override_by_filename = vim.tbl_extend(
        "force",
        dopatch("", { "dockerfile", "containerfile", "docker-compose.yml", "docker-compose.yaml", ".dockerignore" }),
        {
          -- ["hipattern.lua"] = { icon = "", color = "#fe23ff", cterm_color = "231", name = "Md" },
        }
      ),
      override_by_extension = vim.tbl_extend(
        "force",
        dopatch("✖", missing_icons),
        dopatch(" ", { "md" }),
        dopatch("", { "txt", "log" }),
        {
          -- ["lua"] = { icon = "", color = "#fe23ff", cterm_color = "231", name = "Md" },
          -- ["lua"] = { icon = "", color = c.blue, cterm_color = "24", name = "Lua" },
          -- ["luau"] = { icon = "", color = c.blue, cterm_color = "24", name = "Luau" },
        }
      ),
    }
  end,
}
