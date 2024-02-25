return {
  tree = {
    "python",
  },

  lsp = {
    { "pyright",  mason = "pyright" },
    { "ruff_lsp", mason = "ruff-lsp" },
  },

  null = {
    { "d.mypy",       mason = "mypy" },
  },
}
