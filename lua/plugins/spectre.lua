return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = function()
    require("utils.load").mappings {
      n = {
        ["<leader>ss"] = {
          '<cmd>lua require("spectre").open()<CR>',
          "Spectre",
        },
        ["<leader>sq"] = {
          '<cmd>lua require("spectre").close()<CR>',
          "Spectre quit",
        },
        ["<leader>sx"] = {
          '<cmd>lua require("spectre").close()<CR>',
          "Spectre close",
        },
        ["<leader>sa"] = {
          '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
          "Spectre all",
        },
      },

      v = {
        ["<leader>sa"] = {
          '<esc><cmd>lua require("spectre").open_visual()<CR>',
          "Spectre all",
        },
      },
    }
  end,
}
