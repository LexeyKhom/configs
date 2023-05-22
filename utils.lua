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

M.execute = function()
  local nvterm = require "nvterm.terminal"
  local term = vim.g.term

  -- https://vimdoc.sourceforge.net/htmldoc/cmdline.html#filename-modifiers
  local fileName = vim.fn.expand "%:t"
  local fileType = vim.bo.filetype

  local execute = {
    javascript = function(name)
      nvterm.toggle(term)
      nvterm.send("node " .. name, term)
      vim.cmd "startinsert"
    end,

    typescript = function(name)
      nvterm.toggle(term)
      nvterm.send("deno run " .. name, term)
      vim.cmd "startinsert"
    end,

    terminal = function(_)
      nvterm.toggle(term)
    end,
  }

  local err = function(type)
    return function(name)
      print("No function defined: Type '" .. type .. "', File: '" .. name .. "'")
    end
  end

  local fn = execute[fileType] or err(fileType)
  fn(fileName)
end

return M
