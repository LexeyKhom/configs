return {
  "smjonas/inc-rename.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "folke/noice.nvim",
  },
  cmd = "IncRename",
  keys = function()
    require("utils.load").mappings {
      n = {
        ["<leader>lr"] = {
          function()
            return ":IncRename " .. vim.fn.expand "<cword>"
          end,
          "LSP rename",
          { expr = true },
        },
      },
    }
  end,
  config = function()
    require("inc_rename").setup()
  end,
}
