return {
  -- {
  --   "mg979/vim-visual-multi",
  --   -- cmd = { "<Plug>(VM-Find-Under)" },
  --   -- lazy = false,
  -- },
  {
    "smoka7/multicursors.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "smoka7/hydra.nvim",
    },
    cmd = { "MCstart" },
    -- cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>rm",
        "<cmd>MCstart<cr>",
        desc = "Multi Cursor",
      },
    },
    opts = {
      hint_config = {
        type = "window",
        border = "none",
        position = "bottom",
      },
      generate_hints = {
        normal = true,
        insert = true,
        extend = true,
      },
    },
    config = function(_, opts)
      require("multicursors").setup(opts)
    end,
  },
}

-- multicursor -----------------------------------------
-- local I = require("multicursors.insert_mode")
-- local insert_keys = {
--   ["<BS>"] = { method = I.BS_method, opts = { desc = "backspace" } },
--   ["<CR>"] = { method = I.CR_method, opts = { desc = "newline" } },
--   ["<Del>"] = { method = I.Del_method, opts = { desc = "delete char" } },
--
--   ["<C-w>"] = {
--     method = I.C_w_method,
--     opts = {
--       desc = "delete word backward",
--     },
--   },
--   ["<C-BS>"] = {
--     method = I.C_w_method,
--     opts = { desc = "delete word backward" },
--   },
--   ["<C-u>"] = {
--     method = I.C_u_method,
--     opts = { desc = "delete till start of line" },
--   },
--   ["<C-j>"] = { method = I.CR_method, opts = { desc = "new line" } },
--
--   ["<C-Right>"] = { method = I.C_Right, opts = { desc = "word forward" } },
--   ["<C-Left>"] = { method = I.C_Left, opts = { desc = "word backward" } },
--
--   ["<Esc>"] = { method = nil, opts = { desc = "exit" } },
--   ["<C-c>"] = { method = nil, opts = { desc = "exit" } },
--
--   ["<End>"] = {
--     method = I.End_method,
--     opts = { desc = "move to end of line" },
--   },
--   ["<Home>"] = {
--     method = I.Home_method,
--     opts = { desc = "move to start of line" },
--   },
--   ["<Right>"] = { method = I.Right_method, opts = { desc = "move right" } },
--   ["<Left>"] = { method = I.Left_method, opts = { desc = "move left" } },
--   ["<Down>"] = { method = I.Down_method, opts = { desc = "move down" } },
--   ["<Up>"] = { method = I.UP_method, opts = { desc = "move up" } },
-- }
-- require("multicursors").setup(vim.tbl_deep_extend("force", opts, { insert_keys = insert_keys }))

-- HYDRA -----------------------------------------
--       local Hydra = require("hydra")
--       local cmd = require("hydra.keymap-util").cmd
--
--       local hint = [[
--                  _f_: files       _m_: marks
--    🭇🬭🬭🬭🬭🬭🬭🬭🬭🬼    _o_: old files   _g_: live grep
--   🭉🭁🭠🭘    🭣🭕🭌🬾   _p_: projects    _/_: search in file
--   🭅█ ▁     █🭐
--   ██🬿      🭊██   _r_: resume      _u_: undotree
--  🭋█🬝🮄🮄🮄🮄🮄🮄🮄🮄🬆█🭀  _h_: vim help    _c_: execute command
--  🭤🭒🬺🬹🬱🬭🬭🬭🬭🬵🬹🬹🭝🭙  _k_: keymaps     _;_: commands history
--                  _O_: options     _?_: search history
--  ^
--                  _<Enter>_: Telescope           _<Esc>_
-- ]]
--
--       Hydra({
--         name = "Telescope",
--         hint = hint,
--         config = {
--           color = "teal",
--           invoke_on_body = true,
--           hint = {
--             position = "middle",
--             border = "rounded",
--           },
--         },
--         mode = "n",
--         body = "<Leader>f",
--         heads = {
--           { "f", cmd("Telescope find_files") },
--           { "g", cmd("Telescope live_grep") },
--           { "o", cmd("Telescope oldfiles"), { desc = "recently opened files" } },
--           { "h", cmd("Telescope help_tags"), { desc = "vim help" } },
--           { "m", cmd("MarksListBuf"), { desc = "marks" } },
--           { "k", cmd("Telescope keymaps") },
--           { "O", cmd("Telescope vim_options") },
--           { "r", cmd("Telescope resume") },
--           { "p", cmd("Telescope projects"), { desc = "projects" } },
--           { "/", cmd("Telescope current_buffer_fuzzy_find"), { desc = "search in file" } },
--           { "?", cmd("Telescope search_history"), { desc = "search history" } },
--           { ";", cmd("Telescope command_history"), { desc = "command-line history" } },
--           { "c", cmd("Telescope commands"), { desc = "execute command" } },
--           { "u", cmd("silent! %foldopen! | UndotreeToggle"), { desc = "undotree" } },
--           { "<Enter>", cmd("Telescope"), { exit = true, desc = "list all pickers" } },
--           { "<Esc>", nil, { exit = true, nowait = true } },
--         },
--       })

-- local Hydra = require("hydra")
-- Hydra({
--   name = "Side scroll",
--   mode = "n",
--   body = "z",
--   heads = {
--     { "h", "5zh" },
--     { "l", "5zl", { desc = "←/→" } },
--     { "H", "zH" },
--     { "L", "zL", { desc = "half screen ←/→" } },
--   },
-- })
