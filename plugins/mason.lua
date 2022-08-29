return {
  ensure_installed = {
    -- ----- --
    -- Debug --
    "chrome-debug-adapter",
    "firefox-debug-adapter",
    "node-debug2-adapter",

    -- ------ --
    -- Linter --
    "eslint_d",
    "gitlint",

    -- --------- --
    -- Formatter --
    "prettier",
    "prettierd",
    "stylua",
    "markdownlint",

    -- --- --
    -- LSP --

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
    "vue-language-server",

    -- JSON
    "json-lsp",

    -- Lua/Vim
    "lua-language-server",
    "vim-language-server",

    -- Other
    "bash-language-server",
  },
}
