return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "rafamadriz/friendly-snippets", enabled = false },
    { "kdheepak/cmp-latex-symbols" },
  },
  opts = {
    sources = {
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "nvim_lsp_document_symbol" },
      { name = "nvim_lsp_signature_help" },
      { name = "path" },
      { name = "latex_symbols" },
      { name = "buffer" },
    },
  },
}
