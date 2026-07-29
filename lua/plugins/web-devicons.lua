return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  opts = {
    override_by_filename = {
      [".env.development"] = {
        icon = "",
        color = "#faf743",
        cterm_color = "227",
        name = "Env",
      },
      [".env.production"] = {
        icon = "",
        color = "#faf743",
        cterm_color = "227",
        name = "Env",
      },
      ["webpack.config.js"] = {
        icon = "󰜫",
        color = "#519ABA",
        cterm_color = "74",
        name = "WebpackConfig",
      },
      [".eslintrc.json"] = {
        icon = "",
        color = "#4b32c3",
        cterm_color = "56",
        name = "Eslintrc",
      },
      [".eslintrc.cjs"] = {
        icon = "",
        color = "#4b32c3",
        cterm_color = "56",
        name = "Eslintrc",
      },
      [".stylelintrc"] = {
        icon = "",
        color = "#ffffff",
        cterm_color = "231",
        name = "Stylelintrc",
      },
      [".stylelintignore"] = {
        icon = "",
        color = "#ffffff",
        cterm_color = "231",
        name = "Stylelintrc",
      },
      [".gdformatrc"] = {
        icon = "",
        color = "#B83A1D",
        cterm_color = "160",
        name = "GDformat",
      },
      [".gdlintrc"] = {
        icon = "",
        color = "#B83A1D",
        cterm_color = "160",
        name = "GDlint",
      },
      [".gdignore"] = {
        icon = "",
        color = "#B83A1D",
        cterm_color = "160",
        name = "GDlint",
      },
    },

    override_by_extension = {
      ["asm"] = {
        icon = "",
        color = "#4242c7",
        cterm_color = "56",
        name = "ASM",
      },
      ["pas"] = {
        icon = "󰬗",
        color = "#4273ca",
        cterm_color = "68",
        name = "ASM",
      },
      ["gd"] = {
        icon = "",
        color = "#519aba",
        cterm_color = "74",
        name = "GDScript",
      },
      ["gdshader"] = {
        icon = "",
        color = "#6b4d83",
        cterm_color = "96",
        name = "GodotShader",
      },
    },
  },
}
