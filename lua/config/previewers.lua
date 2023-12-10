local M = {}

M.vim_buffer_cat = function(opts)
  opts = opts or {}
  -- return require("telescope.previewers").vim_buffer_cat.new(opts)
  -- pcall(_G["ddwrite"], { opts = opts, zzzzzzzzzzzzzzzzzzz = "zpzp" }, "___OOOO____0_", "a")
  return require("telescope.previewers").vim_buffer_cat.new(opts)
  -- return require("telescope.previewers").vij_buffer_cat.new(opts)
end

M.arg_preview = function(opts)
  -- local previewers = require("telescope.previewers")

  local putils = require("telescope.previewers.utils")
  local from_entry = require("telescope.from_entry")
  local conf = require("telescope.config").values
  -- P({ opts = opts })
  -- pcall(_G["ddwrite"], { opts = opts, ooo = "nooo", previewers = previewers or "zpzp" }, "___OOOO____0_", "a")
  return require("telescope.previewers").new_buffer_previewer({
    title = "Arg Preview",
    get_buffer_by_name = function(_, entry)
      return entry.value
    end,

    define_preview = function(self, entry, _)
      -- ddwrite({ init = "startttt" }, "____p0-1", "a")
      -- pcall(_G["ddwrite"], { foo = "bar", entry = entry or "zzz" }, "___OOOO____1_", "a")
      local file_name = entry.value
      -- local get_git_status_command = "git status -s -- " .. file_name
      -- local git_status = io.popen(get_git_status_command):read("*a")
      -- local git_status_short = string.sub(git_status, 1, 1)
      -- local git_status_short = 'ALAKI'
      -- if git_status_short ~= "" then
      local p = from_entry.path(entry, true)

      -- pcall(_G["ddwrite"], { entry = entry or "xx", p = p or "yy" }, "___OOOO_____2_", "a")

      conf.buffer_previewer_maker(p, self.state.bufnr, {
        bufname = self.state.bufname,
        winid = self.state.winid,
      })

      -- P({ fn = file_name, p = p })
      -- local defprev = require("easypick").previewers()
      -- pcall(_G["ddwrite"], { fn = file_name, p = p, default_previewers = defprev }, "___OOOO_____3_", "a")
      -- 	if p == nil or p == "" then
      -- 		return
      -- 	end
      -- 	putils.regex_highlighter(self.state.bufnr, "diff")
      -- putils.regex_highlighter(self.state.bufnr, "diff")
    end,
  })
end

-- M.hi_maker = function(filename, _, start, _)
--   pcall(_G["ddwrite"], { filename = filename, start = start }, "___OXXO____0_", "a")
  -- if get_file_stat(filename).type == "directory" then
  --   return list_dir(filename)
  -- end

  -- if 1 == vim.fn.executable("file") then
  --   local output = utils.get_os_command_output({ "file", "--mime-type", "-b", filename })
  --   local mime_type = vim.split(output[1], "/")[1]
  --   if mime_type ~= "text" then
  --     return { "echo", "Binary file found. These files cannot be displayed!" }
  --   end
  -- end

  -- if has_less then
  --   if start then
  --     return { "less", "-RS", string.format("+%s", start), vim.fn.expand(filename) }
  --   else
  --     return { "less", "-RS", vim.fn.expand(filename) }
  --   end
  -- else
  --   return {
  --     "cat",
  --     "--",
  --     vim.fn.expand(filename),
  --   }
  -- end
-- end

return M

-- 	putils.job_maker(
-- 		{ "git", "--no-pager", "diff", opts.base_branch .. "..HEAD", "--", file_name },
-- 		self.state.bufnr,
-- 		{
-- 			value = file_name,
-- 			bufname = self.state.bufname,
-- 		}
-- 	)
