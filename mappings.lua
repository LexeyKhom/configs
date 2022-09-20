local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
  },

  i = {
    ["jk"] = { "<ESC>", "escape vim" },
  },
}

M.truezen = {
  n = {
    ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "truezen" },
  },
}

return M
