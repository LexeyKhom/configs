return {
  "mfussenegger/nvim-dap",
  cmd = {
    "DapToggleBreakpoint",
    "DapContinue",
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    { "theHamsta/nvim-dap-virtual-text", opts = {} },
    {
      "igorlfs/nvim-dap-view",
      opts = {
        auto_toggle = true,
        winbar = {
          sections = {
            "watches",
            "scopes",
            "threads",
            "exceptions",
            "breakpoints",
            "repl",
            "disassembly",
          },
        },
      },
    },
    {
      "Jorenar/nvim-dap-disasm",
      dependencies = { "igorlfs/nvim-dap-view" },
      opts = { dapview = { label = "Disassembly" } },
    },
  },
  keys = require "plugins.dap.mappings",
  config = require "plugins.dap.config",
}
