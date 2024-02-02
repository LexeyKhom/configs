local getVisualSelection = function()
  vim.cmd 'noau normal! "vy"'
  local text = vim.fn.getreg "v"
  vim.fn.setreg("v", {})
  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ""
  end
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter",

    -- Plugins
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "danielvolchek/tailiscope.nvim",
  },
  cmd = "Telescope",
  keys = function()
    require("utils.load").mappings {
      n = {
        -- Find
        ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
        ["<leader>fa"] = {
          "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
          "Find all",
        },
        ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Find word" },
        ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
        ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Find help" },
        ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
        -- ["<leader>ft"] = { "<cmd> Telescope terms <CR>", "Find term" },
        ["<leader>fc"] = {
          "<cmd> Telescope current_buffer_fuzzy_find <CR>",
          "Find in current buffer",
        },
        ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "Find marks" },
        ["<leader>fl"] = { "<cmd> Telescope resume <CR>", "Find last" },

        -- Plugins
        ["<leader>ft"] = {
          "<cmd> Telescope tailiscope all <CR>",
          "Find tailwind",
        },

        -- Git
        ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },
      },

      v = {
        ["<leader>fw"] = {
          function()
            local text = getVisualSelection()
            require("telescope.builtin").live_grep { default_text = text }
          end,
          "Find word",
        },
        ["<leader>fc"] = {
          function()
            local text = getVisualSelection()
            require("telescope.builtin").current_buffer_fuzzy_find {
              default_text = text,
            }
          end,
          "Find in current buffer",
        },
      },
    }
  end,
  opts = function()
    local actions = require "telescope.actions"
    local KEYS = require "core.mappings"
    return {
      defaults = {
        mappings = {
          n = {
            ["o"] = actions.select_default,
            [KEYS.ENTER] = actions.select_default,

            ["<leader>x"] = actions.close,
            [KEYS.QUIT] = actions.close,
            ["q"] = actions.close,
          },

          i = {
            [KEYS.QUIT] = false,
            ["<A-o>"] = actions.select_default,
            [KEYS.ENTER] = actions.select_default,
            [KEYS.BACKSPACE] = false,
            [KEYS.UP] = actions.move_selection_previous,
            [KEYS.DOWN] = actions.move_selection_next,
          },
        },

        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = {
          "─",
          "│",
          "─",
          "│",
          "╭",
          "╮",
          "╯",
          "╰",
        },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
      },

      extensions_list = {
        "themes",
        "fzf",
        "tailiscope",
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    }
  end,
  config = function(_, opts)
    local telescope = require "telescope"
    telescope.setup(opts)

    -- load extensions
    for _, extension in ipairs(opts.extensions_list) do
      telescope.load_extension(extension)
    end
  end,
}
