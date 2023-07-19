local M = {}

M.unpack = function(tb, i)
  i = i or 1
  if i < #tb then
    return tb[i], M.unpack(tb, i + 1)
  end
  if i == #tb then
    return tb[i]
  end
end

M.split = function(str, regexp)
  local res = {}
  for s in string.gmatch(str, regexp) do
    table.insert(res, s)
  end
  return M.unpack(res)
end

M.join = function(tb, str)
  return table.concat(tb, str)
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

M.loadPlugins = function(path, list)
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

  local results = {}
  local settings = {}
  for _, lang in pairs(langs) do
    if lang[pluginName] then
      local pluginConfigs = lang[pluginName]
      for _, config in pairs(pluginConfigs) do
        local isTable = type(config) == "table"
        local isFiltered = isTable and config.filter and contains(config.filter, filter)
        local result = isTable and config[1] or config
        local setting = isTable and config.setting or {}
        if not isFiltered and not contains(results, result) then
          table.insert(results, result)
          settings[result] = setting
        end
      end
    end
    if pluginName == "mason" then
      for _, pluginConfigs in pairs(lang) do
        for _, config in pairs(pluginConfigs) do
          local val = type(config) == "table" and config["mason"] or nil
          if val and not contains(results, val) then
            table.insert(results, val)
          end
        end
      end
    end
  end
  return results, settings
end

M.execute = function()
  local nvterm = require "nvterm.terminal"
  local term = vim.g.term

  -- (https://vimdoc.sourceforge.net/htmldoc/cmdline.html#filename-modifiers)
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

  execute.html = function(name)
    nvterm.toggle(term)
    nvterm.send("firefox '" .. name .. "'", term)
    vim.cmd "startinsert"
  end

  execute.pascal = function(name)
    nvterm.toggle(term)

    local compile = "fpc " .. name
    local separator = "clear"
    local exeFileName = string.sub(name, 1, -5)
    local run = "./" .. exeFileName

    local cmd = M.join({ compile, separator, run }, "&&")
    nvterm.send(cmd, term)
    vim.cmd "startinsert"
  end

  execute.terminal = function(_)
    nvterm.send("clear", term)
    nvterm.toggle(term)
  end

  execute.err = function(type)
    return function(name)
      print("No execute defined. Type: '" .. type .. "', File: '" .. name .. "'")
    end
  end

  local fn = execute[fileType] or execute.err(fileType)
  fn(fileName)
end

return M
