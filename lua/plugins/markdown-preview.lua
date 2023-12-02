return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = "cd app && yarn install",
  -- FIX: Add keymaps and settings
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
}
