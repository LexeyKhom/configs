return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "InsertEnter" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "smjonas/inc-rename.nvim",
  },
  init = function()
    local s = vim.diagnostic.severity
    vim.diagnostic.config {
      signs = {
        text = {
          [s.ERROR] = "󰅚",
          [s.WARN] = "󰀪",
          [s.INFO] = "",
          [s.HINT] = "󰌶",
        },
        linehl = {
          [s.ERROR] = "DiagnosticLineError",
        },
        numhl = {
          [s.ERROR] = "DiagnosticSignError",
          [s.WARN] = "DiagnosticSignWarn",
          [s.INFO] = "DiagnosticSignInfo",
          [s.HINT] = "DiagnosticSignHint",
        },
      },
    }
  end,
  opts = function()
    local opts = {}

    local servers, settings = require("utils.loader").langs "lsp"
    opts.servers = servers
    opts.settings = settings

    opts.on_attach = function(_, bufnr)
      local maps = require "plugins.lspconfig.mappings"
      require("utils.loader").mappings(maps, { buffer = bufnr })
    end

    opts.capabilities = require("cmp_nvim_lsp").default_capabilities()

    return opts
  end,
  config = function(_, opts)
    local lspconfig = require "lspconfig"
    for _, lsp in ipairs(opts.servers) do
      lspconfig[lsp].setup {
        on_attach = opts.on_attach,
        capabilities = opts.capabilities,
        settings = opts.settings[lsp] or {},
      }
    end
  end,
}
