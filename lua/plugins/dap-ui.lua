return {
  "rcarriga/nvim-dap-ui",
  lazy = true,
  opts = {
    expand_lines = true,
    floating = {
      border = "none", -- "single"
      mappings = {
        close = { "q", "<Esc>", "<leader>x" },
      },
    },
    layouts = {
      {
        elements = {
          {
            id = "scopes",
            size = 0.25,
          },
          {
            id = "breakpoints",
            size = 0.25,
          },
          {
            id = "stacks",
            size = 0.25,
          },
          {
            id = "watches",
            size = 0.25,
          },
        },
        position = "left",
        size = 30,
      },
      {
        elements = {
          {
            id = "repl",
            size = 0.6,
          },
          {
            id = "console",
            size = 0.4,
          },
        },
        position = "bottom",
        size = 10,
      },
    },
  },
  config = function(_, opts)
    require("dapui").setup(opts)
  end,
}
