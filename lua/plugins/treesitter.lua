return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "RRethy/nvim-treesitter-endwise",
    "windwp/nvim-ts-autotag",
  },
  event = { "BufRead", "BufNewFile" },
  cmd = { "TSUpdate", "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  opts = function()
    return {
      ensure_installed = require("utils.load").langs "tree",
      auto_install = true,
      indent = { enable = true },
      highlight = {
        enable = true,
        use_languagetree = true,
      },

      -- Plugins settings
      autotag = {
        enable = true,
      },
      endwise = {
        enable = true,
      },
    }
  end,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
