local function toggle_diffview(cmd)
  if next(require("diffview.lib").views) == nil then
    vim.cmd(cmd)
  else
    vim.cmd "DiffviewClose"
  end
end

return {
  "dlyongemallo/diffview.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = {
    "DiffviewFileHistory",
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggle",
    "DiffviewFileHistory",
    "DiffviewDiffFiles",
  },
  keys = function()
    require("utils.loader").mappings {
      n = {
        ["<A-g>"] = { "<cmd> DiffviewToggle <CR>", "GitDiff" },
        ["<leader>gl"] = {
          function()
            toggle_diffview "DiffviewFileHistory %"
          end,
          "GitDiff Log for current file",
        },
        ["<leader>gL"] = {
          function()
            toggle_diffview "DiffviewFileHistory"
          end,
          "GitDiff Log",
        },
      },
    }
  end,
  opts = function()
    local KEYS = require "core.mappings"
    local actions = require "diffview.actions"
    local DIFF2_LAYOUT = vim.g.is_horizontal and "diff2_horizontal"
        or "diff2_vertical"
    local DIFF3_LAYOUT = vim.g.is_horizontal and "diff3_horizontal"
        or "diff3_vertical"

    return {
      view = {
        -- Available layouts: 'diff1_plain' | 'diff2_horizontal' | 'diff2_vertical' |
        -- 'diff3_horizontal' |'diff3_vertical' |'diff3_mixed' |'diff4_mixed'
        default = { layout = DIFF2_LAYOUT },
        merge_tool = { layout = DIFF3_LAYOUT },
        file_history = { layout = DIFF2_LAYOUT },
      },
      keymaps = {
        view = {
          {
            "n",
            KEYS.NAV_FILES,
            actions.toggle_files,
            { desc = "Toggle the file panel." },
          },
          {
            "n",
            KEYS.UP,
            actions.select_prev_entry,
            { desc = "Prev entry" },
          },
          {
            "n",
            KEYS.DOWN,
            actions.select_next_entry,
            { desc = "Next entry" },
          },
        },
        file_panel = {
          {
            "n",
            KEYS.NAV_FILES,
            actions.toggle_files,
            { desc = "Toggle the file panel" },
          },
          { "n", KEYS.UP, actions.select_prev_entry, { desc = "Prev entry" } },
          {
            "n",
            KEYS.DOWN,
            actions.select_next_entry,
            { desc = "Next entry" },
          },
        },
        file_history_panel = {
          {
            "n",
            KEYS.NAV_FILES,
            actions.toggle_files,
            { desc = "Toggle the file panel" },
          },
        },
      },
    }
  end,
}
