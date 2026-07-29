return {
  tree = {
    "css",
    "scss",
  },

  lsp = {
    { "cssls",         mason = "css-lsp" },
    { "cssmodules_ls", mason = "cssmodules-language-server" },
    { "stylelint_lsp", mason = "stylelint-language-server" },
  },

  null = {
    { "f.stylelint", mason = "stylelint" },
  },
}
