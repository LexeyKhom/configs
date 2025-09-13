local Term = require "plugins.terminal.term"
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = Term.cmd,
  keys = function()
    local KEYS = require "core.mappings"
    require("utils.loader").mappings {
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
        [KEYS.TERMINAL .. "," .. KEYS.TERMINAL_VERTICAL] = {
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
    local highlights = require "plugins.terminal.theme"
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
          local screen_height = vim.o.lines
          local height = screen_height - 3
          if screen_width > SMALL_SCREEN_WIDTH then
            height = math.floor(screen_height * 0.86)
          end
          return height
        end,
      },
      highlights = highlights,
    }
  end,
}
