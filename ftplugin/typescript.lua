vim.keymap.set("i", "t", require("metaory.langs.javascript").add_async, { buffer = true })
vim.keymap.set("n", "<leader>k", require("metaory.langs.javascript").goto_exported_symbol, { buffer = true })
