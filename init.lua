------ Options ------

local opt = vim.opt

-- Relative Number
opt.relativenumber = true

-- Scroll
opt.wrap = false
opt.scrolloff = 8

-- Search
opt.hlsearch = true
opt.incsearch = true

------ Autocmd ------

local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

------ Globals ------

local g = vim.g

-- VsCode format for snippets (json)
vim.g.vscode_snippets_path = "~/.config/nvim/lua/custom/snippets/"

-- Default term
g.term = "float"

g.lsp = {
  -- HTML
  "html",
  "emmet_ls",

  -- CSS
  "cssls",
  "cssmodules_ls",
  "stylelint_lsp",

  -- JavaScript
  "eslint",
  "tsserver",
  "svelte",

  -- Vue
  "volar",
  "vuels",

  -- JSON
  "jsonls",

  -- Lua/Vim
  "vimls",

  -- C/C++
  "clangd",

  -- Other
  "marksman",
  "bashls",
  "dockerls",
  -- "pasls", -- Pascal
}
