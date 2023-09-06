local async = require("util.async")
local ui = require("user.ui")

vim.keymap.set(
  "n",
  "<leader>eet",
  async.void(function()
    local answers = {}
    answers.a = ui.input({ prompt = "x::A" })
    vim.notify("nw A", vim.log.levels.INFO, { title = tostring(answers.a) })

    answers.b = ui.input({ prompt = "x::B" })
    vim.notify("nw B", vim.log.levels.INFO, { title = tostring(answers.b) })

    ddwrite(answers, "XYZ")
  end),
  { desc = "Test (WIP)" }
)

vim.keymap.set(
  "n",
  "<leader>er",
  async.void(function()
    local cmd = ui.input_ft_runner()

    if not cmd then
      return
    end

    vim.notify(cmd)

    local cwd = vim.fn.getcwd()
    local path = vim.fn.expand("%:p")
    local rel = string.gsub(path, cwd, ".")
    local full = cmd .. " " .. rel

    vim.cmd([[ enew | r ! ]] .. full)
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
    local choice = ui.select(vim.fn.getcompletion("*", "filetype"), { prompt = "Select Filetype:" }) or vim.bo.filetype
    vim.notify(choice, vim.log.levels.INFO, { title = "Filetype Updated" })
    vim.bo.filetype = choice
  end),
  { desc = "Set File Type" }
)

vim.keymap.set("n", "<leader>eov", function()
  local old = vim.o.verbose
  vim.o.verbose = old == 0 and 9 or 0
  vim.o.verbosefile = old == 0 and "/tmp/mx-verbose.log" or nil

  local msg = string.format("Updated Verbose Level from %s to %s", old, vim.o.verbose)
  local lvl = vim.o.verbose == 0 and vim.log.levels.INFO or vim.log.levels.WARN
  vim.notify(msg, lvl, { title = "Verbose Level" })
end, { desc = "Set Verbose Level" })

vim.keymap.set("n", "<leader>eow", ":setlocal wrap!<CR>", { desc = "Set Text Wrap" })
-- vim.keymap.set("n", "<leader>eow", function() vim.wo.wrap = not vim.wo.wrap; end, { desc = "Set Text Wrap" })

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
