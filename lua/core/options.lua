local opt = vim.opt

-- Globals
opt.timeoutlen = 400
opt.updatetime = 250 -- interval for writing swap file to disk
opt.undofile = true
opt.clipboard = "unnamedplus"
opt.termguicolors = true

-- Screen
opt.shortmess:append "sI" -- disable nvim intro
opt.splitbelow = true
opt.splitright = true

-- Editor
opt.mouse = "a"
opt.cursorline = true
opt.fillchars = { eob = " " }
opt.whichwrap:append "<>[]hl" -- go to previous/next line

-- Scroll
opt.scrolloff = 10

-- Statusline
opt.laststatus = 3 -- global statusline
opt.cmdheight = 0
opt.ruler = false
opt.showmode = false

-- Numbers column
opt.number = true
opt.numberwidth = 2
opt.relativenumber = false
opt.signcolumn = "yes"

-- Indenting
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true
opt.expandtab = true

-- Wrap
opt.linebreak = true
opt.breakindent = true
opt.breakindentopt = "shift:2"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
