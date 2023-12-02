return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
  },
  main = "ibl",
  event = { "BufRead", "BufNewFile" },
  opts = function()
    local hooks = require "ibl.hooks"
    local set_hl = vim.api.nvim_set_hl
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      set_hl(0, "RainbowRed", { fg = "#E06C75" })
      set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      set_hl(0, "RainbowGreen", { fg = "#98C379" })
      set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

    return {
      scope = {
        highlight = {
          "RainbowRed",
          "RainbowYellow",
          "RainbowBlue",
          "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
        },
      },
      -- TODO: Base46 Добавить свой цвет для indent
      -- indent = {
      --   highlight = {
      --     "RainbowGray",
      --   },
      -- },
    }
  end,
  config = function(_, opts)
    require("ibl").setup(opts)
  end,
}
