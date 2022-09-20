local M = {}

M.ui = {
  theme_toggle = { "chadracula", "one_light" },
  theme = "chadracula",
}

M.plugins = {
  -- Override
  ["williamboman/mason.nvim"] = require "custom.plugins.mason",
  ["kyazdani42/nvim-tree.lua"] = require "custom.plugins.tree",
  ["nvim-treesitter/nvim-treesitter"] = require "custom.plugins.treesitter",

  -- User
  ["goolord/alpha-nvim"] = require "custom.plugins.alpha",
  ["folke/which-key.nvim"] = require "custom.plugins.which-key",
  ["neovim/nvim-lspconfig"] = require "custom.plugins.lspconfig",
  ["jose-elias-alvarez/null-ls.nvim"] = require "custom.plugins.null-ls",
  ["Pocco81/TrueZen.nvim"] = require "custom.plugins.trueZen",
  ["Pocco81/auto-save.nvim"] = require "custom.plugins.autosave",
  ["sindrets/diffview.nvim"] = require "custom.plugins.diffview",
}

M.mappings = require "custom.mappings"

return M
