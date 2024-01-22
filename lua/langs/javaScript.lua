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
    { "tsserver", mason = "typescript-language-server" },
    -- { "volar", mason = "vue-language-server" },
    -- { "svelte", mason = "svelte-language-server" },
    -- { "angularls", mason = "angular-language-server" },
    -- { "astro", mason = "astro-language-server" },
  },

  null = {
    { "a.eslint_d", mason = "eslint_d" },
    -- { "d.eslint_d", mason = "eslint_d" }, -- Some times need
  },

  dap = {
    { "js", mason = "js-debug-adapter" },
    -- { "chrome", mason = "chrome-debug-adapter" },
    -- { "firefox", mason = "firefox-debug-adapter" },
  },
}
