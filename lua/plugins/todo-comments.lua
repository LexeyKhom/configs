return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "TodoTelescope" },
  event = { "BufRead", "BufNewFile" },
  opts = {
    keywords = {
      FIX = {
        icon = " ",
        color = "error",
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      TEST = {
        icon = "⏲ ",
        color = "test",
        alt = { "TESTING", "PASSED", "FAILED" },
      },
    },
  },
  keys = function()
    require("utils.load").mappings {
      n = {
        ["<leader>qt"] = {
          "<cmd>TodoTelescope<CR>",
          "Quikfix ToDo",
        },
      },
    }
  end,
  config = function(_, opts)
    require("todo-comments").setup(opts)
  end,
}
