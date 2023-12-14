return {
  "nvim-tree/nvim-web-devicons",
  opts = {
    override_by_filename = {
      [".babelrc"] = {
        icon = "󰨥",
        color = "#cbcb41",
        cterm_color = "185",
        name = "Babelrc",
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
      [".eslintignore"] = {
        icon = "",
        color = "#4b32c3",
        cterm_color = "56",
        name = "Eslintignore",
      },
      ["tsconfig.json"] = {
        icon = "",
        color = "#519aba",
        cterm_color = "74",
        name = "TsConfig",
      },
      [".stylelintrc"] = {
        icon = "",
        color = "#ffffff", -- color = "#333333",
        cterm_color = "231", -- cterm_color = "236",
        name = "Stylelintrc",
      },
      [".prettierrc.json"] = {
        icon = "󰏣",
        color = "#E8274B",
        cterm_color = "197",
        name = "Prettierrc",
      },
      [".prettierrc"] = {
        icon = "󰏣",
        color = "#E8274B",
        cterm_color = "197",
        name = "Prettierrc",
      },
      [".prettierignore"] = {
        icon = "󰏣",
        color = "#E8274B",
        cterm_color = "197",
        name = "Prettierignore",
      },
      ["tailwind.config.js"] = {
        icon = "󱏿",
        color = "#519aba",
        cterm_color = "74",
        name = "TailwindConfig",
      },
      ["robots.txt"] = {
        icon = "󰚩",
        color = "#bbbbbb",
        cterm_color = "250",
        name = "robots",
      },
      ["gd"] = {
        icon = "",
        color = "#519aba",
        cterm_color = "74",
        name = "GDScript",
      },
      ["godot"] = {
        icon = "",
        color = "#6d8086",
        cterm_color = "66",
        name = "GodotProject",
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
      ["xz"] = {
        icon = "",
        color = "#e4b854",
        cterm_color = "179",
        name = "xz",
      },
      ["zip"] = {
        icon = "",
        color = "#e4b854",
        cterm_color = "179",
        name = "zip",
      },
    },
  },
  config = function(_, opts)
    require("nvim-web-devicons").setup(opts)
  end,
}
