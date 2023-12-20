local b = require("base46").get_theme_tb "base_30"
local c = {
  black = b.darker_black,
  fg = b.white,
  bg = b.black2,
  fg2 = b.light_grey,
  bg2 = b.black,
  red = b.red,
  orange = b.orange,
  yellow = b.yellow,
  green = b.green,
  cyan = b.cyan,
  blue = b.blue,
  purple = b.purple,
}

return {
  normal = {
    a = { bg = c.red, fg = c.black, gui = "bold" },
    b = { bg = c.bg, fg = c.fg },
    c = { bg = c.bg2, fg = c.fg2 },
  },
  visual = {
    a = { bg = c.orange, fg = c.black, gui = "bold" },
    b = { bg = c.bg, fg = c.fg },
    c = { bg = c.bg2, fg = c.fg2 },
  },
  command = {
    a = { bg = c.yellow, fg = c.black, gui = "bold" },
    b = { bg = c.bg, fg = c.fg },
    c = { bg = c.bg2, fg = c.fg2 },
  },
  terminal = {
    a = { bg = c.green, fg = c.black, gui = "bold" },
    b = { bg = c.bg, fg = c.fg },
    c = { bg = c.bg2, fg = c.fg2 },
  },
  insert = {
    a = { bg = c.cyan, fg = c.black, gui = "bold" },
    b = { bg = c.bg, fg = c.fg },
    c = { bg = c.bg2, fg = c.fg2 },
  },
  replace = {
    a = { bg = c.blue, fg = c.black, gui = "bold" },
    b = { bg = c.bg, fg = c.fg },
    c = { bg = c.bg2, fg = c.fg2 },
  },
  inactive = {
    a = { bg = c.purple, fg = c.black, gui = "bold" },
    b = { bg = c.bg, fg = c.fg },
    c = { bg = c.bg2, fg = c.fg2 },
  },
}
