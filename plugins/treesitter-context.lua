return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "TSContextEnable",
    "TSContextDisable",
    "TSContextToggle",
  },
  opts = {
    -- How many lines the window should span. Values <= 0 mean no limit.
    max_lines = 1,

    -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    trim_scope = "outer",

    -- Line used to calculate context. Choices: 'cursor', 'topline'
    mode = "topline",

    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
  },
  config = function(_, opts)
    require("treesitter-context").setup(opts)
    vim.cmd "TSContextEnable"
  end,
}
