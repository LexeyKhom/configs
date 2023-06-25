local actions = require "telescope.actions"

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    defaults = {
      mappings = {
        n = {
          ["q"] = actions.close,
          ["<leader>x"] = actions.close,
          ["o"] = actions.select_default,
        },

        i = {
          ["<C-q>"] = actions.close,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-h>"] = false,
          ["<C-l>"] = false,
        },
      },
    },
  },
}
