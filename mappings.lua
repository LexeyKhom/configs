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
  },
}

M.general = {
  -- Normal
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },
    ["<C-q>"] = { "<cmd> q <CR>", "Quit", opts = { nowait = true } },
    ["<leader>tn"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>tr"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },

    -- Upgrade default keys
    ["<Esc>"] = { "<cmd> noh <CR>", "Clear highlights" },
    ["<C-u>"] = { "<C-u>zz", "Screen up" },
    ["<C-d>"] = { "<C-d>zz", "Screen down" },
    ["n"] = { "nzzzv", "Next search" },
    ["N"] = { "Nzzzv", "Previous search" },
    ["J"] = { "mzJ`z", "Join" },

    -- Sed
    ["<leader>sw"] = {
      [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
      "Sed word in file",
    },

    -- !TODO: For all langs
    -- ["<leader>nd"] = { "<cmd>!node %<CR>", "NodeJS" },
  },

  -- Insert
  i = {
    ["kj"] = { "<Esc>", "Go to Normal mode" },
    ["jk"] = { "<Esc>", "Go to Normal mode" },
  },

  -- Command-line
  c = {
    -- Navigate within command mode
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["<C-j>"] = { "<Down>", "Move down in history" },
    ["<C-k>"] = { "<Up>", "Move up in history" },

    ["<C-b>"] = { "<Home>", "Beginning of line" },
    ["<C-e>"] = { "<End>", "End of line" },
  },

  -- Visual and Select
  v = {
    ["J"] = { ":m '>+1 <CR> gv=gv", "Mode down", { silent = true } },
    ["K"] = { ":m '<-2 <CR> gv=gv", "Mode up", { silent = true } },
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

    -- Theme switcher
    ["<leader>st"] = { "<cmd> Telescope themes <CR>", "Switch theme" },

    -- Git
    ["<leader>gl"] = { "<cmd> Telescope git_commits <CR>", "Git log" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },
  },
}

M.nvterm = {
  plugin = true,

  n = {
    ["<leader>gc"] = {
      function()
        local nvterm = require "nvterm.terminal"
        nvterm.send(" git commit ", "float")
        nvterm.toggle "float"
      end,
      "Git commit",
    },
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
return M
