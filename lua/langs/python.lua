return {
  tree = {
    "python",
  },

  lsp = {
    { "pyright",  mason = "pyright" },
    { "ruff", mason = "ruff-lsp" },
  },

  null = {
    { "d.mypy",       mason = "mypy" },
  },
}
