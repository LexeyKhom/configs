return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = require("custom.utils").loadLangs "tree",

    auto_install = true,
    indent = {
      enable = true,
    },
  },
}
