local cmp = require "cmp"

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "rafamadriz/friendly-snippets", enabled = false },
    { "kdheepak/cmp-latex-symbols" },
  },
  opts = {
    mapping = {
      ["<A-j>"] = cmp.mapping.select_next_item(),
      ["<A-k>"] = cmp.mapping.select_prev_item(),
      ["<A-l>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      ["<A-w>"] = cmp.mapping.close(),
      ["<A-Space>"] = cmp.mapping.complete(),
    },
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
