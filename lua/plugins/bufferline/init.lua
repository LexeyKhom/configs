return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "LexeyKhom/nvconfig",
  },
  version = "*",
  lazy = false,
  init = function()
    local KEYS = require "core.mappings"
    require("utils.load").mappings {
      n = {
        [KEYS.UP .. ",<Tab>"] = {
          "<cmd> BufferLineCycleNext <CR>",
          "Next Buffer",
        },

        [KEYS.DOWN .. ",<S-Tab>"] = {
          "<cmd> BufferLineCyclePrev <CR>",
          "Prev Buffer",
        },

        [string.upper(KEYS.UP)] = {
          "<cmd> BufferLineMoveNext <CR>",
          "Next Buffer",
        },

        [string.upper(KEYS.DOWN)] = {
          "<cmd> BufferLineMovePrev <CR>",
          "Prev Buffer",
        },

        [KEYS.CLOSE] = {
          "<cmd> bdelete <CR>",
          "Close Buffer",
        },

        ["<A-1>"] = {
          "<cmd> BufferLineGoToBuffer 1 <CR>",
          "Goto Buffer 1",
        },

        ["<A-2>"] = {
          "<cmd> BufferLineGoToBuffer 2 <CR>",
          "Goto Buffer 2",
        },

        ["<A-3>"] = {
          "<cmd> BufferLineGoToBuffer 3 <CR>",
          "Goto Buffer 3",
        },

        ["<A-4>"] = {
          "<cmd> BufferLineGoToBuffer 4 <CR>",
          "Goto Buffer 4",
        },

        ["<leader>bse"] = {
          "<cmd> BufferLineSortByExtension <CR>",
          "Buffer Sort by Extension",
        },

        ["<leader>bsd"] = {
          "<cmd> BufferLineSortByDirectory <CR>",
          "Buffer Sort by Directory",
        },
      },
    }
  end,
  opts = function()
    local theme = require "plugins.bufferline.theme"
    return {
      highlights = theme,
      options = {
        themable = true,          -- allows highlight groups to be overriden i.e. sets highlights as default
        separator_style = "thin", -- "slant" "slope", "thick", "thin"
        always_show_bufferline = true,
        left_trunc_marker = "",
        right_trunc_marker = "",
        offsets = {
          {
            filetype = "NvimTree",
            text = require("utils.fs").getCurDir,
            text_align = "center",
            separator = true,
            highlight = "BufferLineFill",
          },
          {
            filetype = "undotree",
            text = "UndoTree",
            text_align = "center",
            separator = true,
            highlight = "BufferLineFill",
          },
          {
            filetype = "spectre_panel",
            text = "Spectre",
            text_align = "center",
            separator = true,
            highlight = "BufferLineFill",
          },
          {
            filetype = "DiffviewFiles",
            text = require("utils.fs").getCurDir,
            text_align = "center",
            separator = true,
            highlight = "BufferLineFill",
          },
          {
            filetype = "toggleterm",
            separator = true,
            highlight = "BufferLineFill",
          },
        },
      },
    }
  end,
  config = function(_, opts)
    require("bufferline").setup(opts)
  end,
}
