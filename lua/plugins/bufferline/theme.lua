local c = require("base46").get_theme_tb "base_30"
local fg = {
  default = c.light_grey,
  selected = c.white,
  accent = c.red,
  accent2 = c.green,
}
local bg = {
  default = c.black,
  selected = c.black2,
  dark = c.darker_black,
}

return {
  fill = {
    fg = fg.selected,
    bg = bg.dark,
  },
  background = {
    fg = fg.default,
    bg = bg.default,
  },
  tab = {
    fg = fg.default,
    bg = bg.default,
  },
  tab_selected = {
    fg = fg.selected,
    bg = bg.selected,
  },
  tab_separator = {
    fg = bg.dark,
    bg = bg.default,
  },
  tab_separator_selected = {
    fg = fg.accent,
    bg = bg.selected,
  },
  tab_close = {
    fg = fg.accent,
    bg = bg.default,
  },
  close_button = {
    fg = fg.default,
    bg = bg.default,
  },
  close_button_visible = {
    fg = fg.default,
    bg = bg.default,
  },
  close_button_selected = {
    fg = fg.accent,
    bg = bg.selected,
  },
  buffer_visible = {
    fg = fg.default,
    bg = bg.default,
  },
  buffer_selected = {
    fg = fg.selected,
    bg = bg.selected,
    bold = false,
    italic = false,
  },
  -- numbers = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- numbers_visible = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- numbers_selected = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  --   bold = true,
  --   italic = true,
  -- },
  -- diagnostic = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- diagnostic_visible = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- diagnostic_selected = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  --   bold = true,
  --   italic = true,
  -- },
  -- hint = {
  --   fg = "<colour-value-here>",
  --   sp = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- hint_visible = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- hint_selected = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  --   sp = "<colour-value-here>",
  --   bold = true,
  --   italic = true,
  -- },
  -- hint_diagnostic = {
  --   fg = "<colour-value-here>",
  --   sp = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- hint_diagnostic_visible = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- hint_diagnostic_selected = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  --   sp = "<colour-value-here>",
  --   bold = true,
  --   italic = true,
  -- },
  -- info = {
  --   fg = "<colour-value-here>",
  --   sp = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- info_visible = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- info_selected = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  --   sp = "<colour-value-here>",
  --   bold = true,
  --   italic = true,
  -- },
  -- info_diagnostic = {
  --   fg = "<colour-value-here>",
  --   sp = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- info_diagnostic_visible = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- info_diagnostic_selected = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  --   sp = "<colour-value-here>",
  --   bold = true,
  --   italic = true,
  -- },
  -- warning = {
  --   fg = "<colour-value-here>",
  --   sp = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- warning_visible = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- warning_selected = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  --   sp = "<colour-value-here>",
  --   bold = true,
  --   italic = true,
  -- },
  -- warning_diagnostic = {
  --   fg = "<colour-value-here>",
  --   sp = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- warning_diagnostic_visible = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- warning_diagnostic_selected = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  --   sp = "<colour-value-here>",
  --   bold = true,
  --   italic = true,
  -- },
  -- error = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  --   sp = "<colour-value-here>",
  -- },
  -- error_visible = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- error_selected = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  --   sp = "<colour-value-here>",
  --   bold = true,
  --   italic = true,
  -- },
  -- error_diagnostic = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  --   sp = "<colour-value-here>",
  -- },
  -- error_diagnostic_visible = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  -- },
  -- error_diagnostic_selected = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  --   sp = "<colour-value-here>",
  --   bold = true,
  --   italic = true,
  -- },
  modified = {
    fg = fg.accent,
    bg = bg.default,
  },
  modified_visible = {
    fg = fg.accent,
    bg = bg.default,
  },
  modified_selected = {
    fg = fg.accent2,
    bg = bg.selected,
  },
  duplicate_selected = {
    fg = fg.accent,
    bg = bg.selected,
    italic = false,
  },
  duplicate_visible = {
    fg = fg.default,
    bg = bg.default,
    italic = false,
  },
  duplicate = {
    fg = fg.default,
    bg = bg.default,
    italic = false,
  },
  separator_selected = {
    fg = fg.accent,
    bg = bg.selected,
  },
  separator_visible = {
    fg = bg.dark,
    bg = bg.default,
  },
  separator = {
    fg = bg.dark,
    bg = bg.default,
  },
  indicator_visible = {
    fg = fg.accent,
    bg = bg.default,
  },
  indicator_selected = {
    fg = fg.accent,
    bg = bg.selected,
  },
  -- pick_selected = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  --   bold = true,
  --   italic = true,
  -- },
  -- pick_visible = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  --   bold = true,
  --   italic = true,
  -- },
  -- pick = {
  --   fg = "<colour-value-here>",
  --   bg = "<colour-value-here>",
  --   bold = true,
  --   italic = true,
  -- },
  offset_separator = {
    fg = bg.dark,
    bg = bg.dark,
  },
  trunc_marker = {
    fg = fg.default,
    bg = bg.dark,
  },
}
