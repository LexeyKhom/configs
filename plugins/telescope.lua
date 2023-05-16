local actions = require "telescope.actions"

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        n = {
          ["q"] = actions.close,
          ["<leader>x"] = actions.close,
        },

        i = {
          ["<C-q>"] = actions.close,
        },
      },
    },
  },
}
