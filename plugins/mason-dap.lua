return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
  },
  opts = {
    automatic_installation = true,

    ensure_installed = {
      "cppdbg",
      "node2",
      "chrome",
      "firefox",
      "js",
      "bash",
    },
  },
}
