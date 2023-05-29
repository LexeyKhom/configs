return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = function()
    require("core.utils").load_mappings "null"
  end,
  opts = function()
    local loadSources = function()
      local builtins = require("null-ls").builtins
      local split = require("custom.utils").split
      local strArr = require("custom.utils").loadLangs "null"
      local def = {
        a = "code_actions",
        c = "completion",
        d = "diagnostics",
        f = "formatting",
      }

      local res = {}

      for _, str in pairs(strArr) do
        local mode, name = split(str, "[^%.]+")
        local r = builtins[def[mode]][name]
        table.insert(res, r)
      end

      return res
    end

    return {
      debug = true,
      sources = loadSources(),
    }
  end,
}
