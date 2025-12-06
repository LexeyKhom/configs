return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "Avante" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    "HakonHarnes/img-clip.nvim",
  },
  opts = {
    file_types = { "markdown", "Avante" },
    sign = { enabled = false },
    code = { language_name = false },
    quote = { repeat_linebreak = true },
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
  },
}
