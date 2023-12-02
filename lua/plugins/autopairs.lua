return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = function()
    local KEYS = require "core.mappings"
    return {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "spectre_panel", "vim" },
      custom_map_bs = KEYS.BACKSPACE,
    }
  end,
  config = function(_, opts)
    -- Custom map <BS>
    local MAP_BS = opts.custom_map_bs
    local on_attach = require("nvim-autopairs").on_attach
    require("nvim-autopairs").on_attach = function(bufnr)
      bufnr = bufnr or vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_keymap(bufnr, "i", MAP_BS, "v:lua.MPairs.autopairs_bs()", { expr = true, noremap = true })
      on_attach(bufnr)
    end

    require("nvim-autopairs").setup(opts)

    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    ---@diagnostic disable-next-line: undefined-field
    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
