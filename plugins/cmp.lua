return {
  override_options = function()
    return {
      sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "nvim_lsp_document_symbol" },
        { name = "nvim_lsp_signature_help" },
        { name = "path" },
        { name = "buffer" },
      },
    }
  end,
}
