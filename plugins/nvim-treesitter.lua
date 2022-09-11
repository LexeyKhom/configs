return {
  override_options = function()
    return {
      auto_install = true,

      ensure_installed = {
        -- HTML
        "html",

        -- CSS
        "css",
        "scss",

        -- JavaScript
        "javascript",
        "typescript",
        "svelte",
        "vue",

        -- JSON
        "json",
        "json5",

        -- Lua/Vim
        "lua",
        "vim",

        -- Other
        "bash",
        "fish",
        "gitignore",
        "comment",
        "regex",
        "markdown",
      },
    }
  end,
}
