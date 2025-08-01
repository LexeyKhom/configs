return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  lazy = true,
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function(_, opts)
    local snippets_path = vim.fn.stdpath "config" .. "/.snippets"
    require("luasnip.loaders.from_vscode").lazy_load { exclude = { "gdscript" } }
    require("luasnip.loaders.from_vscode").lazy_load { paths = snippets_path }

    -- Unlink the current LuaSnip snippet on InsertLeave if no jump is active.
    vim.api.nvim_create_autocmd("InsertLeave", {
      callback = function()
        if
          require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
          and not require("luasnip").session.jump_active
        then
          require("luasnip").unlink_current()
        end
      end,
    })
  end,
}
