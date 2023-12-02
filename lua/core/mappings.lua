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

local KEYS = {
  ENTER = "<A-f>",
  BACKSPACE = "<A-a>",
  DELETE = "<A-s>",

  UP = "<A-k>",
  DOWN = "<A-j>",
  LEFT = "<A-h>",
  RIGHT = "<A-l>",
  SCROLL_DOWN = "<A-d>",
  SCROLL_UP = "<A-u>",

  QUIT = "<A-q>",

  NAV_FILES = "<A-n>",
  TERMINAL = "<A-i>",
  TERMINAL_ALT = "<A-v>",
  EXECUTE = "<A-e>",
}

if vim.g.isTermux then
  local assign = require("utils.table").assign
  local TERMUX_KEYS = {
    ENTER = "<Enter>",
    BACKSPACE = "<BS>",
    DELETE = "<Delete>",
  }
  assign(KEYS, TERMUX_KEYS)
end

require("utils.load").mappings {
  -- Normal
  n = {
    [";"] = { ":", "Enter command mode", { nowait = true } },
    [KEYS.QUIT] = { "<cmd> q <CR>", "Quit", { nowait = true } },
    ["<A-s>"] = { "<cmd> w <CR>", "Save and Redraw" },
    ["vaf,vif"] = { "gg0VG$", "Select whole file" },
    ["<C-c>"] = { "<cmd> %y+ <CR><Esc>", "Copy whole file" },
    ["<leader>tn"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>tr"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },

    -- Upgrade default keys
    ["<Esc>"] = { "<cmd> noh <CR>", "Clear highlights" },
    [KEYS.SCROLL_UP .. ",<C-u>"] = { "<C-u>zz", "Screen up" },
    [KEYS.SCROLL_DOWN .. ",<C-d>"] = { "<C-d>zz", "Screen down" },
    ["n"] = { "nzzzv", "Next search" },
    ["N"] = { "Nzzzv", "Previous search" },

    -- Polifils with Alt
    [KEYS.ENTER] = { "<Enter>", "Enter" },
    [KEYS.BACKSPACE] = { "<BS>", "Backspace" },

    ["<A-a>"] = { "<C-a>", "Increment" },
    ["<A-x>"] = { "<C-x>", "Decrement" },
    ["<A-r>"] = { "<C-r>", "Redo" },
    ["<A-o>"] = { "<C-o>", "New empty line up" },

    -- Navigate
    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    ["j,<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", { expr = true } },
    ["k,<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", { expr = true } },
    -- Switch between windows
    ["<C-h>"] = { "<C-w>h", "Window left" },
    ["<C-l>"] = { "<C-w>l", "Window right" },
    ["<C-j>"] = { "<C-w>j", "Window down" },
    ["<C-k>"] = { "<C-w>k", "Window up" },

    -- Sed
    ["<leader>sw"] = {
      [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
      "Sed word in file",
    },
  },

  -- Insert
  i = {
    ["kj"] = { "<Esc>", "Go to Normal mode" },

    -- Navigate
    [KEYS.ENTER] = { "<Enter>", "Enter" },
    [KEYS.BACKSPACE] = { "<BS>", "Backspace" },
    [KEYS.DELETE] = { "<Delete>", "Delete" },

    [KEYS.UP] = { "<Up>", "Move Up" },
    [KEYS.DOWN] = { "<Down>", "Move Down" },
    [KEYS.LEFT] = { "<Left>", "Move Left" },
    [KEYS.RIGHT] = { "<Right>", "Move Right" },

    ["<A-0>"] = { "<Esc>^i", "Beginning of line" },
    ["<A-4>"] = { "<Esc>$a", "End of line" },
  },

  -- Terminal
  t = {
    ["<A-c>"] = { "<C-c>", "Cancel" },
    [KEYS.QUIT .. ",<A-d>," .. KEYS.EXECUTE] = { "<C-d>", "Close term" },

    ["<A-x>,<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  },

  -- Command-line
  c = {
    [KEYS.QUIT] = { "<C-c>", "Exit from Command mode" },

    -- Navigate within command mode
    [KEYS.ENTER] = { "<Enter>", "Enter" },
    [KEYS.BACKSPACE] = { "<BS>", "Backspace" },
    [KEYS.UP] = { "<Up>", "Move up in history" },
    [KEYS.DOWN] = { "<Down>", "Move down in history" },
    [KEYS.LEFT] = { "<Left>", "Move left" },
    [KEYS.RIGHT] = { "<Right>", "Move right" },

    ["<A-0>"] = { "<Home>", "Beginning of line" },
    ["<A-4>"] = { "<End>", "End of line" },
  },

  -- Visual and Select
  v = {
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", { silent = true } },

    -- Navigation
    ["J"] = { ":m '>+1 <CR> gv=gv", "Move selection down", { silent = true } },
    ["K"] = { ":m '<-2 <CR> gv=gv", "Move selection up", { silent = true } },
    ["<"] = { "<gv", "Indent line" },
    [">"] = { ">gv", "Indent line" },
    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    ["j,<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", { expr = true } },
    ["k,<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", { expr = true } },

    -- Sed
    ["<leader>sw"] = {
      [[y:%s/\<<C-r>+\>/<C-r>+/gI<Left><Left><Left>]],
      "Sed",
    },

    ["<leader>sc"] = {
      [[:s///gI<Left><Left><Left><Left>]],
      "Sed in context",
    },
  },
}

return KEYS
