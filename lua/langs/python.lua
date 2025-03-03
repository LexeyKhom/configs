return {
  tree = {
    "python",
  },

  lsp = {
    { "ruff", mason = "ruff" },
  },

  null = {
    { "d.mypy", mason = "mypy" },
    { "f.usort", mason = "usort" },
  },
}
