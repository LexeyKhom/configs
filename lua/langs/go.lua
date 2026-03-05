return {
  tree = {
    "go",
    "gomod",
  },

  lsp = {
    { "gopls", mason = "gopls" },
  },

  null = {
    { "d.golangci_lint", mason = "golangci_lint" },
    { "f.gofumpt", mason = "gofumpt" },
    { "f.goimports", mason = "goimports" },
    { "f.goimports_reviser", mason = "goimports-reviser" },
    {
      "f.golines",
      mason = "golines",
      setting = {
        extra_args = { "-m", "79" },
      },
    },
  },

  dap = {
    { "go", mason = "delve" },
  },
}
