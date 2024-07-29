return {
  "niuiic/translate.nvim",
  cmd = {
    "TransToRU",
    "TransToEN",
    "TransToENfromInput",
    "TransToRUfromInput",
  },
  dependencies = { "niuiic/core.nvim" },
  keys = function()
    require("utils.load").mappings {
      n = {
        ["<leader>tr"] = {
          "<cmd> TransToRUfromInput <CR>",
          "Translate to RU",
        },
        ["<leader>te"] = {
          "<cmd> TransToENfromInput <CR>",
          "Translate to EN",
        },
      },

      v = {
        ["<leader>tr"] = {
          "<cmd> TransToRU <CR>",
          "Translate to RU",
        },

        ["<leader>te"] = {
          "<cmd> TransToEN <CR>",
          "Translate to EN",
        },
      },
    }
  end,
  opts = {
    output = {
      float = {
        -- max_width of float window
        max_width = 60,
        -- max_height of float window
        max_height = 8,
        -- whether close float window on cursor move
        close_on_cursor_move = true,
        -- key to enter float window
        enter_key = "T",
      },
    },
    translate = {
      {
        -- use :TransToRU to start this job
        cmd = "TransToRU",
        -- shell command
        -- translate-shell is used here
        command = "trans",
        -- shell command args
        args = function(trans_source)
          -- trans_source is the text you want to translate
          return {
            "-b",
            "-e",
            "google",
            -- use proxy
            -- "-x",
            -- "http://127.0.0.1:10025",
            "-t",
            "ru",
            -- you can filter translate source here
            trans_source,
          }
        end,
        -- how to get translate source
        -- selection | input | clipboard
        input = "selection",
        -- how to output translate result
        -- float_win | notify | clipboard | insert
        output = { "float_win" },
        -- format output
        ---@type fun(output: string): string
        format = function(output)
          return output
        end,
      },
      {
        -- use :TransToEN to start this job
        cmd = "TransToEN",
        -- shell command
        -- translate-shell is used here
        command = "trans",
        -- shell command args
        args = function(trans_source)
          -- trans_source is the text you want to translate
          return {
            "-b",
            "-e",
            "google",
            -- use proxy
            -- "-x",
            -- "http://127.0.0.1:10025",
            "-t",
            "en",
            -- you can filter translate source here
            trans_source,
          }
        end,
        -- how to get translate source
        -- selection | input | clipboard
        input = "selection",
        -- how to output translate result
        -- float_win | notify | clipboard | insert
        output = { "float_win" },
        -- format output
        ---@type fun(output: string): string
        format = function(output)
          return output
        end,
      },
      {
        cmd = "TransToRUfromInput",
        command = "trans",
        args = function(trans_source)
          return {
            "-b",
            "-e",
            "google",
            "-t",
            "ru",
            trans_source,
          }
        end,
        input = "input",
        output = { "float_win" },
        ---@type fun(output: string): string
        format = function(output)
          return output
        end,
      },
      {
        cmd = "TransToENfromInput",
        command = "trans",
        args = function(trans_source)
          return {
            "-b",
            "-e",
            "google",
            "-t",
            "en",
            trans_source,
          }
        end,
        input = "input",
        output = { "float_win" },
        ---@type fun(output: string): string
        format = function(output)
          return output
        end,
      },
    },
  },
  config = function(_, opts)
    require("translate").setup(opts)
  end,
}
