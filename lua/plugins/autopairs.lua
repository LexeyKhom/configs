return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    fast_wrap = { map = "<A-g>" },
    disable_filetype = { "TelescopePrompt", "spectre_panel", "vim" },
  },
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)

    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
