return {
  tree = {
    "c",
    "cpp",
  },

  lsp = {
    { "clangd", mason = "clangd" },
  },

  null = {
    { "d.cpplint", mason = "cpplint" },
    { "f.clang_format", mason = "clang-format" },
  },
}
