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
