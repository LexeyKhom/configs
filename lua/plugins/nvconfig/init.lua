return {
  "LexeyKhom/nvconfig",
  dependencies = {
    { "NvChad/base46", branch = "v3.0" },
    "nvim-lua/plenary.nvim",
  },
  lazy = false,
  opts = function()
    local merge_dir = require("utils.loader").merge_dir
    local hl_add = merge_dir "plugins/nvconfig/hl_add"
    local hl_override = merge_dir "plugins/nvconfig/hl_override"
    local M = {}

    M.path = "plugins/nvconfig/init.lua" -- config path. Need for cmd "Telescope themes"

    M.base46 = {
      theme = "yoru",
      hl_add = hl_add,
      hl_override = hl_override,
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
        "devicons",
      },
      theme_toggle = { "yoru" },
    }

    M.ui = {
      cmp = {
        style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
      },
    }

    return M
  end,
  config = function(_, opts)
    require("nvconfig.opts").setup(opts)
  end,
}
