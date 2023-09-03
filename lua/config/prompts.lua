local async = require("util.async")
local ui = require("user.ui")

vim.keymap.set(
  "n",
  "<leader>eet",
  async.void(function()
    local a = ui.input({ prompt = "x::A" })
    vim.notify("nw A", vim.log.levels.INFO, { title = tostring(a) })

    local b = ui.input({ prompt = "x::B" })
    vim.notify("nw B", vim.log.levels.INFO, { title = tostring(b) })
  end),
  { desc = "Test (WIP)" }
)

vim.keymap.set(
  "n",
  "<leader>er",
  async.void(function()
    local defCommands = { javascript = "node" }
    local cmd = defCommands[vim.bo.filetype] or vim.bo.filetype
    local cwd = vim.fn.getcwd()
    local path = vim.fn.expand("%:p")
    local rel = string.gsub(path, cwd, ".")
    vim.notify(rel)
    local input = ui.input({ prompt = "command", default = cmd .. " " .. rel })
    if not input then
      return
    end
    vim.notify(input)
    vim.cmd([[ enew | r ! ]] .. input)
    local buf = vim.api.nvim_win_get_buf(0)
    if not pcall(vim.treesitter.start, buf, "lua") then
      vim.bo[buf].filetype = "lua"
    end
    vim.keymap.set("n", "q", "<CMD>bw<CR>", { buffer = 0 })
  end),
  { noremap = true, desc = "Exec Run" }
)

vim.keymap.set(
  "n",
  "<leader>eof",
  async.void(function()
    local choice = ui.select(vim.fn.getcompletion("*", "filetype"), {
      prompt = "Select Filetype:",
    })
    if choice == nil then
      return
    end
    vim.notify(choice, vim.log.levels.INFO, { title = "Filetype Updated" })
    vim.o.filetype = choice
  end),
  { desc = "Set File Type" }
)
--[[
  --   -- make ranged for loop
  -- range(start, stop, [step])
  -- --promise
  -- promis.new(function(resolve,reject))
  --
  -- --chain call
  -- promise:chain_call(func)
  --
  -- -- cache
  -- promis:catch(function)
  --
  -- -- await
  -- promise:await()
  --
  -- -- resolve
  -- promise:resolve(...)
  --
  -- -- error
  -- promise:error(err)
  --
  -- -- status: Pending | Resolved | Errored
  -- promise:status()
  -- promise:isPending, promis:isResolved,promis:IsErroed
  --]]

-- local ok, data = pcall(vim.ui.input, { prompt = "xoxo" })

-- local err, r = a.wrap(vim.ui.input({ prompt = "fooo" }), 2)
-- vim.notify(err, vim.log.levels.ERROR)
-- vim.notify(ok, vim.log.levels.WARN)
-- vim.notify(data, vim.log.levels.INFO)
-- async_test()
-- local inputs = {}
-- input("Is there a scope ? (optional) ", "scope", inputs)
-- mxdump(inputs, "inputs_pos_1")
-- input("Enter commit message: ", "msg", inputs)
-- mxdump(inputs, "inputs_pos_2")
-- vim.schedule(function() cb(x + 1) end)
