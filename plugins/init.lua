return require("custom.utils").loadPlugins {
  -- LSP
  "lspconfig",
  "mason",
  "mason-lspconfig",
  "mason-dap",
  "dap",
  "dap-ui",
  "dap-virtual-text",
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
