return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle" },
  ft = { "markdown" },
  build = "cd app && yarn install",
  keys = function()
    require("utils.load").mappings {
      n = {
        ["<leader>tm"] = { "<cmd> MarkdownPreviewToggle <CR>", "Toggle MarkdownPreview" },
      },
    }
  end,
  init = function()
    local g = vim.g
    g.mkdp_theme = "dark"
    g.mkdp_filetypes = { "markdown" }
    g.mkdp_open_to_the_world = 1
    g.mkdp_port = "8080"

    g.mkdp_auto_start = 0
    g.mkdp_auto_close = 0
    g.mkdp_combine_preview = 1
    g.mkdp_combine_preview_auto_refresh = 1
  end,
}
