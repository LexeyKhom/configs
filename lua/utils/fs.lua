local Fs = {}

Fs.readdir = function(path)
  local CONFIG_PATH = vim.fn.stdpath "config" .. "/lua/"
  local fullPath = CONFIG_PATH .. path
  local dir = vim.fn.readdir(fullPath)
  return dir
end

Fs.getCurDir = function()
  local substitute = vim.fn.substitute
  local getcwd = vim.fn.getcwd
  return substitute(getcwd(), "^.*/", "", "")
end

return Fs
