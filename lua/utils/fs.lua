local Fs = {}

local PATH = {}
PATH.CONFIG = vim.fn.stdpath "config"
PATH.LUA = PATH.CONFIG .. "/lua"

Fs.readdir = function(path)
  local fullPath = PATH.LUA .. "/" .. path
  local dir = vim.fn.readdir(fullPath)
  return dir
end

Fs.getCurDir = function()
  local substitute = vim.fn.substitute
  local getcwd = vim.fn.getcwd
  return substitute(getcwd(), "^.*/", "", "")
end

return Fs
