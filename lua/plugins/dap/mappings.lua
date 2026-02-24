return function()
  require("utils.loader").mappings {
    n = {
      ["<F1>"] = {
        "<cmd> DapToggleBreakpoint <CR>",
        "DAP toggle breakpoint",
      },

      ["<F2>"] = {
        function()
          require("dap").toggle_breakpoint(nil, nil, vim.fn.input "Log: ")
        end,
        "DAP toggle logpoint",
      },

      ["<F3>"] = {
        function()
          require("dap").toggle_breakpoint(vim.fn.input "Condition: ")
        end,
        "DAP toggle breakpoint with condition",
      },

      ["<F4>"] = {
        "<cmd> DapClearBreakpoints <CR>",
        "DAP clear breakpoints",
      },

      ["<F5>"] = {
        "<cmd> DapContinue <CR>",
        "DAP start",
      },

      ["<F6>"] = {
        "<cmd> DapStepInto <CR>",
        "DAP step into",
      },

      ["<F7>"] = {
        "<cmd> DapStepOver <CR>",
        "DAP step over",
      },

      ["<F8>"] = {
        "<cmd> DapStepOut <CR>",
        "DAP step out",
      },

      ["<F9>"] = {
        "<cmd> DapTerminate <CR>",
        "DAP stop",
      },
    },
  }
end
