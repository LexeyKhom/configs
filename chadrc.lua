local M = {}

M.ui = {
  theme_toggle = { "chadracula", "one_light" },
  theme = "chadracula",
}

M.plugins = {
  ["goolord/alpha-nvim"] = require "custom.plugins.alpha-nvim",
  ["folke/which-key.nvim"] = require "custom.plugins.which-key",
  ["neovim/nvim-lspconfig"] = require "custom.plugins.nvim-lspconfig",
  ["jose-elias-alvarez/null-ls.nvim"] = require "custom.plugins.null-ls",

  -- Override
  ["williamboman/mason.nvim"] = require "custom.plugins.mason",
  ["kyazdani42/nvim-tree.lua"] = require "custom.plugins.nvim-tree",
  ["nvim-treesitter/nvim-treesitter"] = require "custom.plugins.nvim-treesitter",
}

return M
