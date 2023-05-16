return {
  "williamboman/mason-lspconfig",
  dependencies = {
    require "custom.plugins.mason",
  },
  opts = {
    ensure_installed = vim.g.lsp,
    automatic_installation = true,
  },
}
