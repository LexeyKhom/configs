return {
  "LexeyKhom/nvconfig",
  dependencies = {
    { "NvChad/base46", branch = "v3.0" },
    "nvim-lua/plenary.nvim",
  },
  lazy = false,
  opts = function()
    local mergeDir = require("utils.load").mergeDir
    local hl_override = mergeDir "plugins/nvconfig/hl_override"
    local hl_add = mergeDir "plugins/nvconfig/hl_add"
    return {
      path = "plugins/nvconfig/init.lua",
      ui = {
        theme = "yoru",
        hl_override = hl_override,
        hl_add = hl_add,
      },
      base46 = {
        integrations = {
          "blankline",
          "cmp",
          "dap",
          "defaults",
          "git",
          "lsp",
          "mason",
          "nvimtree",
          "rainbowdelimiters",
          "semantic_tokens",
          "syntax",
          "telescope",
          "treesitter",
          "whichkey",
        },
      },
    }
  end,
  config = function(_, opts)
    require("nvconfig.opts").setup(opts)
  end,
}
