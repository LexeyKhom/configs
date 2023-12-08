return {
  "neovim/nvim-lspconfig",
  event = { "BufRead", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "smjonas/inc-rename.nvim",
  },
  init = function()
    -- Change default signs
    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
  end,
  opts = function()
    local opts = {}
    opts.on_attach = function(_, bufnr)
      local maps = require "plugins.lspconfig.mappings"
      require("utils.load").mappings(maps, { buffer = bufnr })
    end
    -- opts.capabilities = require("cmp_nvim_lsp").default_capabilities()
    opts.capabilities = vim.lsp.protocol.make_client_capabilities()
    opts.capabilities.textDocument.completion = require("cmp_nvim_lsp").default_capabilities().textDocument.completion
    return opts
  end,
  config = function(_, opts)
    local lspconfig = require "lspconfig"
    local servers, settings = require("utils.load").langs "lsp"
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = opts.on_attach,
        capabilities = opts.capabilities,
        settings = settings[lsp] or {},
      }
    end
  end,
}
