local M = {}

M.ui = {
  theme_toggle = { "onedark", "one_light" },
  theme = "onedark", 
}

M.plugins = { 
  user = {
    ["goolord/alpha-nvim"] = require("custom.plugins.alpha-nvim"),
    ["folke/which-key.nvim"] = require("custom.plugins.which-key"),
  },

  override = {
    ["kyazdani42/nvim-tree.lua"] = require("custom.plugins.nvim-tree"),
  },
}

return M
