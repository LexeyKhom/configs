local configs = require("utils.loader").db_configs()
local dbs = {}
for i, c in pairs(configs) do
  dbs[i] = {
    name = c.name,
    url = "${protocol}://${user}:${password}@${host}:${port}/${dbname}" % c,
  }
end

return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
  },
  keys = function()
    require("utils.loader").mappings {
      n = {
        ["<A-N>"] = {
          "<cmd>DBUIToggle<CR>",
          "DBUI Toggle",
        },
      },
    }
  end,
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    vim.g.dbs = dbs
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_use_nvim_notify = 1
  end,
}
