return {
    config = function()
      require "plugins.configs.lspconfig"

      local on_attach = require("plugins.configs.lspconfig").on_attach
      local capabilities = require("plugins.configs.lspconfig").capabilities

      local lspconfig = require "lspconfig"
      local servers = {
        -- HTML
        "html",
        "emmet_ls",

        -- CSS
        "cssls",
        "cssmodules_ls",
        "stylelint_lsp",

        -- JavaScript
        "eslint",
        "tsserver",
        "svelte",
        "vuels",

        -- JSON
        "jsonls",

        -- Lua/Vim
        "sumneko_lua",
        "vimls",

        -- Other
        "marksman",
        "bashls",
        "dockerls",
      }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      end
    end,
  }
