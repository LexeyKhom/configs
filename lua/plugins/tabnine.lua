return {
  "codota/tabnine-nvim",
  enabled = not vim.g.isTermux,
  dependencies = {
    "LexeyKhom/nvconfig",
  },
  event = "VeryLazy",
  build = "./dl_binaries.sh",
  opts = function()
    local c = require("base46").get_theme_tb "base_30"
    return {
      disable_auto_comment = true,
      accept_keymap = "<A-t>",
      dismiss_keymap = "<A-T>",
      debounce_ms = 1500,
      suggestion_color = { gui = c.light_grey, cterm = 244 },
      exclude_filetypes = {
        "TelescopePrompt",
        "NvimTree",
        "spectre_panel",
      },
      log_file_path = nil, -- absolute path to Tabnine log file
    }
  end,
  config = function(_, opts)
    require("tabnine").setup(opts)
  end,
}
