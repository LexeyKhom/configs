return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "LexeyKhom/nvconfig",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    "HakonHarnes/img-clip.nvim",
  },
  ft = { "markdown", "Avante" },
  opts = {
    file_types = { "markdown", "Avante" },
    sign = { enabled = false },
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
        progress = {
          raw = "[-]",
          rendered = " ",
          highlight = "RenderMarkdownProgress",
        },
        question = {
          raw = "[?]",
          rendered = " ",
          highlight = "RenderMarkdownQuestion",
        },
        warn = {
          raw = "[!]",
          rendered = " ",
          highlight = "RenderMarkdownWarn",
        },
      },
    },
    quote = { repeat_linebreak = true },
  },
}
