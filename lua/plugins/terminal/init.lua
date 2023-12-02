local Term = require "plugins.terminal.term"
return {
  "akinsho/toggleterm.nvim",
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
            local onCallback = function(cmd)
              Term.exec(cmd)
            end
            execute(onError, onCallback)
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
  opts = {
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
    },
    highlights = {
      NormalFloat = {
        guibg = "#161613",
      },
      FloatBorder = {
        guifg = "#161613",
        guibg = "#161613",
      },
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
  end,
}
