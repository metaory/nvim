return {

  -- {
  --   "mfussenegger/nvim-dap",
  --   cmd = { "DapContinue", "DapInstall", "DapUninstall" },
  --   dependencies = {
  --     -- fancy UI for the debugger
  --     {
  --       "rcarriga/nvim-dap-ui",
  --     keys = {
  --       { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
  --       { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
  --     },
  --       opts = {},
  --     },
  --   },

  -- virtual text for the debugger
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {
      enabled = true, -- enable this plugin (the default)
      enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
      highlight_changed_variables = false, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
      highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
      show_stop_reason = true, -- show stop reason when stopped for exceptions
      commented = false, -- prefix virtual text with comment string
      only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
      all_references = false, -- show virtual text on all all references of the variable (not only definitions)
      clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
      --- A callback that determines how a variable is displayed or whether it should be omitted
      --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
      --- @param buf number
      --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
      --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
      --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
      --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
      display_callback = function(variable, buf, stackframe, node, options)
        if options.virt_text_pos == "inline" then
          return " = " .. variable.value
        else
          return variable.name .. " = " .. variable.value
        end
      end,
      -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
      virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",

      -- experimental features:
      all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
      virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
      virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
      -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
    },
  },

  -- which key integration
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>d"] = { name = "+debug" },
        ["<leader>da"] = { name = "+adapters" },
        ["<leader>ds"] = {
          name = "+Search",
          c = { ":Telescope dap commands<CR>", "Dap Commands" },
          C = { ":Telescope dap configurations<CR>", "Dap Configurations" },
          v = { ":Telescope dap variables<CR>", "Dap Variables" },
          l = { ":Telescope dap list_breakpoints<CR>", "Dap Breakpoints" },
          f = { ":Telescope dap frames<CR>", "Dap Frames" },
        },
      },
    },
  },

  -- mason.nvim integration
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = "mason.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
        js = function(config)
          config.adapters = {
            type = "executable",
            command = vim.fn.exepath("js-debug-adapter"),
          }
        end,
        node2 = function(config)
          config.adapters = {
            type = "executable",
            command = vim.fn.exepath("node-debug2-adapter"),
          }
          config.configurations = {
            {
              name = "Node2: Launch",
              type = "node2",
              request = "launch",
              program = "${file}",
              cwd = vim.fn.getcwd(),
              sourceMaps = true,
              protocol = "inspector",
              console = "integratedTerminal",
            },
            {
              -- For this to work you need to make sure the node process is started with the `--inspect` flag.
              name = "Node2: Attach to process",
              type = "node2",
              request = "attach",
              processId = require("dap.utils").pick_process,
            },
          }
        end,
        firefox = function(config)
          config.adapters = {
            type = "executable",
            command = vim.fn.exepath("firefox-debug-adapter"),
            executable = { command = "firefox-developer-edition" },
          }
          config.configurations = {
            {
              name = "Firefox: Debug",
              type = "firefox",
              request = "launch",
              reAttach = true,
              url = "http://localhost:3000",
              webRoot = "${workspaceFolder}",
              firefoxExecutable = vim.fn.exepath("firefox-developer-edition"),
            },
          }
        end,
      },

      ensure_installed = { "stylua", "jq", "js", "node2", "firefox" },
    },
    -- stylua: ignore
    keys = {
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },
  },
}
