return function()
  local dap = require "dap"
  local MASON_PATH = vim.fn.stdpath "data" .. "/mason/packages/"
  local SIGNS = {
    DapBreakpoint = "",
    DapBreakpointCondition = "󰟃",
    DapBreakpointRejected = "",
    DapLogPoint = "",
    DapStopped = "",
  }

  for hl, icon in pairs(SIGNS) do
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -----------------------------------------------------------------------------
  -- C/C++
  -----------------------------------------------------------------------------

  dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = {
      "-silent",
      "--interpreter=dap",
      "--eval-command",
      "set print pretty on",
    },
  }

  dap.configurations.c = {
    {
      name = "Launch",
      type = "gdb",
      request = "launch",
      program = vim.fn.expand "%:r",
      cwd = "${workspaceFolder}",
      stopAtBeginningOfMainSubprogram = true,
    },
  }

  dap.configurations.asm = dap.configurations.c

  -----------------------------------------------------------------------------
  -- Godot
  -----------------------------------------------------------------------------

  dap.adapters.godot = {
    type = "server",
    host = "127.0.0.1",
    port = 6006,
  }

  dap.configurations.gdscript = {
    {
      type = "godot",
      request = "launch",
      name = "Launch scene",
      project = "${workspaceFolder}",
    },
  }

  -----------------------------------------------------------------------------
  -- Golang
  -----------------------------------------------------------------------------

  dap.adapters.delve = {
    type = "server",
    port = "${port}",
    executable = {
      command = "dlv",
      args = { "dap", "-l", "127.0.0.1:${port}" },
    },
  }

  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
  dap.configurations.go = {
    {
      type = "delve",
      name = "Debug",
      request = "launch",
      program = "${file}",
    },
    {
      type = "delve",
      name = "Debug test", -- configuration for debugging test files
      request = "launch",
      mode = "test",
      program = "${file}",
    },
    -- works with go.mod packages and sub packages
    {
      type = "delve",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}",
    },
  }

  -----------------------------------------------------------------------------
  -- JavaScript
  -----------------------------------------------------------------------------

  dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "node",
      args = {
        MASON_PATH .. "js-debug-adapter/js-debug/src/dapDebugServer.js",
        "${port}",
      },
    },
  }

  dap.configurations.javascript = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
  }

  dap.configurations.typescript = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      runtimeExecutable = "deno",
      runtimeArgs = {
        "run",
        "--inspect-wait",
        "--allow-all",
      },
      program = "${file}",
      cwd = "${workspaceFolder}",
      attachSimplePort = 9229,
    },
  }
end
