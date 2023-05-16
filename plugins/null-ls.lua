return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = function()
    local b = require("null-ls").builtins
    local f = b.formatting
    local d = b.diagnostics
    local a = b.code_actions
    local c = b.completion

    return {
      debug = true,
      sources = {

        -- Global (Html, CSS/SCSS, JS/TS, JSON, React, Vue, Markdown)
        f.prettier,

        -- CSS
        d.stylelint,
        f.stylelint,

        -- JavaScript
        a.eslint_d,
        d.eslint_d,
        f.eslint_d,

        -- JSON
        d.jsonlint,

        -- C/C++
        d.clang_check,
        f.clang_format,

        -- Lua/Vim
        f.stylua,

        -- Git
        a.gitsigns,
        a.gitrebase,
        d.gitlint,

        -- Markdown
        d.markdownlint,
        f.markdownlint,

        -- Bash / Fish
        a.shellcheck,
        d.shellcheck,
        d.fish,
        f.fish_indent,

        -- Other
        a.refactoring,
        c.tags,
        d.todo_comments,
        -- d.editorconfig_checker,

        -- Pascal
        f.ptop,
      },
    }
  end,
}
