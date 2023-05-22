return {
  "NvChad/nvterm",
  keys = function()
    require("core.utils").load_mappings "nvterm"
  end,
  opts = {
    terminals = {
      type_opts = {
        float = {
          relative = "editor",
          row = 0,
          col = 0,
          width = 1,
          height = 0.9,
          border = "none",
        },
        horizontal = { location = "rightbelow", split_ratio = 0.5 },
        vertical = { location = "rightbelow", split_ratio = 0.5 },
      },
    },
  },
}
