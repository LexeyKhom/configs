return {
  tree = {
    "javascript",
    "typescript",
    "tsx",
    "jsdoc",
    "svelte",
    "vue",
    "astro",
  },

  lsp = {
    { "eslint", mason = "eslint-lsp" },
    { "tsserver", mason = "typescript-language-server@4.0.0" },
    -- { "volar", mason = "vue-language-server" },
    -- { "svelte", mason = "svelte-language-server" },
    -- { "angularls", mason = "angular-language-server" },
    -- { "astro", mason = "astro-language-server" },
  },

  null = {
    { "a.eslint_d", mason = "eslint_d" },
  },

  dap = {
    { "js", mason = "js-debug-adapter" },
    -- { "chrome", mason = "chrome-debug-adapter" },
    -- { "firefox", mason = "firefox-debug-adapter" },
  },
}
