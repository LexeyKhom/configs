return {
  after = "mason.nvim",
  cmd = {
    "LspInstall",
    "LspUninstall",
  },
  config = function()
    require("mason-lspconfig").setup {
      ensure_installed = {
        -- HTML
        "html",
        "emmet_ls",

        -- CSS
        "cssls",
        "cssmodules_ls",
        "stylelint_lsp",

        -- JavaScript
        "eslint",
        "tsserver",
        "svelte",
        "vuels",

        -- JSON
        "jsonls",

        -- Lua/Vim
        "sumneko_lua",
        "vimls",

        -- Other
        "marksman",
        "bashls",
        "dockerls",
      },
      automatic_installation = true,
    }
  end,
}
