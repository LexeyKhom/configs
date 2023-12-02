return {
  "lexeykhom/base46",
  enabled = false,
  keys = function()
    require("utils.load").mappings {
      n = {
        -- Theme switcher
        ["<leader>fT"] = { "<cmd> Telescope themes <CR>", "Find Theme" },
      },
    }
  end,
  build = function()
    require("base46").load_all_highlights()
  end,
  opts = {
    ui = {
      theme = "onedark",
    },
  },
}
