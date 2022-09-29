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

M.autosave = {
  n = {
    ["<leader>as"] = { "<cmd> ASToggle <CR>", "autosave toggle" },
  },
}

M.truezen = {
  n = {
    ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "truezen" },
  },
}

M.diffview = {
  n = {
    ["<leader>gd"] = { "<cmd> DiffviewOpen <CR>", "git diff" },
    ["<leader>gl"] = { "<cmd> DiffviewFileHistory <CR>", "git log" },
    ["<leader>gx"] = { "<cmd> DiffviewClose <CR>", "git close" },
  },
}

M.spectre = {
  n = {
    ["<leader>sg"] = { "<cmd> lua require('spectre').open() <CR>", "sed global" },
    ["<leader>sf"] = { "<cmd> lua require('spectre').open_file_search() <CR>", "sed file" },
  },
}

return M
