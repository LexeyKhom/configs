return {
  tree = {
    "gdscript",
    "gdshader",
    "godot_resource",
  },

  lsp = {
    {
      "gdscript",
      filter = { "mason" },
      setting = { extra_filetypes = { "gdshader" } },
    },
    { "gdshader_lsp", filter = { "mason" } },
  },

  null = {
    { "d.gdlint",   mason = "gdtoolkit" },
    { "f.gdformat", mason = "gdtoolkit" },
  },
}
