return {
  "huggingface/hfcc.nvim",
  cmd = {
    "HFccSuggestion",
    "HFccToggleAutoSuggest",
  },
  opts = {
    accept_keymap = "<Tab>",
    dismiss_keymap = "<S-Tab>",

    -- can be a model ID or an http(s) endpoint
    model = "bigcode/starcoder",

    -- parameters that are added to the request body
    query_params = {
      max_new_tokens = 60,
      temperature = 0.2,
      top_p = 0.95,
      stop_token = "<|endoftext|>",
    },
  },
}
