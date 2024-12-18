local KEYS = require "core.mappings"
return {
  n = {
    -- Close
    ["<Esc>"] = "Close",
    ["q"] = "Close",
    [KEYS.QUIT] = "Close",
    [KEYS.CLOSE] = "Close",
    [KEYS.CANCEL] = "Close",
    -- Confirm
    ["<CR>"] = "Confirm",
    ["o"] = "Confirm",
    [KEYS.ENTER] = "Confirm",
  },
  i = {
    -- Close
    ["<Esc>"] = "Close",
    [KEYS.QUIT] = "Close",
    [KEYS.CLOSE] = "Close",
    [KEYS.CANCEL] = "Close",
    -- Confirm
    ["<CR>"] = "Confirm",
    [KEYS.ENTER] = "Confirm",
    -- Navigation
    [KEYS.LEFT] = "<Left>",
    [KEYS.RIGHT] = "<Right>",
    -- History
    [KEYS.UP] = "HistoryPrev",
    ["<Up>"] = "HistoryPrev",
    [KEYS.DOWN] = "HistoryNext",
    ["<Down>"] = "HistoryNext",
  },
}
