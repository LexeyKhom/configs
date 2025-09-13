return {
  "LexeyKhom/nvconfig",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvchad/base46",
  },
  lazy = false,
  opts = function()
    local merge_dir = require("utils.loader").merge_dir
    local hl_add = merge_dir "plugins/nvconfig/hl_add"
    local hl_override = merge_dir "plugins/nvconfig/hl_override"
    local M = {}

    M.base46 = {
      theme = "yoru",
      theme_toggle = { "yoru" },
      hl_add = hl_add,
      hl_override = hl_override,
      integrations = {
        "avante",
        -- "blankline",
        -- "bufferline",
        "cmp",
        "dap",
        "defaults",
        "devicons",
        "diffview",
        "git",
        "lsp",
        "mason",
        "nvimtree",
        "rainbowdelimiters",
        "render-markdown",
        "semantic_tokens",
        "syntax",
        "telescope",
        -- "todo",
        "treesitter",
        "whichkey",
      },
    }

    return M
  end,
  config = function(_, opts)
    require("nvconfig.opts").setup(opts)
  end,
}
