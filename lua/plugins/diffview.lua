return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = {
    "DiffviewFileHistory",
    "DiffviewOpen",
    "DiffviewClose",
  },
  keys = function()
    require("utils.load").mappings {
      n = {
        ["<leader>gd"] = { "<cmd> DiffviewOpen <CR>", "GitDiff" },
        ["<leader>gx"] = { "<cmd> DiffviewClose <CR>", "GitDiff close" },
        ["<leader>gq"] = { "<cmd> DiffviewClose <CR>", "GitDiff quit" },
        ["<leader>gl"] = { "<cmd> DiffviewFileHistory <CR>", "Git log" },
      },
    }
  end,
  opts = function()
    local KEYS = require "core.mappings"
    local actions = require "diffview.actions"
    return {
      keymaps = {
        view = {
          { "n", KEYS.NAV_FILES, actions.toggle_files, { desc = "Toggle the file panel." } },
          { "n", KEYS.UP, actions.select_prev_entry, { desc = "Prev entry" } },
          { "n", KEYS.DOWN, actions.select_next_entry, { desc = "Next entry" } },
        },
        file_panel = {
          { "n", KEYS.NAV_FILES, actions.toggle_files, { desc = "Toggle the file panel" } },
          { "n", KEYS.UP, actions.select_prev_entry, { desc = "Prev entry" } },
          { "n", KEYS.DOWN, actions.select_next_entry, { desc = "Next entry" } },
        },
        file_history_panel = {
          { "n", KEYS.NAV_FILES, actions.toggle_files, { desc = "Toggle the file panel" } },
        },
      },
    }
  end,
}
