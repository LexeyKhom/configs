return {
  n = {
    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "single" } }
      end,
      "Previous diagnostic",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "single" } }
      end,
      "Next diagnostic",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gd"] = {
      function()
        require("telescope.builtin").lsp_definitions()
      end,
      "LSP definition",
    },

    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gi"] = {
      function()
        -- vim.lsp.buf.implementation()
        require("telescope.builtin").lsp_implementations()
      end,
      "LSP implementation",
    },

    ["gr"] = {
      function()
        -- vim.lsp.buf.references()
        require("telescope.builtin").lsp_references()
      end,
      "LSP references",
    },

    ["gt"] = {
      function()
        -- vim.lsp.buf.type_definition()
        require("telescope.builtin").lsp_type_definitions()
      end,
      "LSP definition type",
    },

    ["gs"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code actions",
    },

    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = "single" }
      end,
      "LSP Floating diagnostic",
    },

    ["<leader>qq"] = {
      function()
        require("telescope.builtin").diagnostics()
      end,
      "Quikfix Diagnostic",
    },

    ["<leader>qb"] = {
      function()
        require("telescope.builtin").diagnostics { bufnr = 0 }
      end,
      "Quikfix Diagnostic Buffer",
    },

    ["<leader>lwa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>lwr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>lwl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },

  v = {
    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code actions",
    },
  },
}
