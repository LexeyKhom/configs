return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
  },
  main = "ibl",
  event = { "BufRead", "BufNewFile" },
  opts = function()
    return {
      scope = {
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      },
    }
  end,
  config = function(_, opts)
    require("ibl").setup(opts)
  end,
}
