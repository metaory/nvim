local function layout_panes(cell, panes)
  if cell.t ~= "p" then
    for _, child in ipairs(cell.c or {}) do
      layout_panes(child, panes)
    end
    return
  end
  panes[#panes + 1] = {
    id = tonumber(tostring(cell.I or cell.i):match("%d+")),
    x = cell.x,
    y = cell.y,
    width = cell.w,
    height = cell.h,
  }
end

-- tmux 3.8 #{window_layout} is JSON. Plugin still expects the old string.
local function json_layout(display)
  if type(display) ~= "string" or display:sub(1, 1) ~= "{" then
    return
  end
  local ok, data = pcall(vim.json.decode, display)
  local root = ok and data and data.L
  if type(root) ~= "table" then
    return
  end
  local panes = {}
  layout_panes(root, panes)
  return #panes > 0 and { width = root.w, height = root.h, panes = panes } or nil
end

return {
  "aserowy/tmux.nvim",
  config = function()
    require("tmux").setup({
      copy_sync = {
        -- enables copy sync. by default, all registers are synchronized.
        -- to control which registers are synced, see the `sync_*` options.
        enable = true,

        -- ignore specific tmux buffers e.g. buffer0 = true to ignore the
        -- first buffer or named_buffer_name = true to ignore a named tmux
        -- buffer with name named_buffer_name :)
        ignore_buffers = { empty = false },

        -- TMUX >= 3.2: all yanks (and deletes) will get redirected to system
        -- clipboard by tmux
        redirect_to_clipboard = false,

        -- offset controls where register sync starts
        -- e.g. offset 2 lets registers 0 and 1 untouched
        register_offset = 0,

        -- overwrites vim.g.clipboard to redirect * and + to the system
        -- clipboard using tmux. If you sync your system clipboard without tmux,
        -- disable this option!
        sync_clipboard = false,

        -- synchronizes registers *, +, unnamed, and 0 till 9 with tmux buffers.
        sync_registers = false,

        -- synchronizes registers when pressing p and P.
        sync_registers_keymap_put = false,

        -- synchronizes registers when pressing (C-r) and ".
        sync_registers_keymap_reg = true,

        -- syncs deletes with tmux clipboard as well, it is adviced to
        -- do so. Nvim does not allow syncing registers 0 and 1 without
        -- overwriting the unnamed register. Thus, ddp would not be possible.
        sync_deletes = true,

        -- syncs the unnamed register with the first buffer entry from tmux.
        sync_unnamed = true,
      },
      navigation = {
        -- cycles to opposite pane while navigating into the border
        cycle_navigation = true,

        -- enables default keybindings (C-hjkl) for normal mode
        enable_default_keybindings = true,

        -- prevents unzoom tmux when navigating beyond vim border
        persist_zoom = false,
      },
      resize = {
        -- enables default keybindings (A-hjkl) for normal mode
        enable_default_keybindings = false,

        -- sets resize steps for x axis
        resize_step_x = 1,

        -- sets resize steps for y axis
        resize_step_y = 1,
      },
      swap = {
        -- cycles to opposite pane while navigating into the border
        cycle_navigation = false,

        -- enables default keybindings (C-A-hjkl) for normal mode
        enable_default_keybindings = false,
      },
    })
    local parse = require("tmux.layout.parse")
    local legacy = parse.parse
    parse.parse = function(display)
      return json_layout(display) or legacy(display)
    end
  end,
}
--   "RyanMillerC/better-vim-tmux-resizer",
--   "christoomey/vim-tmux-navigator",

--[[

--]]
