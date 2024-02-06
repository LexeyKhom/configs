local Term = require "plugins.terminal.term"
return {
  "akinsho/toggleterm.nvim",
  dependencies = { "LexeyKhom/nvconfig" },
  version = "*",
  cmd = Term.cmd,
  keys = function()
    local KEYS = require "core.mappings"
    require("utils.load").mappings {
      n = {
        [KEYS.TERMINAL] = {
          function()
            Term.toggle "float"
          end,
          "Terminal float",
        },

        [KEYS.TERMINAL_ALT] = {
          function()
            Term.toggle "vertical"
          end,
          "Terminal vertical",
        },

        [KEYS.EXECUTE] = {
          function()
            local execute = require "plugins.terminal.execute"
            local onError = function(errorMessage)
              print(errorMessage)
            end
            local onSuccess = function(cmd)
              Term.exec(cmd)
            end
            execute(onError, onSuccess)
          end,
          "Execute this",
        },

        ["<leader>gc"] = {
          function()
            vim.cmd "DiffviewClose"
            Term.exec "git commit"
          end,
          "Git commit",
        },
      },

      t = {
        [KEYS.TERMINAL .. "," .. KEYS.TERMINAL_ALT] = {
          function()
            vim.cmd "ToggleTerm"
          end,
          "Terminal float",
        },
      },
    }
  end,
  opts = function()
    local SMALL_SCREEN_WIDTH = 100
    local c = require("base46").get_theme_tb "base_30"
    return {
      direction = "float",
      start_in_insert = true,
      shade_terminals = true,
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.5
        end
      end,
      float_opts = {
        border = "single", -- 'single' | 'double' | 'shadow' | "curved"
        width = function()
          local width = vim.o.columns
          if width > SMALL_SCREEN_WIDTH then
            width = math.floor(width * 0.85)
          end
          return width
        end,
        height = function()
          local width = vim.o.columns
          local height = vim.o.window - 2
          if width > SMALL_SCREEN_WIDTH then
            height = math.floor(height * 0.85)
          end
          return height
        end,
      },
      highlights = {
        NormalFloat = {
          guibg = c.darker_black,
        },
        FloatBorder = {
          guifg = c.darker_black,
          guibg = c.darker_black,
        },
      },
    }
  end,
  config = function(_, opts)
    require("toggleterm").setup(opts)
  end,
}
