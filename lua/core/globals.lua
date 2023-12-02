local g = vim.g

g.mapleader = " "
g.isTermux = os.getenv "isTermux"
g.term = "float" -- Default term
g.vscode_snippets_path = vim.fn.stdpath "config"

-- Disable some default providers
local providers = { "node", "perl", "python3", "ruby" }
for _, provider in ipairs(providers) do
  g["loaded_" .. provider .. "_provider"] = 0
end
