local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
  },

  i = {
    ["jk"] = { "<ESC>", "escape vim" },
    ["kj"] = { "<ESC>", "escape vim" },
  },
}

M.truezen = {
  n = {
    ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "truezen" },
  },
}

M.diffview = {
  n = {
    ["<leader>gd"] = { "<cmd> DiffviewOpen <CR>", "git diff"},
    ["<leader>gl"] = { "<cmd> DiffviewFileHistory <CR>", "git log"},
    ["<leader>gx"] = { "<cmd> DiffviewClose <CR>", "git close"},
  }
}

return M
