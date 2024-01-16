local loadSources = function()
  local builtins = require("null-ls").builtins
  local split = require("utils.string").split
  local unpack = require("utils.table").unpack
  local configs, settings = require("utils.load").langs "null"
  local def = {
    a = "code_actions",
    c = "completion",
    d = "diagnostics",
    f = "formatting",
  }

  local sources = {}
  for _, config in pairs(configs) do
    local shortMode, name = unpack(split(config, "."))
    local mode = def[shortMode]
    local setting = settings[config] or {}
    local source = builtins[mode][name].with(setting)
    table.insert(sources, source)
  end
  return sources
end

return {
  "nvimtools/none-ls.nvim",
  event = { "BufRead", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  keys = function()
    require("utils.load").mappings {
      n = {
        ["<A-f>,<C-f>"] = {
          function()
            vim.lsp.buf.format { async = true }
          end,
          "Formatting",
        },

        ["<leader>lF"] = {
          function()
            local fileType = vim.fn.expand "%:e"
            if fileType == "" then
              print "File type not specified"
              return
            end
            local cmd = vim.cmd
            cmd("args ./**/*." .. fileType)
            cmd "silent argdo lua vim.lsp.buf.format()"
            cmd "wa"
          end,
          "Format all files",
        },
      },
    }
  end,
  opts = function()
    return {
      debug = true,
      sources = loadSources(),
    }
  end,
  config = function(_, opts)
    require("null-ls").setup(opts)
  end,
}
