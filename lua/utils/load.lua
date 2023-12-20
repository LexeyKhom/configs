local Load = {}

Load.dir = function(path)
  local readdir = require("utils.fs").readdir
  local split = require("utils.string").split
  local join = require("utils.table").join
  local unpack = require("utils.table").unpack
  local modules = {}
  local files = readdir(path)
  path = join(split(path, "/"), ".")
  for _, file in ipairs(files) do
    local fileName = unpack(split(file, "."))
    local fullFileName = path .. "." .. fileName
    local success, module = pcall(require, fullFileName)
    if success then
      table.insert(modules, module)
    else
      print("Module " .. file .. " could not be loaded")
    end
  end
  return modules
end

Load.mappings = function(mappings, defaultOpts)
  local assign = require("utils.table").assign
  local split = require("utils.string").split
  local splitStr = ","
  for mode, keys in pairs(mappings) do
    for keyStr, value in pairs(keys) do
      local bind = value[1]
      local desc = value[2]
      local bindOpts = value[3] or {}
      local opts = defaultOpts or {}
      opts = assign(opts, bindOpts)
      opts.desc = desc
      for _, key in pairs(split(keyStr, splitStr)) do
        vim.keymap.set(mode, key, bind, opts)
      end
    end
  end
end

Load.plugins = function(pluginsPath)
  local LAZY_OPTS = {
    defaults = {
      lazy = true,
    },
    ui = {
      icons = {
        loaded = " ",
        not_loaded = " ",
      },
    },
  }
  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    }
  end
  vim.opt.rtp:prepend(lazypath)
  local plugins = Load.dir(pluginsPath)
  require("lazy").setup(plugins, LAZY_OPTS)
end

Load.langs = function(pluginName, filter)
  local contains = require("utils.table").contains
  local langs = Load.dir "langs"
  local results = {}
  local settings = {}
  for _, lang in pairs(langs) do
    if lang[pluginName] then
      local pluginConfigs = lang[pluginName]
      for _, config in pairs(pluginConfigs) do
        local isTable = type(config) == "table"
        local isFiltered = isTable and config.filter and contains(config.filter, filter)
        local result = isTable and config[1] or config
        local setting = isTable and config.setting or nil
        if not isFiltered and not contains(results, result) then
          table.insert(results, result)
          settings[result] = setting
        end
      end
    end
    if pluginName == "mason" then
      for _, pluginConfigs in pairs(lang) do
        for _, config in pairs(pluginConfigs) do
          local isTable = type(config) == "table"
          local result = isTable and config["mason"] or nil
          if result and not contains(results, result) then
            table.insert(results, result)
          end
        end
      end
    end
  end
  return results, settings
end

return Load
