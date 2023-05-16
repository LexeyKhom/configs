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

-- Undo
opt.undodir = os.getenv "HOME" .. "/.nvim/undodir"

------ Autocmd ------

local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

