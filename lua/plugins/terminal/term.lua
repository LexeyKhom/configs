local Term = {}

Term.cmd = { "ToggleTerm", "TermExec" }

local count = {}
Term.get = function(direction)
  local length = require("utils.table").length
  local n = count[direction]
  if not n then
    n = length(count) + 1
    count[direction] = n
  end
  return n
end

Term.toggle = function(direction)
  local n = Term.get(direction)
  vim.cmd(n .. "ToggleTerm direction=" .. direction)
end

Term.exec = function(cmd, direction)
  direction = direction or vim.g.term
  local n = Term.get(direction)
  vim.cmd(n .. "TermExec direction=" .. direction .. ' cmd="' .. cmd .. '"')
end

return Term
