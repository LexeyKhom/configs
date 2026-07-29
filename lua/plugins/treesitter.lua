return {
  "romus204/tree-sitter-manager.nvim",
  dependencies = {
    "RRethy/nvim-treesitter-endwise",
    { "windwp/nvim-ts-autotag", opts = {} },
  },
  opts = function()
    return {
      ensure_installed = require("utils.loader").langs "tree",
      auto_install = true,
    }
  end,
  config = function(_, opts)
    require("tree-sitter-manager").setup(opts)
  end,
}
