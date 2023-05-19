return require("custom.utils").loadPlugins {
  -- LSP
  "lspconfig",
  "mason",
  "mason-lspconfig",
  "null-ls",
  "treesitter",
  "cmp",

  -- Files
  "nvim-tree",
  "telescope",

  -- Git
  "diffview",

  -- Other
  "nvterm",
  "undotree",
}
