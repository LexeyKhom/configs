return {
  tree = {
    "bash",
  },

  lsp = {
    { "bashls", mason = "bash-language-server" },
  },

  null = {
    { "f.shfmt",      mason = "shfmt" },
  },

  dap = {
    { "bash", mason = "bash-debug-adapter" },
  },
}
