local M = {}

M.ui = {
  theme = "yoru",
  theme_toggle = { "yoru", "yoru" },

  hl_override = {
    Visual = { bg = "grey" },
  },
  hl_add = {},

  cmp = {
    style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
