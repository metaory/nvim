--stylua: ignore
local missing_icons = {"sol", "prisma", "xls", "xlsx", "xml", "vh", "vhd", "vhdl", "v", "tscn", "tex", "tbc", "svg", "sv", "ppt", "ps1", "psd1", "psm1", "opus", "mint", "huff", "f90", "doc", "docx", "csv", "cs", "r", "webpack",}

return {
  "nvim-tree/nvim-web-devicons",
  opts = function()
    local src = require("nvim-web-devicons").get_icons()

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
      override_by_extension = vim.tbl_extend("force", dopatch("", missing_icons), dopatch("", { "txt", "log" }), {
        -- ["lua"] = { icon = "", color = "#fe23ff", cterm_color = "231", name = "Md" },
      }),
    }
  end,
}
