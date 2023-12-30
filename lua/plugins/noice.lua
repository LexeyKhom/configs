return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "LexeyKhom/nvconfig",
  },
  event = "VeryLazy",
  opts = function()
    local isTermux = vim.g.isTermux
    return {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        long_message_to_split = true, -- long messages will be sent to a split
        lsp_doc_border = true, -- add a border to hover docs and signature help
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
      },
      views = {
        cmdline_popup = {
          position = { row = 5, col = "50%" },
          size = { width = isTermux and 36 or 60, height = "auto" },
          border = { style = "none", padding = { 1, 2 } },
          win_options = { winhighlight = { Normal = "NoiceLightFloatNormal", FloatBorder = "NoiceLightFloatBorder" } },
        },
        popupmenu = {
          position = { row = 8, col = "50%" },
          size = { width = isTermux and 36 or 60, height = 10 },
          border = { style = "none", padding = { 1, 2 } },
          win_options = { winhighlight = { Normal = "NoiceDarkFloatNormal", FloatBorder = "NoiceDarkFloatBorder" } },
        },
      },
    }
  end,
  config = function(_, opts)
    require("noice").setup(opts)
  end,
}
