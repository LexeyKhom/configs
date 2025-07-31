local g = vim.g

g.mapleader = " "
g.maplocalleader = "\\"
g.is_horizontal = vim.o.columns > 2 * vim.o.lines

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
