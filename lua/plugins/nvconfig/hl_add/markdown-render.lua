local c = {
  darkred = "#371D1F",
  darkorange = "#382A26",
  darkyellow = "#393528",
  darkgreen = "#223029",
  darkcyan = "#1F2E33",
  darkpurple = "#31273B",
}
return {
  RenderMarkdownH1Bg = { bg = c.darkred, fg = "red", bold = true },
  RenderMarkdownH2Bg = { bg = c.darkyellow, fg = "yellow", bold = true },
  RenderMarkdownH3Bg = { bg = c.darkcyan, fg = "cyan", bold = true },
  RenderMarkdownH4Bg = { bg = c.darkorange, fg = "orange", bold = true },
  RenderMarkdownH5Bg = { bg = c.darkgreen, fg = "green", bold = true },
  RenderMarkdownH6Bg = { bg = c.darkpurple, fg = "purple", bold = true },

  RenderMarkdownWarn = { fg = "red" },
  RenderMarkdownQuestion = { fg = "orange" },
  RenderMarkdownProgress = { fg = "green" },
  RenderMarkdownTodo = { fg = "green" },
  RenderMarkdownUnchecked = { fg = "blue" },
  RenderMarkdownChecked = { fg = "blue" },
}
