local highlights = require "custom.highlights" -- Path to overriding theme and highlights files

local M = {}

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "onedark" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  cmp = {
    style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
