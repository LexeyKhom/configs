return {
  tree = {
    "bash",
  },

  lsp = {
    { "bashls", mason = "bash-language-server" },
  },

  null = {
    { "a.shellcheck", mason = "shellcheck" },
    { "f.shfmt",      mason = "shfmt" },
  },

  dap = {
    { "bash", mason = "bash-debug-adapter" },
  },
}
