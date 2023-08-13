-- #Modes:
--
-- n - Normal
--
-- i - Insert
-- c - Command-line
-- ! - Insert and Command-line
--
-- x - Visual
-- s - Select
-- v - Visual and Select
--
-- t - Terminal
-- o - Operator-pending
-- l - ":lmap" mappings for Insert, Command-line and Lang-Arg

local M = {}

M.disabled = {
  n = {
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["<leader>b"] = "",
    ["<leader>th"] = "",
    ["<leader>pt"] = "",
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
    ["]c"] = "",
    ["[c"] = "",
    ["<leader>rh"] = "",
    ["<leader>ph"] = "",
    ["<leader>td"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    ["<leader>D"] = "",
    ["<leader>ra"] = "",
    ["<leader>ca"] = "",
    ["<leader>f"] = "",
    ["<leader>q"] = "",
    ["<leader>fm"] = "",
    ["<leader>wa"] = "",
    ["<leader>wr"] = "",
    ["<leader>wl"] = "",
    ["<A-h>"] = "",
  },

  t = {
    ["<A-h>"] = "",
  },
}

M.general = {
  -- Normal
  n = {
    ["<A-h>"] = { "<BS>", "Backspace" },
    ["<A-l>"] = { "<Enter>", "Enter" },

    ["<A-u>"] = { "<C-u>", "Scroll up" },
    ["<A-d>"] = { "<C-d>", "Scroll down" },
    ["<A-a>"] = { "<C-a>", "Increment" },
    ["<A-x>"] = { "<C-x>", "Decrement" },
    ["<A-r>"] = { "<C-r>", "Redo" },

    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    ["<A-q>"] = { "<cmd> q <CR>", "Quit", opts = { nowait = true } },
    ["<C-q>"] = { "<cmd> q <CR>", "Quit", opts = { nowait = true } },
    ["<A-s>"] = { "<cmd> w <CR><cmd> e <CR>", "Save and Redraw" },
    ["<C-s>"] = { "<cmd> w <CR><cmd> e <CR>", "Save and Redraw" },
    ["<leader>tn"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>tr"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },

    -- Upgrade default keys
    ["<Esc>"] = { "<cmd> noh <CR>", "Clear highlights" },
    ["<C-u>"] = { "<C-u>zz", "Screen up" },
    ["<C-d>"] = { "<C-d>zz", "Screen down" },
    ["n"] = { "nzzzv", "Next search" },
    ["N"] = { "Nzzzv", "Previous search" },

    -- Sed
    ["<leader>sw"] = {
      [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
      "Sed word in file",
    },
  },

  -- Insert
  i = {
    ["kj"] = { "<Esc>", "Go to Normal mode" },

    ["<A-h>"] = { "<BS>", "Backspace" },
    ["<C-h>"] = { "<Left>", "Move Left" },
    ["<A-l>"] = { "<Enter>", "Enter" },
    ["<C-l>"] = { "<Right>", "Move Right" },
    ["<A-j>"] = { "<Down>", "Move Down" },
    ["<C-j>"] = { "<Down>", "Move Down" },
    ["<A-k>"] = { "<Up>", "Move Up" },
    ["<C-k>"] = { "<Up>", "Move Up" },
  },

  -- Command-line
  c = {
    ["kj"] = { "<C-c>", "Exit from Command mode" },

    -- Navigate within command mode
    ["<A-h>"] = { "<BS>", "Backspace" },
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<A-l>"] = { "<Enter>", "Enter" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["<A-j>"] = { "<Down>", "Move down in history" },
    ["<C-j>"] = { "<Down>", "Move down in history" },
    ["<A-k>"] = { "<Up>", "Move up in history" },
    ["<C-k>"] = { "<Up>", "Move up in history" },

    ["<A-b>"] = { "<Home>", "Beginning of line" },
    ["<C-b>"] = { "<Home>", "Beginning of line" },
    ["<A-e>"] = { "<End>", "End of line" },
    ["<C-e>"] = { "<End>", "End of line" },
  },

  -- Visual and Select
  v = {
    ["J"] = { ":m '>+1 <CR> gv=gv", "Move down", { silent = true } },
    ["K"] = { ":m '<-2 <CR> gv=gv", "Move up", { silent = true } },

    -- Wrap in
    ["'"] = { "c''<Esc>P<Right>", "Wrap in ''" },
    ['"'] = { 'c""<Esc>P<Right>', 'Wrap in ""' },
    ["`"] = { "c``<Esc>P<Right>", "Wrap in ``" },
    ["("] = { "c()<Esc>P<Right>", "Wrap in ()" },
    [")"] = { "c()<Esc>P<Right>", "Wrap in ()" },
    ["{"] = { "c{}<Esc>P<Right>", "Wrap in {}" },
    ["}"] = { "c{}<Esc>P<Right>", "Wrap in {}" },
    ["["] = { "c[]<Esc>P<Right>", "Wrap in []" },
    ["]"] = { "c[]<Esc>P<Right>", "Wrap in []" },
    ["_"] = { "c__<Esc>P<Right>", "Wrap in __" },
    ["*"] = { "c****<Esc><Left>P<Right><Right>", "Wrap in ****" },

    -- Sed
    ["<leader>sw"] = {
      -- [[:s///gI<Left><Left><Left><Left>]],
      [[y:%s/\<<C-r>+\>/<C-r>+/gI<Left><Left><Left>]],
      "Sed word in file",
    },

    ["<leader>sc"] = {
      [[:s///gI<Left><Left><Left><Left>]],
      "Sed in context",
    },
  },
}

M.lspconfig = {
  plugin = true,

  n = {
    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "single" } }
      end,
      "Previous diagnostic",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "single" } }
      end,
      "Next diagnostic",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>ld"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<leader>lr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>lc"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = "single" }
      end,
      "LSP Floating diagnostic",
    },

    ["<leader>ll"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "LSP Diagnostic setloclist",
    },

    ["<leader>lwa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>lwr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>lwl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },
}

M.null = {
  plugin = true,

  n = {
    -- For format all files use:
    -- args ./**/*.json | argdo "lua vim.lsp.buf.format()" | w
    ["<A-f>"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "Formatting",
    },
    ["<C-f>"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "Formatting",
    },
  },
}

M.dap = {
  plugin = true,

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
        require "nvim-dap-virtual-text"
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

M.telescope = {
  plugin = true,

  n = {
    -- Find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Find word" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Find help" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>ft"] = { "<cmd> Telescope terms <CR>", "Find term" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<leader>fl"] = { "<cmd> Telescope resume <CR>", "Find last" },

    -- Git
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- Theme switcher
    ["<leader>st"] = { "<cmd> Telescope themes <CR>", "Switch theme" },
  },
}

M.spectre = {
  plugin = true,

  n = {
    ["<leader>so"] = { '<cmd>lua require("spectre").open()<CR>', "Open Spectre" },
    ["<leader>sx"] = { '<cmd>lua require("spectre").close()<CR>', "Close Spectre" },

    ["<leader>sa"] = {
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      "Search all",
    },

    ["<leader>sf"] = {
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      "Search in file",
    },
  },

  v = {
    ["<leader>sa"] = {
      '<esc><cmd>lua require("spectre").open_visual()<CR>',
      "Search all",
    },
  },
}

M.nvterm = {
  plugin = true,

  n = {
    ["<A-e>"] = {
      require("custom.utils").execute,
      "Execute this",
    },

    ["<leader>gc"] = {
      function()
        vim.cmd "DiffviewClose"
        local nvterm = require "nvterm.terminal"
        local term = vim.g.term
        nvterm.toggle(term)
        nvterm.send("git commit ", term)
        vim.cmd "startinsert"
      end,
      "Git commit",
    },
  },

  t = {
    ["<A-c>"] = { "<C-c>", "Cancel" },
    ["<A-d>"] = { "<C-d>", "Close term" },

    ["<A-e>"] = { "<C-d>", "Close term" },
    ["<C-e>"] = { "<C-d>", "Close term" },
    ["<A-q>"] = { "<C-d>", "Close term" },
    ["<C-q>"] = { "<C-d>", "Close term" },

    ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
    ["<A-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  },
}

M.gitsigns = {
  plugin = true,

  n = {
    -- Navigation through hunks
    ["]g"] = {
      function()
        if vim.wo.diff then
          return "]g"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Next git hunk",
      opts = { expr = true },
    },

    ["[g"] = {
      function()
        if vim.wo.diff then
          return "[g"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Previous git hunk",
      opts = { expr = true },
    },

    -- Actions
    ["<leader>ga"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Git add hunk",
    },

    ["<leader>gA"] = {
      function()
        require("gitsigns").stage_buffer()
      end,
      "Git add buffer",
    },

    ["<leader>gu"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "Git undo add hunk",
    },

    ["<leader>gr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Git reset hunk",
    },

    ["<leader>gR"] = {
      function()
        require("gitsigns").reset_buffer()
      end,
      "Git reset buffer",
    },

    ["<leader>gb"] = {
      function()
        require("gitsigns").blame_line()
      end,
      "Git blame line",
    },

    ["<leader>gp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Git preview hunk",
    },

    ["<leader>gt"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Git toggle deleted",
    },
  },

  v = {
    ["<leader>gs"] = {
      function()
        require("gitsigns").select_hunk()
      end,
      "Git select hunk",
    },

    ["<leader>ga"] = {
      function()
        require("gitsigns").stage_hunk { vim.fn.line ".", vim.fn.line "v" }
      end,
      "Git add select",
    },

    ["<leader>gr"] = {
      function()
        require("gitsigns").reset_hunk { vim.fn.line ".", vim.fn.line "v" }
      end,
      "Git reset select",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    ["<A-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<A-k>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<A-j>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<A-x>"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.diffview = {
  plugin = true,

  n = {
    ["<leader>gd"] = { "<cmd> DiffviewOpen <CR>", "Git diff" },
    ["<leader>gl"] = { "<cmd> DiffviewFileHistory <CR>", "Git log" },
    ["<leader>gx"] = { "<cmd> DiffviewClose <CR>", "Git close" },
  },
}

M.huggingface = {
  plugin = true,

  n = {
    ["<A-w>"] = { "<cmd> HFccSuggestion <CR>", "Huggingface Suggestion" },
    ["<C-w>"] = { "<cmd> HFccSuggestion <CR>", "Huggingface Suggestion" },
  },
}

M.undotree = {
  plugin = true,

  n = {
    ["<leader>tu"] = { "<cmd> UndotreeToggle <CR> <cmd> UndotreeFocus <CR>", "Toggle UndoTree" },
  },
}

return M
