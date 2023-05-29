return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = require("custom.utils").loadLangs "mason",

    ui = {
      icons = {
        package_pending = " ",
        package_installed = " ",
        package_uninstalled = " ",
      },
    },
  },
}
