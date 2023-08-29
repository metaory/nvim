local H = {}

H.expand_callable = function(x)
  if vim.is_callable(x) then
    return x()
  end
  return x
end

return H
