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
          ["o"] = actions.select_default,
          ["<A-l>"] = actions.select_default,

          ["<leader>x"] = actions.close,
          ["<A-q>"] = actions.close,
          ["q"] = actions.close,
        },

        i = {
          ["<A-q>"] = false,
          ["<C-q>"] = actions.close,
          ["<A-j>"] = actions.move_selection_next,
          ["<C-j>"] = actions.move_selection_next,
          ["<A-k>"] = actions.move_selection_previous,
          ["<C-k>"] = actions.move_selection_previous,
          ["<A-h>"] = false,
          ["<C-h>"] = false,
          ["<A-l>"] = actions.select_default,
          ["<C-l>"] = false,
          ["<A-o>"] = actions.select_default,
          ["<C-o>"] = actions.select_default,
        },
      },
    },
  },
}
