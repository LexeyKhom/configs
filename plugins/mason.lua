return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      ------ Debug ------
      "chrome-debug-adapter",
      "firefox-debug-adapter",
      "node-debug2-adapter",
      "bash-debug-adapter",

      ------ Formatter ------
      "prettier",
      "prettierd",
      "clang-format",
      "stylua",
      "markdownlint",

      ------ Linter ------
      -- CSS
      "stylelint",

      -- JavaScript
      "eslint_d",

      -- JSON
      "jsonlint",

      -- Other
      "shellcheck",
      "gitlint",
      "textlint",

      ------ LSP ------
      -- HTML
      "html-lsp",
      "emmet-ls",

      -- CSS
      "css-lsp",
      "cssmodules-language-server",
      "stylelint-lsp",

      -- JavaScript
      "eslint-lsp",
      "typescript-language-server",
      "svelte-language-server",

      -- Vue
      "vue-language-server",
      "vetur-vls",

      -- JSON
      "json-lsp",

      -- C/C++
      "clangd",

      -- Lua/Vim
      "lua-language-server",
      "vim-language-server",

      -- Other
      "marksman",
      "bash-language-server",
      "dockerfile-language-server",
    },

    ui = {
      icons = {
        package_pending = " ",
        package_installed = " ",
        package_uninstalled = " ",
      },
    },
  },
}
