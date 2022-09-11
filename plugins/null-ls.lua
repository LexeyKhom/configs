return {
  after = "nvim-lspconfig",
  config = function()
    local present, null_ls = pcall(require, "null-ls")

    if not present then
      return
    end

    local b = null_ls.builtins
    local sources = {
      -- Prettier (Html, CSS/SCSS, JS, JSON)
      b.formatting.prettier,
      b.formatting.prettier_standard, -- Eslint + Prettier

      -- CSS
      b.diagnostics.stylelint,
      b.formatting.stylelint,

      -- JavaScript
      b.code_actions.eslint_d,
      b.diagnostics.eslint_d,
      b.formatting.eslint_d,

      -- JSON
      b.diagnostics.jsonlint,

      -- Lua/Vim
      b.formatting.stylua,

      -- Markdown
      b.diagnostics.markdownlint,
      b.formatting.markdownlint,

      -- Git
      b.code_actions.gitsigns,
      b.code_actions.gitrebase,
      b.diagnostics.gitlint,

      -- Other
      b.code_actions.refactoring,
      b.completion.tags,
      b.completion.vsnip,
    }

    null_ls.setup {
      debug = true,
      sources = sources,
    }
  end,
}
