local autocmd = vim.api.nvim_create_autocmd

-- Don't list quickfix buffers
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

autocmd("VimResized", {
  callback = function()
    vim.g.is_horizontal = vim.o.columns > 2 * vim.o.lines
  end,
})

autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.wrap = false
  end,
  desc = "Disable wrap for specific file types to avoid rendering issues",
})
