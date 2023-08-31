--[[
--/home/meta/dev/forks/dotfiles-mini/lua/mini-dev/pick.lua
keybinds.remap_event("norg", "n", "<leader>on", "core.dirman.new.note")
module.required["core.ui"].create_prompt("NeorgNewNote", "New Note: ", function(text)
--]]

-- local M = {}
-- return M

-- vim.keymap.set("n", "<leader>et", function()
-- end, { desc = "Testing" })

-- local Hydra = require("hydra")
--
-- Hydra({
--   name = "Change / Resize Window",
--   mode = { "n" },
--   body = "<C-w>",
--   config = {
--     -- color = "pink",
--   },
--   heads = {
--     -- move between windows
--     { "<C-h>", "<C-w>h" },
--     { "<C-j>", "<C-w>j" },
--     { "<C-k>", "<C-w>k" },
--     { "<C-l>", "<C-w>l" },
--
--     -- resizing window
--     { "H", "<C-w>3<" },
--     { "L", "<C-w>3>" },
--     { "K", "<C-w>2+" },
--     { "J", "<C-w>2-" },
--
--     -- equalize window sizes
--     { "e", "<C-w>=" },
--
--     -- close active window
--     { "Q", ":q<cr>" },
--     { "<C-q>", ":q<cr>" },
--
--     -- exit this Hydra
--     { "q", nil, { exit = true, nowait = true } },
--     { ";", nil, { exit = true, nowait = true } },
--     { "<Esc>", nil, { exit = true, nowait = true } },
--   },
-- })
-- Hydra:activate()

-- vim.keymap.set("n", "<leader>ed", function()
--   vim.ui.select({ "apple", "banana", "mango" }, {
--     prompt = "Title",
--     -- telescope = require("telescope.themes").get_cursor(),
--   }, function(selected) end)
-- end, { desc = "Dressing select" })

-- ##########################################################################

-- vim.keymap.set("n", "<leader>ei", function()
--   vim.ui.input({
--     prompt = "Text:",
--   }, function(choice)
--     if choice == nil then
--       return
--     end
--     vim.notify(choice)
--   end)
-- end, { desc = "Update Input" })

-- XXX:
-- function input(prompt, key, inputs)
--     vim.ui.input({ prompt = prompt }, function(msg)
--         inputs[key] = msg
--     end)
-- end
-- local inputs = {}
-- input("Is there a scope ? (optional) ", "scope", inputs)
-- input("Enter commit message: ", "msg", inputs)
