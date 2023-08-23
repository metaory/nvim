return {
  {
    "fei6409/log-highlight.nvim",
    opts = {
      extension = { "log", "txt" },
      filename = {
        "messages",
      },
      -- The file path glob patterns, e.g. `.*%.lg`, `/var/log/.*`.
      -- Note: `%.` is to match a literal dot (`.`) in a pattern in Lua, but most
      -- of the time `.` and `%.` here make no observable difference.
      pattern = {
        "/var/log/.*",
        "messages%..*",
      },
    },
    config = true,
    ft = { "conf", "log" },
  },
  -- {
  --   "RRethy/vim-illuminate",
  --   event = { "BufReadPost", "BufNewFile" },
  --   opts = {
  --     delay = 200,
  --     large_file_cutoff = 2000,
  --     large_file_overrides = {
  --       providers = { "lsp" },
  --     },
  --     providers = {
  --       "lsp",
  --       "treesitter",
  --       "regex",
  --     },
  --   },
  --   config = function(_, opts)
  --     require("illuminate").configure(opts)
  --
  --     local function map(key, dir, buffer)
  --       vim.keymap.set("n", key, function()
  --         require("illuminate")["goto_" .. dir .. "_reference"](false)
  --       end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
  --     end
  --
  --     map("]]", "next")
  --     map("[[", "prev")
  --
  --     --   -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
  --     --   vim.api.nvim_create_autocmd("FileType", {
  --     --     callback = function()
  --     --       local buffer = vim.api.nvim_get_current_buf()
  --     --       map("]]", "next", buffer)
  --     --       map("[[", "prev", buffer)
  --     --     end,
  --     --   })
  --   end,
  --   keys = {
  --     { "]]", desc = "Next Reference" },
  --     { "[[", desc = "Prev Reference" },
  --   },
  -- },

  -- {
  --   "echasnovski/mini.hipatterns",
  --   event = "BufReadPre",
  --   opts = function()
  --     local hi = require("mini.hipatterns")
  --     return {
  --       tailwind = {
  --         enabled = true,
  --         ft = { "typescriptreact", "javascriptreact", "css", "javascript", "typescript", "html" },
  --         style = "full", -- full: compact:
  --       },
  --       highlighters = {
  --         hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),
  --       },
  --     }
  --   end,
  --   config = function(_, opts)
  --     if type(opts.tailwind) == "table" and opts.tailwind.enabled then
  --       -- reset hl groups when colorscheme changes
  --       vim.api.nvim_create_autocmd("ColorScheme", {
  --         callback = function()
  --           M.hl = {}
  --         end,
  --       })
  --     end
  --     require("mini.hipatterns").setup(opts)
  --   end,
  -- },
  -- opts.highlighters.tailwind = {
  --   pattern = function()
  --     if not vim.tbl_contains(opts.tailwind.ft, vim.bo.filetype) then
  --       return
  --     end
  --     if opts.tailwind.style == "full" then
  --       return "%f[%w:-]()[%w:-]+%-[a-z%-]+%-%d+()%f[^%w:-]"
  --     elseif opts.tailwind.style == "compact" then
  --       return "%f[%w:-][%w:-]+%-()[a-z%-]+%-%d+()%f[^%w:-]"
  --     end
  --   end,
  --   group = function(_, _, m)
  --     ---@type string
  --     local match = m.full_match
  --     ---@type string, number
  --     local color, shade = match:match("[%w-]+%-([a-z%-]+)%-(%d+)")
  --     shade = tonumber(shade)
  --     local bg = vim.tbl_get(M.colors, color, shade)
  --     if bg then
  --       local hl = "MiniHipatternsTailwind" .. color .. shade
  --       if not M.hl[hl] then
  --         M.hl[hl] = true
  --         local bg_shade = shade == 500 and 950 or shade < 500 and 900 or 100
  --         local fg = vim.tbl_get(M.colors, color, bg_shade)
  --         vim.api.nvim_set_hl(0, hl, { bg = "#" .. bg, fg = "#" .. fg })
  --       end
  --       return hl
  --     end
  --   end,
  --   priority = 2000,
  -- }
}
