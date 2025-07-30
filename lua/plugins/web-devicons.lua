return {
  "nvim-tree/nvim-web-devicons",
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
        color = "#5d87bf",
        cterm_color = "67",
        name = "WebpackConfig",
      },
      ["vite.config.js"] = {
        icon = "󰹭",
        color = "#7239b3",
        cterm_color = "91",
        name = "ViteConfig",
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
        color = "#ffffff", -- color = "#333333",
        cterm_color = "231", -- cterm_color = "236",
        name = "Stylelintrc",
      },
      [".stylelintignore"] = {
        icon = "",
        color = "#ffffff", -- color = "#333333",
        cterm_color = "231", -- cterm_color = "236",
        name = "Stylelintrc",
      },
      ["gd"] = {
        icon = "",
        color = "#519aba",
        cterm_color = "74",
        name = "GDScript",
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
      ["deb"] = {
        icon = "",
        color = "#e535ab",
        cterm_color = "199",
        name = "deb",
      },
      ["rpm"] = {
        icon = "",
        color = "#b30b00",
        cterm_color = "124",
        name = "rpm",
      },
      ["gdshader"] = {
        icon = "",
        color = "#e535ab",
        cterm_color = "199",
        name = "GodotShader",
      },
    },
  },
}
