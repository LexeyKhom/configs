return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-dap-ui",
    { "theHamsta/nvim-dap-virtual-text", opts = {} },
  },
  keys = function()
    require("utils.loader").mappings {
      n = {
        ["<F1>"] = {
          function()
            require("dap").toggle_breakpoint()
          end,
          "DAP toggle breakpoint",
        },

        ["<F2>"] = {
          function()
            require("dap").toggle_breakpoint(
              nil,
              nil,
              vim.fn.input "Log point message: "
            )
          end,
          "DAP toggle logpoint",
        },

        ["<F3>"] = {
          function()
            require("dap").clear_breakpoints()
          end,
          "DAP clear breakpoints",
        },

        ["<F4>"] = {
          function()
            require("dapui").toggle()
          end,
          "DAP toggle",
        },

        ["<F5>"] = {
          function()
            require("dap").continue()
            require("dapui").open()
            -- require "nvim-dap-virtual-text"
          end,
          "DAP start",
        },

        ["<F6>"] = {
          function()
            require("dap").step_into()
          end,
          "DAP step into",
        },

        ["<F7>"] = {
          function()
            require("dap").step_over()
          end,
          "DAP step over",
        },

        ["<F8>"] = {
          function()
            require("dap").step_out()
          end,
          "DAP step out",
        },

        ["<F9>"] = {
          function()
            require("dap").terminate()
            require("dapui").close()
          end,
          "DAP stop",
        },
      },
    }
  end,
  config = function()
    local dap = require "dap"
    local masonPath = vim.fn.stdpath "data" .. "/mason/packages/"

    -- Change default signs
    local signs = {
      DapBreakpoint = "",
      DapBreakpointCondition = "󰟃",
      DapBreakpointRejected = "",
      DapLogPoint = "",
      DapStopped = "",
    }
    for hl, icon in pairs(signs) do
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- JavaScript
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          masonPath .. "js-debug-adapter/js-debug/src/dapDebugServer.js",
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
  end,
}
