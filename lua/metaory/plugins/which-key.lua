local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

M.config = function()
  local wk = require("which-key")

  wk.setup({
    preset = "helix",
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "→", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    win = {
      padding = { 0, 1 }, -- extra window padding [top/bottom, right/left]
    },
    triggers = {
      { "<auto>", mode = "nistc" },
    },
    sort = { "alphanum", "mod" },
    notify = false,
    show_help = false,
    show_keys = false,
    -- marks/registers: built-in icons (󰸕 / 󰅍). Presets: operators/motions are noisy; z/g we already define below with icons.
    plugins = {
      marks = true,
      registers = true,
      presets = {
        operators = false,
        motions = false,
        text_objects = true,
        windows = true,
        nav = false,
        z = false,
        g = false,
      },
    },
  })
  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }
  wk.add({
    { "<leader>*", hidden = true, nowait = false, remap = false },
    { "<leader><Tab>", group = "Tabs", icon = "󰓩 ", nowait = false, remap = false },
  -- -- wk.add({
    { "<leader>q",  desc = "Quit", icon = " " },
  -- -- })
    { "<leader>b", group = "Buffers", icon = " ", nowait = false, remap = false },
    { "<leader>c", group = "Code", icon = " ", nowait = false, remap = false },
    { "<leader>d", group = "Debug", icon = " ", nowait = false, remap = false },
    { "<leader>f", group = "Find", icon = " ", nowait = false, remap = false },
    { "<leader>n", group = "Notification", icon = " " },
    { "<leader>fb", desc = "Buffers", icon = " " },
    { "<leader>fc", desc = "Command History", icon = " " },
    { "<leader>ff", desc = "LSP Functions", icon = "󰊕 " },
    { "<leader>fH", desc = "Highlights", icon = " " },
    { "<leader>fh", desc = "Help", icon = "󰋗 " },
    { "<leader>fi", desc = "Icons", icon = " " },
    { "<leader>fM", desc = "Man pages", icon = " " }, -- 󰆜
    { "<leader>fm", desc = "Grapple tag", icon = " " },
    { "<leader>fn", desc = "Noice", icon = " " }, -- 
    { "<leader>fo", desc = "Grapple open", icon = " " }, -- 󰛢
    { "<leader>fR", desc = "Rename file", icon = "󰑕 " },
    { "<leader>fr", desc = "Resume", icon = " " },
    { "<leader>fs", desc = "Git status", icon = " " },
    { "<leader>fg", desc = "Grep", icon = " " },
    { "<leader>fu", desc = "Undo history", icon = " " },
    { "<leader>g", group = "Git", icon = " ", nowait = false, remap = false },
    { "<leader>gb", desc = "Blame", icon = " " },
    { "<leader>gB", desc = "GitHub Blame", icon = " " },
    { "<leader>gc", desc = "Review comments", icon = " " },
    { "<leader>gdo", desc = "Diff open", icon = " " },
    { "<leader>gdf", desc = "File history", icon = " " },
    { "<leader>gdm", desc = "Diff master", icon = " " },
    { "<leader>gdM", desc = "Diff main", icon = " " },
    { "<leader>gg", desc = "GhBlame line", icon = " " }, -- 󰊢
    { "<leader>gym", desc = "URL (main)", icon = " " },
    { "<leader>gyb", desc = "URL (branch)", icon = " " },
    { "<leader>gyc", desc = "URL (commit)", icon = " " },
    { "<leader>h", group = "Gitsigns", icon = " ", nowait = false, remap = false },
    { "<leader>ht", group = "Toggle", icon = "󰨚 ", nowait = false, remap = false },

    { "<leader>l", group = "LSP", icon = " ", nowait = false, remap = false },
    { "<leader>lr", desc = "LSP Restart", icon = " " },
    { "<leader>le", desc = "Restart eslint_d", icon = " " },
    { "<leader>lf", desc = "Format", icon = " " },
    { "<leader>lh", desc = "Inlay hints", icon = "󰨚 " },
    { "<leader>lF", desc = "Auto format", icon = "󰨚 " },
    { "<leader>lj", desc = "JSON format", icon = " " },
    { "<leader>lJ", desc = "JSON compact", icon = " " },
    { "<leader>R", group = "Kulala", icon = "󰛳 ", nowait = false, remap = false },
    { "<leader>o", group = "Open", icon = " ", nowait = false, remap = false },
    { "<leader>oc", desc = "Chrome DevTools", icon = "󰖟 " },
    { "<leader>ol", ':Lazy<CR>', desc = "Lazy", icon = "󰒲 " },
    { "<leader>t", group = "Test", icon = " ", nowait = false, remap = false },
    { "<leader>tn", desc = "Test nearest", icon = " " },
    { "<leader>tt", desc = "Test suite", icon = " " },
    { "<leader>tf", desc = "Test file", icon = " " },
    { "<leader>tr", desc = "Test last", icon = " " },
    { "<leader>x", group = "Trouble", icon = " ", nowait = false, remap = false },
    { "<leader>xd", desc = "Diagnostics", icon = " " }, -- 󱖫
    { "<leader>xl", desc = "Loclist", icon = " " },
    { "<leader>xq", desc = "Quickfix", icon = " " }, --  
    { "<leader>xr", desc = "LSP refs", icon = " " },
    { "<leader>bd", desc = "Delete Buffer", icon = " " },
    { "<leader>bn", desc = "New file", icon = " " },
    { "<leader>bq", desc = "Quit", icon = " " },
    { "<leader>bo", desc = "Close others", icon = " " },
    { "<leader>bw", desc = "Write", icon = " " },
    { "<leader>bW", desc = "Write all", icon = " " },
    { "<leader>bQ", desc = "Quit nvim", icon = " " },
    { "<leader>bz", desc = "Maximize", icon = " " },
    { "<leader><leader>", desc = "Last buffer", icon = " " },
    { "<leader>c,", desc = "Add ,", icon = " " },
    { "<leader>c;", desc = "Add ;", icon = " " },
    { "<leader>ca", desc = "Delete all logs", icon = "󰈸 " },
    { "<leader>cc", desc = "Log dashboard", icon = "󰈸 " },
    { "<leader>cd", desc = "Delete log below", icon = "󰈸 " },
    { "<leader>cD", desc = "Delete log above", icon = "󰈸 " },
    { "<leader>ce", desc = "Error motion", icon = "󰈸 " },
    { "<leader>cE", desc = "Error word", icon = "󰈸 " },
    { "<leader>cf", desc = "Find logs", icon = "󰈸 " },
    { "<leader>ci", desc = "Info motion", icon = "󰈸 " },
    { "<leader>cI", desc = "Info word", icon = "󰈸 " },
    { "<leader>cl", desc = "Log motion", icon = "󰈸 " },
    { "<leader>cL", desc = "Log word", icon = "󰈸 " },
    { "<leader>cn", desc = "Replace next", icon = " " },
    { "<leader>cN", desc = "Replace prev", icon = " " },
    { "<leader>cr", desc = "SSR replace", icon = " " },
    { "<leader>cR", desc = "GrugFar", icon = "󰛔 " },
    { "<leader>cw", desc = "Warn motion", icon = "󰈸 " },
    { "<leader>cW", desc = "Warn word", icon = "󰈸 " },
    { "<leader>da", desc = "Run with args", icon = " " },
    { "<leader>dB", desc = "Breakpoint cond", icon = " " },
    { "<leader>db", desc = "Breakpoint", icon = " " },
    { "<leader>dc", desc = "Continue", icon = " " },
    { "<leader>dC", desc = "Run to cursor", icon = " " },
    { "<leader>de", desc = "Eval", icon = " " },
    { "<leader>di", desc = "Step into", icon = " " },
    { "<leader>dj", desc = "Down", icon = " " },
    { "<leader>dk", desc = "Up", icon = " " },
    { "<leader>dl", desc = "Run last", icon = " " },
    { "<leader>dn", desc = "Launch Neovim Lua", icon = " " },
    { "<leader>do", desc = "Step over", icon = " " },
    { "<leader>dO", desc = "Step out", icon = " " },
    { "<leader>dp", desc = "Pause", icon = " " },
    { "<leader>dr", desc = "REPL", icon = " " },
    { "<leader>dt", desc = "Debug test", icon = " " },
    { "<leader>dT", desc = "Terminate", icon = " " },
    { "<leader>du", desc = "DAP UI", icon = " " },
    { "<leader>dw", desc = "Widgets", icon = " " },

    { "<leader>a", desc = "Code Action", icon = " " },

    { '<leader><Tab>d', desc = 'tabclose', icon = '' },
    { '<leader><Tab>n', desc = 'tabnext', icon = '' },
    { '<leader><Tab>p', desc = 'tabprevious', icon = '' },
  }, opts)

  -- g prefix (LSP / glance / inc-rename)
  wk.add({
    { "ga", desc = "Align", icon = " " },
    { "gA", desc = "Align w/preview", icon = " " },

    { "gd", desc = "Definitions", icon = "󰊕 " },
    { "gD", desc = "Declaration", icon = "󰊕 " },
    { "gr", desc = "References", icon = "󰊕 " },
    { "gY", desc = "Type defs", icon = "󰊕 " },
    { "gi", desc = "Implementations", icon = "󰊕 " },
    { "gR", desc = "Rename", icon = "󰑕 " },
    { "gh", desc = "Hover", icon = "󰋗 " },
    { "gH", desc = "Signature", icon = "󰋗 " },
    { "ge", desc = "Diagnostic", icon = " " },

    { "gO", desc = "Symbol", icon = " " },
    { "gc", desc = "Comment", icon = " " },
    { "gj", desc = "Join line", icon = " " },
    { "g'", desc = "Marks", icon = " " },
    { "g`", desc = "Marks", icon = " " },
    { "g%", desc = "Matchup", icon = " " },
    { "g[", desc = "Move Left", icon = " " },
    { "g]", desc = "Move Right", icon = " " },
    { "gx", desc = "Browse", icon = " " },
  }, { mode = "n" })

  -- C-g prefix (AI)
  wk.add({
    { "<C-g>", group = "AI", icon = "󰚩 ", mode = { "n", "x", "i" } },
    { "<C-g>a", desc = "Avante ask", icon = "󰍩 ", mode = { "n", "x" } },
    { "<C-g><C-g>", desc = "Ask operator", icon = "󰒕 ", mode = "n" },
    { "<C-g><C-g>", desc = "Avante ask", icon = "󰍩 ", mode = "x" },
    { "<C-g>e", desc = "Edit operator", icon = "󰏫 ", mode = "n" },
    { "<C-g>e", desc = "Avante edit", icon = "󰏫 ", mode = "x" },
    { "<C-g>t", desc = "Avante toggle", icon = "󰊓 ", mode = "n" },
    { "<C-g>p", desc = "Avante history", icon = "󰋚 ", mode = "n" },
    { "<C-g>r", desc = "Rewrite", icon = "󰑕 ", mode = { "n", "i" } },
    { "<C-g>i", desc = "Implement", icon = " ", mode = { "n", "i" } },
  })
