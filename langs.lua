-- Treesitter: (https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)
-- LSP: (https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
-- Null-ls: (https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md)
-- DAP: (https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation)
-- Mason: (https://mason-registry.dev/registry/list)

local M = {}

M.html = {
  tree = {
    "html",
  },

  lsp = {
    { "html", mason = "html-lsp" },
    { "emmet_ls", mason = "emmet-ls" },
  },

  null = {
    {
      "f.prettier",
      mason = "prettier",
      setting = {
        disabled_filetypes = {
          "javascript",
          "typescript",
          "typescriptreact",
          "javascriptreact",
          "vue",
        },
      },
    },
  },
}

M.css = {
  tree = {
    "css",
    "scss",
  },

  lsp = {
    { "cssls", mason = "css-lsp" },
    { "cssmodules_ls", mason = "cssmodules-language-server" },
    { "stylelint_lsp", mason = "stylelint-lsp" },
    { "tailwindcss", mason = "tailwindcss-language-server" },
  },

  null = {
    { "d.stylelint", mason = "stylelint" },
    { "f.stylelint", mason = "stylelint" },
    { "f.rustywind", mason = "rustywind" },
  },
}

M.javaScript = {
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
    { "svelte", mason = "svelte-language-server" },
    { "volar", mason = "vue-language-server" },
    { "angularls", mason = "angular-language-server" },
    { "astro", mason = "astro-language-server" },
  },

  null = {
    "a.eslint",
    "f.eslint",
  },

  dap = {
    { "js", mason = "js-debug-adapter" },
    { "chrome", mason = "chrome-debug-adapter" },
    { "firefox", mason = "firefox-debug-adapter" },
  },
}

M.python = {
  tree = {
    "python",
  },

  lsp = {
    { "pyright", mason = "pyright" },
    { "ruff_lsp", mason = "ruff-lsp" },
  },

  null = {
    { "d.pydocstyle", mason = "pydocstyle" },
    { "d.mypy", mason = "mypy" },
    { "d.ruff", mason = "ruff" },
    { "f.ruff", mason = "ruff" },
  },
}

M.cpp = {
  tree = {
    "c",
    "cpp",
  },

  lsp = {
    { "clangd", mason = "clangd" },
  },

  null = {
    { "d.cpplint", mason = "cpplint" },
    { "f.clang_format", mason = "clang-format" },
    -- d.clang_check
  },
}

M.cmake = {
  tree = {
    "cmake",
  },

  lsp = {
    { "cmake", mason = "cmake-language-server" },
  },

  null = {
    { "d.cmake_lint", mason = "cmakelint" },
    { "f.gersemi", mason = "gersemi" },
  },
}

M.rust = {
  tree = {
    "rust",
  },

  lsp = {
    { "rust_analyzer", mason = "rust-analyzer" },
  },

  null = {
    { "f.rustfmt", mason = "rustfmt" },
  },
}

M.godot = {
  tree = {
    "gdscript",
    "godot_resource",
  },

  lsp = {
    { "gdscript", filter = { "mason" } },
  },

  null = {
    { "d.gdlint", mason = "gdtoolkit" },
    { "f.gdformat", mason = "gdtoolkit" },
  },
}

M.lua = {
  tree = {
    "lua",
    "luadoc",
  },

  null = {
    { "f.stylua", mason = "stylua" },
  },
}

M.vim = {
  tree = {
    "vim",
    "vimdoc",
  },

  lsp = {
    { "vimls", mason = "vim-language-server" },
  },
}

M.bash = {
  tree = {
    "bash",
  },

  lsp = {
    { "bashls", mason = "bash-language-server" },
  },

  null = {
    { "a.shellcheck", mason = "shellcheck" },
    { "d.shellcheck", mason = "shellcheck" },
  },

  dap = {
    { "bash", mason = "bash-debug-adapter" },
  },
}

M.fish = {
  tree = {
    "fish",
  },

  null = {
    "d.fish",
    "f.fish_indent",
  },
}

M.json = {
  tree = {
    "json",
    "json5",
  },

  lsp = {
    { "jsonls", mason = "json-lsp" },
  },

  null = {
    { "d.jsonlint", mason = "jsonlint" },
  },
}

M.graphql = {
  tree = {
    "graphql",
  },

  lsp = {
    { "graphql", mason = "graphql-language-service-cli" },
  },
}

M.md = {
  tree = {
    "markdown",
    "markdown_inline",
  },

  null = {
    { "d.markdownlint", mason = "markdownlint" },
    { "f.markdownlint", mason = "markdownlint" },
  },
}

M.docker = {
  tree = {
    "dockerfile",
  },

  lsp = {
    { "dockerls", mason = "dockerfile-language-server" },
  },
}

M.pascal = {
  tree = {
    "pascal",
  },

  null = {
    "f.ptop",
  },
}

M.git = {
  tree = {
    "diff",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
  },

  null = {
    { "d.gitlint", mason = "gitlint" },
    "a.gitsigns",
    "a.gitrebase",
  },
}

M.other = {
  tree = {
    "comment",
    "regex",
    "todotxt",
  },

  null = {
    "a.refactoring",
    "c.tags",
    "d.todo_comments",
  },
}

return M
