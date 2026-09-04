return {
  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    enabled = false,
    dependencies = { "folke/snacks.nvim" },
    config = function()
      local opencode_cmd = "opencode --port"
      ---@type snacks.terminal.Opts
      local opencode_term_opts = {
        win = { position = "right", enter = false },
      }

      ---@type opencode.Opts
      vim.g.opencode_opts = {
        server = {
          start = function()
            require("snacks.terminal").open(opencode_cmd, opencode_term_opts)
          end,
        },
      }

      vim.keymap.set({ "n", "x" }, "<C-g>a", function()
        require("opencode").ask("@this: ")
      end, { desc = "Ask OpenCode", silent = true })

      vim.keymap.set({ "n", "x" }, "<C-g>p", function()
        require("opencode").select()
      end, { desc = "OpenCode select", silent = true })

      vim.keymap.set({ "n", "x" }, "<C-g><C-g>", function()
        return require("opencode").operator("@this ")
      end, { desc = "Send @this (operator: motion/selection)", expr = true, silent = true })

      vim.keymap.set({ "n", "t" }, "<C-g>t", function()
        require("snacks.terminal").toggle(opencode_cmd, opencode_term_opts)
      end, { desc = "Toggle OpenCode", silent = true })

      vim.keymap.set("n", "<S-C-u>", function()
        require("opencode").command("session.half.page.up")
      end, { desc = "OpenCode scroll up", silent = true })

      vim.keymap.set("n", "<S-C-d>", function()
        require("opencode").command("session.half.page.down")
      end, { desc = "OpenCode scroll down", silent = true })

      vim.api.nvim_create_autocmd("User", {
        pattern = "OpencodeEvent:tui.command.execute",
        callback = function(args)
          ---@type opencode.server.Event
          local event = args.data.event
          if event.properties.command == "prompt.submit" then
            local win = require("snacks.terminal").get(opencode_cmd, { create = false })
            if win then
              win:show()
            end
          end
        end,
      })
    end,
  },
  {
    "robitx/gp.nvim",
    config = function()
      local system_prompt = "You are an AI working as a code editor.\n\n"
        .. "Do not include any comments. no comments anywhere.\n"
        .. "Do not include use strict.\n"
        .. "Do not use var or let, use const instead always.\n"
        .. "If you are unsure do not guess and say you do not know instead.\n"
        .. "Ask question if you need clarification to provide better answer.\n"
        .. "Think deeply and carefully from first principles step by step.\n"
        .. "Zoom out first to see the big picture and then zoom in to details.\n"
        .. "Use Socratic method to improve your thinking and coding skills.\n"
        .. "Use Functional, Declarative, Proxy Style.\n"
        .. "Use Modern and Experimental features, dont include compatibility and polyfills.\n"
        .. "Aim for Minimal, Concise and Terse Code.\n"
        .. "Avoid using else and else if conditions, instead return faulty early.\n"
        .. "Avoid Unnecessary Verbosity.\n"
        .. "Avoid Complex Solutions.\n"
        .. "Avoid using regex where possible.\n"
        .. "Avoid try...catch blocks.\n"
        .. "Avoid using traditional for loops.\n"
        .. "Only answer with code snippet.\n"

      require("gp").setup({
        agents = {
          {
            name = "CodeGPT4o",
            disable = true,
          },
          {
            name = "CodeGPT-o3-mini",
            disable = true,
          },
          {
            name = "CodeGPT4o-mini",
            disable = true,
          },
          -- ########################################
          {
            provider = "openai",
            name = "CodeGPT-o4-mini",
            chat = false,
            command = true,
            model = { model = "o4-mini", temperature = 0.2, top_p = 1 },
            system_prompt = system_prompt,
          },
          {
            provider = "openai",
            name = "CodeGPT-5.4-mini",
            chat = false,
            command = true,
            model = { model = "gpt-5.4-mini", temperature = 0.2, top_p = 1 },
            system_prompt = system_prompt,
          },
          {
            provider = "openai",
            name = "CodeGPT-5.6-Luna",
            chat = false,
            command = true,
            model = { model = "gpt-5.6-luna" },
            system_prompt = system_prompt,
          },
          {
            provider = "openai",
            name = "CodeGPT-5.6-Terra",
            chat = false,
            command = true,
            model = { model = "gpt-5.6-terra" },
            system_prompt = system_prompt,
          },
          -- {
          --   provider = "xai",
          --   name = "grok4.5",
          --   chat = false,
          --   command = true,
          --   model = { model = "grok-5-6" },
          --   system_prompt = system_prompt,
          -- },
          -- {
          --   provider = "openai",
          --   name = "CodeGPT5.6-terra",
          --   chat = false,
          --   command = true,
          --   model = { model = "gpt-5.6-terra" },
          --   system_prompt = require("gp.defaults").code_system_prompt,
          -- },
          -- {
          --   provider = "openai",
          --   name = "CodeGPT5.4-mini",
          --   chat = false,
          --   command = true,
          --   model = { model = "gpt-5.4-mini" },
          --   system_prompt = require("gp.defaults").code_system_prompt,
          -- },
        },
      })
      -- system_prompt = "Please return ONLY code snippets.\nSTART AND END YOUR ANSWER WITH:\n\n```",

      vim.keymap.set(
        { "n", "i" },
        "<C-g>r",
        "<cmd>GpRewrite ~<cr>",
        { noremap = true, silent = true, nowait = true, desc = "Rewrite" }
      )
      vim.keymap.set(
        { "n", "i" },
        "<C-g>i",
        "<cmd>GpImplement ~<cr>",
        { noremap = true, silent = true, nowait = true, desc = "Implement" }
      )
    end,
  },
  {
    "avante-corp/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "folke/snacks.nvim" },
    opts = {
      provider = "vercel",
      mode = "agentic",
      instructions_file = "avante.md",
      providers = {
        vercel = {
          __inherited_from = "openai",
          endpoint = "https://ai-gateway.vercel.sh/v1",
          api_key_name = "AI_GATEWAY_API_KEY",
          model = "zai/glm-5.3-flash",
          model_names = {
            "zai/glm-5.3-flash",
            "alibaba/qwen3.8-flash",
            "alibaba/qwen3.7-flash",
          },
          use_response_api = false,
          parse_messages = function(self, opts)
            local ok = { system = true, user = true, assistant = true, tool = true, developer = true }
            return vim.tbl_filter(function(msg)
              return ok[msg.role]
            end, require("avante.providers.openai").parse_messages(self, opts))
          end,
        },
        openai = {
          model = "gpt-5.6-luna",
          model_names = { "gpt-5.6-luna", "gpt-5.6-terra", "gpt-5.4-mini", "o4-mini" },
          use_response_api = true,
        },
        morph = {
          model = "morph-v3-large",
        },
      },
      behaviour = {
        auto_suggestions = false,
        auto_set_keymaps = false,
        enable_fastapply = true,
      },
      selector = { provider = "snacks" },
      input = { provider = "snacks" },
      windows = { position = "right" },
      mappings = {
        submit = { normal = "<CR>", insert = "<CR>" },
      },
    },
    config = function(_, opts)
      require("avante").setup(opts)
      local api = require("avante.api")

      local function lines_of(l1, l2)
        if l1 > l2 then
          l1, l2 = l2, l1
        end
        return l1, l2
      end

      local function op_range()
        local a, b = vim.api.nvim_buf_get_mark(0, "["), vim.api.nvim_buf_get_mark(0, "]")
        return lines_of(a[1], b[1])
      end

      local function visual_range()
        if vim.fn.mode():find("[vV\22]") then
          return lines_of(vim.fn.line("v"), vim.fn.line("."))
        end
        return lines_of(vim.fn.line("'<"), vim.fn.line("'>"))
      end

      local function ask_lines(l1, l2)
        local lines = vim.api.nvim_buf_get_lines(0, l1 - 1, l2, false)
        local path = vim.fn.expand("%:p")
        api.ask({
          selection = require("avante.selection_result"):new(
            path,
            require("avante.utils").get_filetype(path),
            table.concat(lines, "\n"),
            require("avante.range"):new({ lnum = l1, col = 1 }, { lnum = l2, col = #(lines[#lines] or "") })
          ),
        })
      end

      local op = {}
      function op.ask()
        ask_lines(op_range())
      end
      function op.edit()
        api.edit(nil, op_range())
      end
      package.loaded["metaory.avante_op"] = op

      local function pending(name)
        return function()
          vim.go.operatorfunc = "v:lua.require'metaory.avante_op'." .. name
          return "g@"
        end
      end

      vim.keymap.set("n", "<C-g>a", function()
        api.ask()
      end, { desc = "Avante ask", silent = true })
      vim.keymap.set("x", "<C-g>a", function()
        ask_lines(visual_range())
      end, { desc = "Avante ask", silent = true })
      vim.keymap.set("n", "<C-g><C-g>", pending("ask"), {
        expr = true,
        desc = "Avante ask (operator)",
        silent = true,
      })
      vim.keymap.set("x", "<C-g><C-g>", function()
        ask_lines(visual_range())
      end, { desc = "Avante ask", silent = true })
      vim.keymap.set("n", "<C-g>e", pending("edit"), {
        expr = true,
        desc = "Avante edit (operator)",
        silent = true,
      })
      vim.keymap.set("x", "<C-g>e", function()
        api.edit(nil, visual_range())
      end, { desc = "Avante edit", silent = true })
      vim.keymap.set("n", "<C-g>t", "<cmd>AvanteToggle<cr>", { desc = "Avante toggle", silent = true })
      vim.keymap.set("n", "<C-g>p", "<cmd>AvanteHistory<cr>", { desc = "Avante history", silent = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "AvanteInput", "AvantePromptInput" },
        callback = function(ev)
          for _, key in ipairs({ "<M-s>", "<S-CR>" }) do
            vim.keymap.set("i", key, "<CR>", { buffer = ev.buf, remap = true, silent = true, desc = "Avante submit" })
          end
        end,
      })
    end,
  },
}
