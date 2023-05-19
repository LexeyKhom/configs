return {
  "williamboman/mason-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    ensure_installed = vim.g.lsp,
    automatic_installation = true,
  },
}
