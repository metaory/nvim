local inputOpt = {
  position = "50%",
  size = {
    width = 50,
  },
  border = {
    style = "single",
    text = {
      top = "[Howdy?]",
      top_align = "center",
    },
  },
  win_options = {
    winhighlight = "Normal:Normal,FloatBorder:Normal",
  },
}

local menuOpt = {
  position = "50%",
  size = {
    width = 25,
    height = 5,
  },
  border = {
    style = "single",
    text = {
      top = "[Choose-an-Element]",
      top_align = "center",
    },
  },
  win_options = {
    winhighlight = "Normal:Normal,FloatBorder:Normal",
  },
}
local keymap = {
  focus_next = { "j", "<Down>", "<Tab>" },
  focus_prev = { "k", "<Up>", "<S-Tab>" },
  close = { "<Esc>", "<C-c>" },
  submit = { "<CR>", "<Space>" },
}

local promptText = function()
  local Input = require("nui.input")
  local event = require("nui.utils.autocmd").event
  local input = Input(inputOpt, {
    prompt = "> ",
    default_value = "Hello",
    on_close = function()
      print("Input Closed!")
    end,
    on_submit = function(value)
      print("Input Submitted: " .. value)
    end,
  })

  -- mount/open the component
  input:mount()

  -- unmount component when cursor leaves buffer
  input:on(event.BufLeave, function()
    input:unmount()
  end)
end

local promptMenu = function()
  local Menu = require("nui.menu")
  local event = require("nui.utils.autocmd").event
  local menu = Menu(menuOpt, {
    lines = {
      Menu.item("Hydrogen (H)"),
      Menu.item("Carbon (C)"),
      Menu.item("Nitrogen (N)"),
      Menu.separator("Noble-Gases", {
        char = "-",
        text_align = "right",
      }),
      Menu.item("Helium (He)"),
      Menu.item("Neon (Ne)"),
      Menu.item("Argon (Ar)"),
    },
    max_width = 20,
    keymap = keymap,
    on_close = function()
      print("Menu Closed!")
    end,
    on_submit = function(item)
      print("Menu Submitted: ", item.text)
    end,
  })

  -- mount the component
  menu:mount()
end

local promptFiletype = function()
  local fileTypes = { "vim", "lua", "javascript", "yaml", "toml" }

  -- local filetypes = vim.fn.getcompletion("*", "filetype")
  local lines = {}
  for _, cmd in ipairs(fileTypes) do
    table.insert(lines, Menu.item(cmd))
  end

  local menu = Menu(menuOpt, {
    lines = lines,
    max_width = 20,
    keymap = keymap,
    -- on_close = function() print("Menu Closed!") end,
    on_submit = function(item)
      print("Menu Submitted: ", item.text)
      vim.o.filetype = item.text
    end,
  })

  menu:mount()
end

-- vim.keymap.set("n", "<leader>lt", function()
--   promptText()
-- end, { desc = "UI Demo Text" })

-- vim.keymap.set("n", "<leader>lm", function()
--   promptMenu()
-- end, { desc = "UI Demo Menu" })

-- vim.keymap.set("n", "<leader>ut", function()
--   promptFiletype()
-- end, { desc = "Update File Type" })
