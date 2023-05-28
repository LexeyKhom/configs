return {
  "sindrets/diffview.nvim",
  cmd = {
    "DiffviewFileHistory",
    "DiffviewOpen",
  },
  keys = function()
    require("core.utils").load_mappings "diffview"
  end,
  opts = function()
    local actions = require "diffview.actions"

    return {
      keymaps = {
        view = {
          { "n", "<C-n>", actions.toggle_files, { desc = "Toggle the file panel." } },
        },
        file_panel = {
          { "n", "<C-n>", actions.toggle_files, { desc = "Toggle the file panel" } },
        },
        file_history_panel = {
          { "n", "<C-n>", actions.toggle_files, { desc = "Toggle the file panel" } },
        },
      },
    }
  end,
}
