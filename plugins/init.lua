local path = "custom.plugins"
local plugins = {
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
  "spectre",

  -- Git
  "diffview",

  -- AI
  "huggingface",

  -- Other
  "nvterm",
  "undotree",
}

return require("custom.utils").loadPlugins(path, plugins)
