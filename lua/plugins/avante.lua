return {
  "yetone/avante.nvim",
  version = false,
  build = "make",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-tree/nvim-web-devicons",
    "HakonHarnes/img-clip.nvim",
    "MeanderingProgrammer/render-markdown.nvim",
  },
  opts = {
    provider = os.getenv "MAIN_PROVIDER",
    auto_suggestions_provider = os.getenv "AUTO_SUGGESTIONS_PROVIDER",
    file_selector = { provider = "telescope" },
    providers = {
      ollama = {
        endpoint = os.getenv "OLLAMA_ENDPOINT",
        model = os.getenv "OLLAMA_MODEL",
      },
      ["google"] = {
        __inherited_from = "openai",
        endpoint = os.getenv "GEMINI_ENDPOINT",
        model = os.getenv "GEMINI_MODEL_MAIN",
        api_key_name = "GEMINI_API_KEY",
      },
      ["google_lite"] = {
        __inherited_from = "openai",
        endpoint = os.getenv "GEMINI_ENDPOINT",
        model = os.getenv "GEMINI_MODEL_LITE",
        api_key_name = "GEMINI_API_KEY",
      },
    },
    web_search_engine = {
      provider = "google", -- tavily, serpapi, searchapi, google, kagi, brave, or searxng
      proxy = nil, -- proxy support, e.g., http://127.0.0.1:7890
    },
    windows = {
      ---@type "right" | "left" | "top" | "bottom"
      position = "right",
      width = vim.g.is_horizontal and 50 or 100,
      height = 50,
      sidebar_header = { rounded = false },
      input = {
        prefix = "> ",
        height = 6,
      },
    },
    mappings = {
      --- @class AvanteConflictMappings
      suggestion = {
        accept = "<Tab>",
      },
      submit = {
        normal = "<Enter>",
        insert = "<Enter>",
      },
      sidebar = {
        close = { "q", require("core.mappings").QUIT },
        close_from_input = {
          normal = { "q", require("core.mappings").QUIT },
          insert = { require("core.mappings").QUIT },
        },
      },
    },
  },
}
