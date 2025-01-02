return {
  tree = {
    "css",
    "scss",
  },

  lsp = {
    { "cssls",         mason = "css-lsp" },
    { "cssmodules_ls", mason = "cssmodules-language-server" },
    { "stylelint_lsp", mason = "stylelint-lsp" },
  },

  null = {
    { "f.stylelint", mason = "stylelint" },
  },
}
