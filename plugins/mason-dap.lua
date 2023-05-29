return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
  },
  opts = {
    ensure_installed = require("custom.utils").loadLangs "dap",

    automatic_installation = true,
  },
}