--                         
  --              ⛚ ⛛ ⎓ ⎇ ⌦ ⌧ ⌘   
  -- z prefix (scroll / fold) ⎋ ⫽       
  wk.add({
{ "<C-w>d", icon = "", desc = "Diagnostic" },
{ "<C-w>h", icon = "", desc = "Go to the left window" },
{ "<C-w>H", icon = "", desc = "Move window to far left" },
{ "<C-w>j", icon = "", desc = "Go to the down window" },
{ "<C-w>J", icon = "", desc = "Move window to far bottom" },
{ "<C-w>k", icon = "", desc = "Go to the up window" },
{ "<C-w>K", icon = "", desc = "Move window to far top" },
{ "<C-w>l", icon = "", desc = "Go to the right window" },
{ "<C-w>L", icon = "", desc = "Move window to far right" },
{ "<C-w>o", icon = "", desc = "Close all other windows" },
{ "<C-w>q", icon = "", desc = "Quit a window" },
{ "<C-w>s", icon = "", desc = "Split window" },
{ "<C-w>T", icon = "", desc = "Break out into a new tab" },
{ "<C-w>v", icon = "", desc = "Split window vertically" },
{ "<C-w>w", icon = "", desc = "Switch windows" },
{ "<C-w>x", icon = "", desc = "Swap current with next" },
{ "<C-w>+", icon = "", desc = "Increase height" },
{ "<C-w>-", icon = "", desc = "Decrease height" },
{ "<C-w><", icon = "", desc = "Decrease width" },
{ "<C-w>=", icon = "", desc = "Equally high and wide" },
{ "<C-w>>", icon = "", desc = "Increase width" },
  }, { mode = "n" })


  wk.add({
    { "zb", desc = "Scroll bottom", icon = " " },
    { "zt", desc = "Scroll top", icon = " " },
    { "zz", desc = "Scroll center", icon = "● " },
    { "zR", desc = "Open all folds", icon = "↗ " },
    { "zr", desc = "Open fold", icon = " " },
    { "zM", desc = "Close all folds", icon = "↙ " },
    { "zm", desc = "Close fold", icon = " " },
    { "z%", desc = "Matchup", icon = " " },
    { "z=", desc = "Spelling", icon = " " },
  }, { mode = "n" })

  -- localleader (\)
  local lt = '\\'
  wk.add({
    { lt .. "G", desc = "Glyph", icon = "󰀲 " },
    { lt .. ".", desc = "Scratch buffer", icon = "󰛳 " },
    { lt .. "S", desc = "Select scratch", icon = "󰛳 " },
    { lt .. "s", desc = "Scratchpad", icon = "󰛳 " },
    { lt .. "O", desc = "CursorLine", icon = " " },
    { lt .. "X", desc = "TSContext", icon = "󰅩 " },
    { lt .. "h", desc = "TSHighlight", icon = " " },
    { lt .. "H", desc = "Hipatterns", icon = " " },
    { lt .. "m", desc = "MiniMap", icon = " " },
    { lt .. "Z", desc = "Zoom", icon = " " },
    { lt .. "T", desc = "Trailspace", icon = " " },
    { lt .. "C", desc = "CursorWord", icon = " " },
    { lt .. "w", desc = "Wrap", icon = " " },
    { lt .. "c", desc = "Conceal", icon = " " },
    { lt .. "f", desc = "Cmdheight", icon = " " },
    { lt .. "V", desc = "Verbose", icon = " " },
    { lt .. "d", desc = "Diagnostic", icon = " " },
    { lt .. "L", desc = "LSP", icon = " " },
    { lt .. "l", desc = "Numbers", icon = " " },
    { lt .. "ct", desc = "Trim", icon = " " },
  }, { mode = "n" })
end

return M
