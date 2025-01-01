return {
  "folke/ts-comments.nvim",
  event = "VeryLazy",
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  opts = {},
  keys = {
    require("utils.load").mappings {
      n = {
        ["<leader>/"] = { "gcc", "Toggle comment line", { remap = true } },
      },
      v = {
        ["<leader>/"] = { "gc", "Toggle comment", { remap = true } },
      },
    },
  },
}
