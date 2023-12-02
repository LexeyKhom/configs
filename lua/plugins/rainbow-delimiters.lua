return {
  "HiPhish/rainbow-delimiters.nvim",
  event = { "BufRead", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = function()
    local rainbow_delimiters = require "rainbow-delimiters"
    return {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"],
        vim = rainbow_delimiters.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
      highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      },
    }
  end,
  config = function(_, opts)
    require("rainbow-delimiters.setup").setup(opts)
  end,
}
