---@param config {args?:string[]|fun():string[]?}
local function get_args(config)
  local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
  config = vim.deepcopy(config)
  ---@cast args string[]
  config.args = function()
    local new_args = vim.fn.input("Run with args: ", table.concat(args, " ")) --[[@as string]]
    return vim.split(vim.fn.expand(new_args) --[[@as string]], " ")
  end
  return config
end

local js_fts = { "javascript", "javascriptreact", "typescript", "typescriptreact" }

local function setup_js(dap)
  dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "js-debug-dap",
      args = { "${port}" },
    },
  }
  dap.adapters.node = function(cb, config)
    if config.type == "node" then
      config.type = "pwa-node"
    end
    local adapter = dap.adapters["pwa-node"]
    if type(adapter) == "function" then
      adapter(cb, config)
      return
    end
    cb(adapter)
  end

  local vscode = require("dap.ext.vscode")
  vscode.type_to_filetypes.node = js_fts
  vscode.type_to_filetypes["pwa-node"] = js_fts

  local configs = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
  }
  for _, ft in ipairs(js_fts) do
    dap.configurations[ft] = dap.configurations[ft] or vim.deepcopy(configs)
  end
end

local function setup_lua(dap)
  dap.adapters.nlua = function(callback, config)
    callback({
      type = "server",
      host = config.host or "127.0.0.1",
      port = config.port or 8086,
    })
  end
  dap.configurations.lua = {
    {
      type = "nlua",
      request = "attach",
      name = "Attach to Neovim",
    },
  }
end

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "jbyuki/one-small-step-for-vimkind",
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        -- stylua: ignore
        keys = {
          { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
          { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = { "n", "v" } },
        },
        opts = {
          icons = {
            collapsed = "",
            current_frame = "",
            expanded = "",
          },
          layouts = {
            {
              elements = { "repl", "stacks", "breakpoints", "watches" },
              size = 30,
              position = "left",
            },
            {
              elements = { "scopes" },
              size = 10,
              position = "bottom",
            },
          },
        },
        config = function(_, opts)
          local dap, dapui = require("dap"), require("dapui")
          dapui.setup(opts)
          dap.listeners.before.attach.dapui_config = function()
            dapui.open()
          end
          dap.listeners.before.launch.dapui_config = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
          end
          dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
          end
        end,
      },
      { "theHamsta/nvim-dap-virtual-text", opts = {} },
      {
        "leoluz/nvim-dap-go",
        config = function()
          require("dap-go").setup({ delve = { path = "dlv" } })
        end,
        -- stylua: ignore
        keys = {
          { "<leader>dt", function() require("dap-go").debug_test() end, desc = "Debug Test" },
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
      { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>dn", function() require("osv").launch({ port = 8086 }) end, desc = "Launch Neovim Lua" },
      { "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>dT", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },
    config = function()
      local icons = {
        Stopped = { " ", "DiagnosticWarn", "DapStoppedLine" },
        Breakpoint = " ",
        BreakpointCondition = " ",
        BreakpointRejected = { " ", "DiagnosticError" },
        LogPoint = ".>",
      }
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
      for name, sign in pairs(icons) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end
      local dap = require("dap")
      setup_js(dap)
      setup_lua(dap)
    end,
  },
  {
    "evanmcpheron/rocketlog.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "folke/snacks.nvim",
    },
    init = function()
      vim.g.rocketlog_disable_auto_setup = true
    end,
    config = function()
      require("rocketlog").setup({
        -- under <leader>c (code), same letters as upstream defaults
        keymaps = {
          motions = "<leader>cl",
          word = "<leader>cL",
          error_motions = "<leader>ce",
          error_word = "<leader>cE",
          warn_motions = "<leader>cw",
          warn_word = "<leader>cW",
          info_motions = "<leader>ci",
          info_word = "<leader>cI",
          delete_below = "<leader>cd",
          delete_above = "<leader>cD",
          delete_all_buffer = "<leader>ca",
          find = "<leader>cf",
          dashboard = "<leader>cc",
        },
      })
    end,
  },
}
