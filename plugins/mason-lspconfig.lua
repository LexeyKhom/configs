return {
  "williamboman/mason-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    ensure_installed = require("custom.utils").loadLangs("lsp", "mason"),
    automatic_installation = true,
  },
}
