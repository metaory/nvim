return function()
  local filenameAndLine = vim.fn.expand("%:t") .. ":" .. vim.fn.line(".")
  local script = [[
    tell application "Arc"
      activate
      tell application "System Events"
        keystroke "i" using {command down, option down}
        delay 0.5
        keystroke "p" using command down
        delay 1
        keystroke "<<filenameAndLine>>"
      end tell
    end tell
  ]]
  vim.system({ "osascript", "-e", script:gsub("<<filenameAndLine>>", filenameAndLine) })
end
