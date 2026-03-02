return {
  "echasnovski/mini.files",
  dependencies = { "folke/which-key.nvim" },
  version = "*",
  keys = {
    {
      "<leader>e",
      function()
        local MiniFiles = require("mini.files")
        if not MiniFiles.close() then
          MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        end
      end,
      desc = "Files",
    },
  },
  init = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>e", desc = "Files", icon = " ", mode = "n" },
      { "g.", desc = "Toggle hidden", icon = " ", mode = "n" },
    })

    local function open_files(data)
      local directory = vim.fn.isdirectory(data.file) == 1

      if not directory then
        return
      end

      -- change to the directory
      vim.cmd.cd(data.file)

      -- open the tree
      require("mini.files").open(vim.api.nvim_buf_get_name(0), false)
    end
    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_files })

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesWindowUpdate",
      callback = function(args)
        vim.wo[args.data.win_id].number = true
        vim.wo[args.data.win_id].relativenumber = true
      end,
    })
  end,
  config = function()

    local icon_prefix = function(fs_entry)
      if fs_entry.fs_type == 'directory' then
        return ' ', 'MiniFilesDirectory'
      end
      return MiniFiles.default_prefix(fs_entry)
    end
    require("mini.files").setup({
      content = {
        prefix = icon_prefix
      },
      windows = {
        preview = true,
        max_number = math.huge,
        width_focus = 30,
        width_nofocus = 20,
        width_preview = 25,
      },
      mappings = {
        -- synchronize = "<leader>bw",
      },
      use_as_default_explorer = true,
    })

    local show_dotfiles = true

    local filter_show = function(fs_entry) return true end

    local filter_hide = function(fs_entry)
      return not vim.startswith(fs_entry.name, '.')
    end

    local toggle_dotfiles = function()
      show_dotfiles = not show_dotfiles
      local new_filter = show_dotfiles and filter_show or filter_hide
      MiniFiles.refresh({ content = { filter = new_filter } })
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = args.data.buf_id })
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesActionRename",
      callback = function(event)
        require("metaory.plugins.lsp.handlers").on_rename(event.data.from, event.data.to)
      end,
    })

    -- auto delete buffers for deteled files
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local closedBuffers = {}
        vim
          .iter(vim.api.nvim_list_bufs())
          :filter(function(bufnr)
            local valid = vim.api.nvim_buf_is_valid(bufnr)
            local loaded = vim.api.nvim_buf_is_loaded(bufnr)
            return valid and loaded
          end)
          :filter(function(bufnr)
            local bufPath = vim.api.nvim_buf_get_name(bufnr)
            local doesNotExist = vim.loop.fs_stat(bufPath) == nil
            local notSpecialBuffer = vim.bo[bufnr].buftype == ""
            local notNewBuffer = bufPath ~= ""
            return doesNotExist and notSpecialBuffer and notNewBuffer
          end)
          :each(function(bufnr)
          local bufName = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))
          table.insert(closedBuffers, bufName)
          vim.api.nvim_buf_delete(bufnr, { force = true })
        end)
        if #closedBuffers == 0 then
          return
        end

        if #closedBuffers == 1 then
          vim.notify("Buffer closed", closedBuffers[1])
        else
          local text = "- " .. table.concat(closedBuffers, "\n- ")
          vim.notify("Buffers closed", text)
        end
      end,
    })

    local theme = require("metaory.plugins.theme")
    local colors = theme.colors()
    if colors then
      vim.api.nvim_set_hl(0, "MiniFilesDirectory", { fg = colors.blue })
    end
  end,
}
