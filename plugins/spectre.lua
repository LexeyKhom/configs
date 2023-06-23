return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  keys = function()
    require("core.utils").load_mappings "spectre"
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
