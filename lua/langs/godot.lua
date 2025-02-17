return {
  tree = {
    "gdscript",
    "godot_resource",
  },

  lsp = {
    { "gdscript", filter = { "mason" } },
  },

  null = {
    { "d.gdlint", mason = "gdtoolkit" },
    { "f.gdformat", mason = "gdtoolkit" },
  },
}
