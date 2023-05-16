return {
  "neovim/nvim-lspconfig",
  dependencies = {
    require "custom.plugins.mason-lspconfig",
    require "custom.plugins.null-ls",
  },
  config = function()
    require "plugins.configs.lspconfig"
    local servers = vim.g.lsp

    local lspconfig = require "lspconfig"
    local on_attach = require("plugins.configs.lspconfig").on_attach
    local capabilities = require("plugins.configs.lspconfig").capabilities
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end
  end,
}
