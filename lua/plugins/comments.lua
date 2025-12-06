return {
  "folke/ts-comments.nvim",
  event = { "BufReadPost", "InsertEnter" },
  dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  opts = {
    lang = {
      gdshader = "// %s",
    },
  },
  keys = {
    require("utils.loader").mappings {
      n = {
        ["<leader>/"] = { "gcc", "Toggle comment line", { remap = true } },
      },
      v = {
        ["<leader>/"] = { "gc", "Toggle comment", { remap = true } },
      },
    },
  },
}
