return {
  "simrat39/symbols-outline.nvim",
  cmd = { "SymbolsOutline" },
  keys = function()
    require("utils.load").mappings {
      n = {
        ["<leader>ts"] = {
          "<cmd> SymbolsOutline <CR>",
          "Toggle SymbolsOutline",
        },
      },
    }
  end,
  opts = function()
    local KEYS = require "core.mappings"
    local ICONS = require "plugins.cmp.icons"
    local opts = {
      width = 40,
      keymaps = {
        close = { "<Esc>", "q", KEYS.QUIT },
        focus_location = { "<Tab>", "o" },
        goto_location = { KEYS.ENTER, "<CR>" },
        hover_symbol = { "K" },
      },
      symbols = {},
    }
    for keys, value in pairs(ICONS) do
      opts.symbols[keys] = { icon = value }
    end
    return opts
  end,
  config = function(_, opts)
    require("symbols-outline").setup(opts)
  end,
}
