return {
  tree = {
    "python",
  },

  lsp = {
    { "pyright", mason = "pyright" },
    { "ruff_lsp", mason = "ruff-lsp" },
  },

  null = {
    { "d.pydocstyle", mason = "pydocstyle" },
    { "d.mypy", mason = "mypy" },
    { "d.ruff", mason = "ruff" },
    { "f.ruff", mason = "ruff" },
  },
}
