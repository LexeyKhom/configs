local configs = require("utils.load").db_configs()
local connections = {}
for i, c in pairs(configs) do
  connections[i] = {
    driver = c.driver,
    dataSourceName = "${protocol}://${user}:${password}@${host}:${port}/${dbname}"
        % c,
  }
end

return {
  tree = {
    "sql",
  },

  lsp = {
    {
      "sqls",
      mason = "sqls",
      setting = {
        sqls = {
          connections = connections,
        },
      },
    },
  },

  null = {
    {
      "d.sqlfluff",
      mason = "sqlfluff",
      setting = { extra_args = { "--dialect", "postgres" } },
    },
    {
      "f.sqlfluff",
      mason = "sql-formatter",
      setting = { extra_args = { "--dialect", "postgres" } },
    },
  },
}
