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

        [KEYS.TERMINAL_VERTICAL] = {
          function()
            Term.toggle "vertical"
          end,
          "Terminal vertical",
        },

        [KEYS.TERMINAL_HORIZONTAL] = {
          function()
            Term.toggle "horizontal"
          end,
          "Terminal horizontal",
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
        [KEYS.TERMINAL .. "," .. KEYS.TERMINAL_VERTICAL .. "," .. KEYS.TERMINAL_HORIZONTAL] = {
          function()
            vim.cmd "ToggleTerm"
          end,
          "Terminal close",
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
          return 12
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.5
        end
      end,
      float_opts = {
        border = "single", -- 'single' | 'double' | 'shadow' | "curved"
        width = function()
          local screen_width = vim.o.columns
          local width = math.floor(screen_width)
          if screen_width > SMALL_SCREEN_WIDTH then
            width = math.floor(screen_width * 0.86)
          end
          return width
        end,
        height = function()
          local screen_width = vim.o.columns
          local screen_height = vim.o.window
          local height = screen_height - 2
          if screen_width > SMALL_SCREEN_WIDTH then
            height = math.floor(screen_height * 0.86)
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
