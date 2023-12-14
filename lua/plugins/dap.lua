return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
  keys = function()
    require("utils.load").mappings {
      n = {
        ["<F1>"] = {
          function()
            require("dap").toggle_breakpoint()
          end,
          "DAP toggle breakpoint",
        },

        ["<F2>"] = {
          function()
            require("dap").toggle_breakpoint(nil, nil, vim.fn.input "Log point message: ")
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
  end,
}
