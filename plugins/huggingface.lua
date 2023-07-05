return {
  "huggingface/hfcc.nvim",
  cmd = {
    "HFccSuggestion",
    "HFccToggleAutoSuggest",
  },
  keys = function()
    require("core.utils").load_mappings "huggingface"
  end,
  opts = {
    -- can be a model ID or an http(s) endpoint
    model = "bigcode/starcoder",

    -- parameters that are added to the request body
    query_params = {
      max_new_tokens = 60,
      temperature = 0.2,
      top_p = 0.95,
      stop_token = "<|endoftext|>",
    },

    -- set this if the model supports fill in the middle
    fim = {
      enabled = true,
      prefix = "<fim_prefix>",
      middle = "<fim_middle>",
      suffix = "<fim_suffix>",
    },

    accept_keymap = "<C-w>",
    dismiss_keymap = "<C-x>",
  },
}
