local M = {}

M.ui = {
  theme_toggle = { "onedark", "one_light" },
  theme = "onedark", 
}

M.plugins = { 
  user = {
    ["goolord/alpha-nvim"] = require("custom.plugins.alpha-nvim"),
  }
}

return M
