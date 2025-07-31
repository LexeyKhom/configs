return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "TodoTelescope" },
  event = { "BufReadPost", "InsertEnter" },
  opts = {
    keywords = {
      FIX = { icon = " ", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
      TODO = { icon = " " },
      HACK = { icon = " " },
      WARN = { icon = " ", alt = { "WARNING", "XXX" } },
      PERF = { icon = "󱎫 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = "󰎚 ", alt = { "INFO" } },
      TEST = { icon = "󰙨 ", alt = { "TESTING", "PASSED", "FAILED" } },
    },
  },
  keys = function()
    require("utils.loader").mappings {
      n = {
        ["<leader>qt"] = {
          "<cmd>TodoTelescope<CR>",
          "Quikfix ToDo",
        },
      },
    }
  end,
}
