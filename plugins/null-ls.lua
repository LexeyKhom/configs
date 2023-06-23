local loadSources = function()
  local builtins = require("null-ls").builtins
  local split = require("custom.utils").split
  local configs = require("custom.utils").loadLangs "null"
  local def = {
    a = "code_actions",
    c = "completion",
    d = "diagnostics",
    f = "formatting",
  }

  local sources = {}
  for _, config in pairs(configs) do
    local shortMode, name = split(config, "[^%.]+") -- split(str, ".") not working
    local mode = def[shortMode]
    local source = builtins[mode][name]
    table.insert(sources, source)
  end
  return sources
end

return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = function()
    require("core.utils").load_mappings "null"
  end,
  opts = function()
    return {
      debug = true,
      sources = loadSources(),
    }
  end,
}
