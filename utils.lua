local M = {}

M.split = function(str, regexp)
  local res = {}
  for s in string.gmatch(str, regexp) do
    table.insert(res, s)
  end
  return table.unpack(res)
end

M.contains = function(tb, x)
  local found = false
  for _, v in pairs(tb) do
    if v == x then
      found = true
    end
  end
  return found
end

M.loadPlugins = function(list)
  local path = "custom.plugins"
  local plugins = {}

  for _, fileName in pairs(list) do
    local plugin = require(path .. "." .. fileName)
    table.insert(plugins, plugin)
  end

  return plugins
end

M.loadLangs = function(pluginName, filter)
  local langs = require "custom.langs"
  local contains = M.contains

  local res = {}

  for _, configs in pairs(langs) do
    if configs[pluginName] then
      for _, value in pairs(configs[pluginName]) do
        local isTable = type(value) == "table"
        local isFiltered = isTable and value.filter and contains(value.filter, filter) or false
        local val = isTable and value[1] or value
        if not contains(res, val) and not isFiltered then
          table.insert(res, val)
        end
      end
    end

    if pluginName == "mason" then
      for _, config in pairs(configs) do
        for _, value in pairs(config) do
          local val = type(value) == "table" and value["mason"] or nil
          if val then
            if not contains(res, val) then
              table.insert(res, val)
            end
          end
        end
      end
    end
  end

  return res
end

M.execute = function()
  local nvterm = require "nvterm.terminal"
  local term = vim.g.term

  -- https://vimdoc.sourceforge.net/htmldoc/cmdline.html#filename-modifiers
  -- local fileName = vim.fn.expand "%:t"
  local fileName = vim.fn.expand "%:p:~:."
  local fileType = vim.bo.filetype

  local execute = {}

  execute.javascript = function(name)
    nvterm.toggle(term)
    nvterm.send("node " .. name, term)
    vim.cmd "startinsert"
  end

  execute.typescript = function(name)
    nvterm.toggle(term)
    nvterm.send("deno run " .. name, term)
    vim.cmd "startinsert"
  end

  execute.pascal = function(name)
    nvterm.toggle(term)
    nvterm.send("fpc " .. name, term)
    local exeName = string.sub(name, 1, -5)
    nvterm.send("./" .. exeName, term)
    vim.cmd "startinsert"
  end

  execute.terminal = function(_)
    nvterm.toggle(term)
  end

  execute.other = function(type)
    return function(name)
      print("No execute defined: Type '" .. type .. "', File: '" .. name .. "'")
    end
  end

  local fn = execute[fileType] or execute.other(fileType)
  fn(fileName)
end

return M
