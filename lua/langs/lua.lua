return {
  tree = {
    "lua",
    "luadoc",
  },

  lsp = {
    {
      "lua_ls",
      mason = "lua-language-server",
      setting = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
              [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    },
  },

  null = {
    { "f.stylua", mason = "stylua" },
  },
}
