return function()
  vim.ui.input({ prompt = ": " }, function(command)
    if not command or command == "" then
      return
    end

    local result = vim.api.nvim_exec2(command:gsub("^:", ""), { output = true }).output
    local lines = vim.split(result, "\n", { trimempty = true })

    local splitright = vim.o.splitright

    vim.o.splitright = true
    vim.cmd.vnew()
    vim.o.splitright = splitright

    local bufnr = vim.api.nvim_get_current_buf()

    vim.bo[bufnr].buftype = "nofile"
    vim.bo[bufnr].bufhidden = "wipe"
    vim.bo[bufnr].swapfile = false
    vim.bo[bufnr].filetype = "vim"

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

    vim.cmd.ColorizerAttachToBuffer()

    if command:match("^%s*highlight!?%s*$") then
      local ns = vim.api.nvim_create_namespace("inspect_highlight")

      for lnum, line in ipairs(lines) do
        local name = line:match("^%s*(%S+)%s+xxx")

        if name and vim.fn.hlexists(name) == 1 then
          local start = line:find(name, 1, true)

          vim.api.nvim_buf_set_extmark(bufnr, ns, lnum - 1, start - 1, {
            end_col = start - 1 + #name,
            hl_group = name,
          })
        end
      end
    end

    vim.bo[bufnr].modifiable = false

    vim.keymap.set("n", "q", "<cmd>close<cr>", {
      buffer = bufnr,
      nowait = true,
      silent = true,
      desc = "Close inspect buffer",
    })
  end)
end

-- local filetype = command:match("^%s*highlight") and "vim" or "text"
