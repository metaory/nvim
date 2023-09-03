local M = {}

function M.wrap(func, argc)
  return function(...)
    local co = coroutine.running()
    if not co then
      error("wrapped functions must be called in a coroutine")
    end

    local args = { ... }
    args[argc] = function(...)
      if co == coroutine.running() then
        error("callback called in same coroutine as calling function")
      end
      coroutine.resume(co, ...)
    end
    func(unpack(args, 1, argc))
    return coroutine.yield()
  end
end

function M.void(func)
  return function(...)
    if coroutine.running() then
      return func(...)
    else
      return coroutine.wrap(func)(...)
    end
  end
end

M.scheduler = M.wrap(vim.schedule, 1)

return M
