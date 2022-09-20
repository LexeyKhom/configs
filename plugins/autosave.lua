return {
  cmd = { "ASToggle" },
  module = "auto-save",
  config = function()
    require("autosave").setup()
  end,
}
