return {
  "stevearc/dressing.nvim",
  lazy = true,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "LexeyKhom/nvconfig",
  },
  opts = function()
    local mappings = require "plugins.dressing.mappings"
    return {
      input = {
        title_pos = "center",
        win_options = {
          statuscolumn = "   ",
          winhighlight = "NormalFloat:DressingInsertFloatNormal,FloatBorder:DressingInsertFloatBorder,FloatTitle:DressingInsertFloatTitle,LineNr:DressingInsertFloatSign",
        },
        mappings = mappings,
      },
      select = {
        backend = { "builtin" },
        builtin = {
          win_options = {
            winhighlight = "NormalFloat:DressingSelectFloatNormal,FloatBorder:DressingSelectFloatBorder,FloatTitle:DressingSelectFloatTitle,LineNr:DressingSelectFloatSign,MatchParen:",
          },
          mappings = mappings.n,
          min_height = { 5, 0.1 },
          min_width = { 30, 0.15 },
        },
      },
    }
  end,
}
