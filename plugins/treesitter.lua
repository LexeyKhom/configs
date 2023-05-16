return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- HTML
      "html",

      -- CSS
      "css",
      "scss",

      -- JavaScript
      "javascript",
      "typescript",
      "tsx",
      "svelte",
      "vue",

      -- JSON
      "json",
      "json5",

      -- Lua/Vim
      "lua",
      "vim",
      "vimdoc",

      -- C/C++
      "c",
      "cpp",

      -- Git
      "gitignore",
      "gitcommit",
      "git_config",
      "git_rebase",
      "diff",

      -- Bash
      "bash",
      "fish",

      -- Other
      "markdown",
      "dockerfile",
      "comment",
      "regex",
    },

    auto_install = true,
    indent = {
      enable = true,
    },
  },
}
