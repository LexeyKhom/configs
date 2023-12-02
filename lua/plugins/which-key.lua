return {
  "folke/which-key.nvim",
  cmd = "WhichKey",
  keys = { "<leader>", "c", "d", "y", "v", "g", "[", "]", '"', "'", "`" },
  config = function(_, opts)
    require("which-key").setup(opts)
  end,
}
