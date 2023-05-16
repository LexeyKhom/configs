local M = {}

M.loadPlugins = function(list)
  local path = "custom.plugins"
  local plugins = {}

  for _, fileName in pairs(list) do
    local plugin = require(path .. "." .. fileName)
    table.insert(plugins, plugin)
  end

  return plugins
end

return M
