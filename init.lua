------ Options ------

local opt = vim.opt

-- Relative Number
opt.relativenumber = false

-- Wrap
opt.linebreak = true
opt.breakindent = true
opt.breakindentopt = "shift:2"

-- Scroll
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
g.vscode_snippets_path = "~/.config/nvim/lua/custom/"

-- Default term
g.term = "float"

g.isTermux = os.getenv "isTermux"
