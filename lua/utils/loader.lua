local Loader = {}

Loader.dir = function(path)
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

Loader.merge_dir = function(path)
  local assign = require("utils.table").assign
  local dir = Loader.dir(path)
  local result = {}
  for _, tb in ipairs(dir) do
    result = assign(result, tb)
  end
  return result
end

Loader.mappings = function(mappings, default_opts)
  local assign = require("utils.table").assign
  local split = require("utils.string").split
  local split_str = ","
  for mode, keys in pairs(mappings) do
    for key_str, value in pairs(keys) do
      local bind = value[1]
      local desc = value[2]
      local bind_opts = value[3] or {}
      local opts = default_opts or {}
      opts = assign(opts, bind_opts)
      opts.desc = desc
      for _, key in pairs(split(key_str, split_str)) do
        vim.keymap.set(mode, key, bind, opts)
      end
    end
  end
end

Loader.plugins = function(pluginsPath)
  local LAZY_OPTS = {
    ui = {
      icons = {
        loaded = " ",
        not_loaded = " ",
      },
    },
  }
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
  ---@diagnostic disable-next-line: undefined-field (fs_stat)
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local out = vim.fn.system {
      "git",
      "clone",
      "--filter=blob:none",
      "--branch=stable",
      lazyrepo,
      lazypath,
    }
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
  end
  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup(pluginsPath, LAZY_OPTS)
end

Loader.langs = function(pluginName, filter)
  local LANGS_DIR = "langs"
  local contains = require("utils.table").contains
  local langs = Loader.dir(LANGS_DIR)
  local results = {}
  local settings = {}
  for _, lang in pairs(langs) do
    if lang[pluginName] then
      local plugin_configs = lang[pluginName]
      for _, config in pairs(plugin_configs) do
        local is_table = type(config) == "table"
        local is_filtered = is_table
            and config.filter
            and contains(config.filter, filter)
        local result = is_table and config[1] or config
        local setting = is_table and config.setting or nil
        if not is_filtered and not contains(results, result) then
          table.insert(results, result)
          settings[result] = setting
        end
      end
    end
    if pluginName == "mason" then
      for _, plugin_configs in pairs(lang) do
        for _, config in pairs(plugin_configs) do
          local is_table = type(config) == "table"
          local result = is_table and config["mason"] or nil
          if result and not contains(results, result) then
            table.insert(results, result)
          end
        end
      end
    end
  end
  return results, settings
end

Loader.db_configs = function()
  local DB_CONFIG_PATH = os.getenv "DB_CONFIG_PATH"
  local configs = {}
  if DB_CONFIG_PATH then
    configs = dofile(DB_CONFIG_PATH)
  end
  return configs
end

return Loader
