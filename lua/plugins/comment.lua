return {
  "numToStr/Comment.nvim",
  keys = function()
    require("utils.load").mappings {
      n = {
        ["<leader>/"] = {
          function()
            require("Comment.api").toggle.linewise.current()
          end,
          "Toggle comment",
        },
      },

      v = {
        ["<leader>/"] = {
          "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
          "Toggle comment",
        },
      },
    }
  end,
  config = function(_, opts)
    require("Comment").setup(opts)
  end,
}
