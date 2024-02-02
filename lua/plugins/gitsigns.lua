return {
  "lewis6991/gitsigns.nvim",
  event = { "BufRead", "BufNewFile" },
  opts = function()
    return {
      on_attach = function()
        require("utils.load").mappings {
          n = {
            -- Navigation through hunks
            ["]g"] = {
              function()
                if vim.wo.diff then
                  return "]g"
                end
                vim.schedule(function()
                  require("gitsigns").next_hunk()
                end)
                return "<Ignore>"
              end,
              "Next git hunk",
              { expr = true },
            },

            ["[g"] = {
              function()
                if vim.wo.diff then
                  return "[g"
                end
                vim.schedule(function()
                  require("gitsigns").prev_hunk()
                end)
                return "<Ignore>"
              end,
              "Previous git hunk",
              { expr = true },
            },

            -- Actions
            ["<leader>ga"] = {
              function()
                require("gitsigns").stage_hunk()
              end,
              "Git add hunk",
            },

            ["<leader>gA"] = {
              function()
                require("gitsigns").stage_buffer()
              end,
              "Git add buffer",
            },

            ["<leader>gu"] = {
              function()
                require("gitsigns").undo_stage_hunk()
              end,
              "Git undo add hunk",
            },

            ["<leader>gr"] = {
              function()
                require("gitsigns").reset_hunk()
              end,
              "Git reset hunk",
            },

            ["<leader>gR"] = {
              function()
                require("gitsigns").reset_buffer()
              end,
              "Git reset buffer",
            },

            ["<leader>gb"] = {
              function()
                require("gitsigns").blame_line()
              end,
              "Git blame line",
            },

            ["<leader>gt"] = {
              function()
                require("gitsigns").preview_hunk()
              end,
              "Git toggle preview",
            },
          },

          v = {
            ["<leader>gs"] = {
              function()
                require("gitsigns").select_hunk()
              end,
              "Git select hunk",
            },

            ["<leader>ga"] = {
              function()
                require("gitsigns").stage_hunk {
                  vim.fn.line ".",
                  vim.fn.line "v",
                }
              end,
              "Git add select",
            },

            ["<leader>gr"] = {
              function()
                require("gitsigns").reset_hunk {
                  vim.fn.line ".",
                  vim.fn.line "v",
                }
              end,
              "Git reset select",
            },
          },
        }
      end,
    }
  end,
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end,
}
