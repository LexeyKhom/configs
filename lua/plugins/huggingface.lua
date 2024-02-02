return {
  "huggingface/llm.nvim",
  cmd = { "LLMSuggestion" },
  keys = function()
    require("utils.load").mappings {
      n = {
        ["<A-g>"] = { "<cmd> LLMSuggestion <CR>", "LLM Suggestion" },
      },
    }
  end,
  opts = {
    accept_keymap = "<A-y>",
    dismiss_keymap = "<A-Y>",

    -- can be a model ID or an http(s) endpoint
    model = "bigcode/starcoder",
    tokens_to_clear = { "<|endoftext|>" },
    fim = {
      enabled = true,
      prefix = "<fim_prefix>",
      middle = "<fim_middle>",
      suffix = "<fim_suffix>",
    },
    context_window = 8192,
    tokenizer = {
      repository = "bigcode/starcoder",
    },

    lsp = {
      bin_path = vim.api.nvim_call_function("stdpath", { "data" })
          .. "/mason/bin/llm-ls",
    },
  },
}
