return {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
  opts = {
    ensure_installed = require("utils.load").langs "mason",
    PATH = "skip",
    ui = {
      icons = {
        package_pending = " ",
        package_installed = " ",
        package_uninstalled = " ",
      },
    },
  },
  init = function()
    -- Add binaries installed by mason.nvim to path
    local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
    vim.env.PATH = vim.fn.stdpath "data"
        .. "/mason/bin"
        .. (is_windows and ";" or ":")
        .. vim.env.PATH
  end,
  config = function(_, opts)
    require("mason").setup(opts)

    -- Custom cmd to install all mason binaries listed
    vim.api.nvim_create_user_command("MasonInstallAll", function()
      vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
    end, {})
    vim.g.mason_binaries_list = opts.ensure_installed
  end,
}
