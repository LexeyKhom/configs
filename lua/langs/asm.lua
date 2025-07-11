vim.filetype.add {
  extension = {
    inc = "asm",
  },
}

return {
  tree = {
    "nasm",
  },

  -- lsp = {
  --   { "asm_lsp", mason = "asm-lsp" },
  -- },

  -- null = {
  --   { "f.asmfmt", mason = "asmfmt" },
  -- },
}
