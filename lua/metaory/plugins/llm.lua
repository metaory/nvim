return {
  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    config = function()
      vim.g.opencode_opts = {}

      vim.keymap.set({ "n", "x" }, "<C-x>i", function()
        require("opencode").ask("@this: ")
      end, { desc = "Ask OpenCode" })

      vim.keymap.set({ "n", "x" }, "<C-x><C-p>", function()
        require("opencode").select()
      end, { desc = "OpenCode select" })

      vim.keymap.set({ "n", "x" }, "<C-x>o", function()
        return require("opencode").operator("@this ")
      end, { expr = true, desc = "Send range to OpenCode" })

      -- vim.keymap.set({ "n" }, "<C-x>z", function()
      --   return require("opencode").operator("@this ") .. "_"
      -- end, { expr = true, desc = "Send line to OpenCode" })
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
}
