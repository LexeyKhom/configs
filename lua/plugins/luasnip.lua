return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  lazy = true,
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function(_, opts)
    local snippets_path = vim.fn.stdpath "config" .. "/.snippets"
    require("luasnip.loaders.from_vscode").lazy_load { exclude = { "gdscript" } }
    require("luasnip.loaders.from_vscode").lazy_load { paths = snippets_path }
  end,
}
