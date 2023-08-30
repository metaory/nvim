--[[
--/home/meta/dev/forks/dotfiles-mini/lua/mini-dev/pick.lua
keybinds.remap_event("norg", "n", "<leader>on", "core.dirman.new.note")
module.required["core.ui"].create_prompt("NeorgNewNote", "New Note: ", function(text)
--]]

-- local M = {}
-- return M

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
