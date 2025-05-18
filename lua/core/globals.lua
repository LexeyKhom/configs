local g = vim.g

g.mapleader = " "
g.is_horizontal = vim.o.columns > 2 * vim.o.lines
g.term = "float" -- Default term
g.vscode_snippets_path = vim.fn.stdpath "config"

-- Disable some default providers
local providers = { "node", "perl", "python3", "ruby" }
for _, provider in ipairs(providers) do
  g["loaded_" .. provider .. "_provider"] = 0
end

-- String Interpolation
-- Input ("${name} is ${value}" % { name = "foo", value = "bar" })
-- Outputs "foo is bar"
getmetatable("").__mod = function(s, tab)
  return (
    s:gsub("($%b{})", function(w)
      return tab[w:sub(3, -2)] or w
    end)
  )
end

vim.filetype.add {
  extension = {
    inc = "asm",
  },
}
