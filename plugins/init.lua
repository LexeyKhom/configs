return require("custom.utils").loadPlugins {
  -- LSP
  "lspconfig",
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
