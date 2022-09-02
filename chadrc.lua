local M = {}

M.ui = {
  theme_toggle = { "onedark", "one_light" },
  theme = "onedark", 
}

M.plugins = { 
  user = {
    ["goolord/alpha-nvim"] = require("custom.plugins.alpha-nvim"),
    ["folke/which-key.nvim"] = require("custom.plugins.which-key"),
    ["neovim/nvim-lspconfig"] = require("custom.plugins.nvim-lspconfig"),
  },

  override = {
    ["kyazdani42/nvim-tree.lua"] = require("custom.plugins.nvim-tree"),
    ["nvim-treesitter/nvim-treesitter"] = require("custom.plugins.nvim-treesitter"),
    ["williamboman/mason.nvim"] = require("custom.plugins.mason"),
  },
}

return M
