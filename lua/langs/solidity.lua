return {
  tree = {
    "solidity",
  },

  lsp = {
    -- { "solc", mason = "solidity" },
    -- { "solidity", mason = "solidity-ls" },
    -- { "solidity_ls", mason = "vscode-solidity-server" },
    {
      "solidity_ls_nomicfoundation",
      mason = "nomicfoundation-solidity-language-server",
    },
  },

  -- null = {
  --   "f.forge_fmt",
  --   -- { "d.solhint", mason = "solhint" },
  -- },
}
