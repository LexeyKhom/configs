return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "Avante" },
  dependencies = {
    "LexeyKhom/nvconfig",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    "HakonHarnes/img-clip.nvim",
  },
  opts = {
    file_types = { "markdown", "Avante" },
    sign = { enabled = false },
    latex = {
      converter = "utftex",
      top_pad = 1,
      bottom_pad = 0,
    },
    heading = {
      width = "full", -- full | block
      border = true,
      border_virtual = true,
      left_pad = 1,
      right_pad = 2,
      icons = { "󰬺 ", "󰬻 ", "󰬼 ", "󰬽 ", "󰬾 ", "󰬿 " },
    },
    checkbox = {
      unchecked = { icon = " " },
      checked = { icon = " " },
      custom = {
        todo = {
          raw = "[-]",
          rendered = " ",
          highlight = "RenderMarkdownTodo",
        },
        important = {
          raw = "[!]",
          rendered = " ",
          highlight = "RenderMarkdownImportant",
        },
        review = {
          raw = "[?]",
          rendered = " ",
          highlight = "RenderMarkdownReview",
        },
      },
    },
    quote = { repeat_linebreak = true },
  },
}
