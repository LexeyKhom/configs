return {
  cmd = { "ASToggle" },
  module = "auto-save",
  config = function()
    require("auto-save").setup {
      enabled = false,
    }
  end,
}
