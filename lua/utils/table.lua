local Table = {}

Table.length = function(tb)
  local length = 0
  for _ in pairs(tb) do
    length = length + 1
  end
  return length
end

Table.unpack = function(tb, i)
  i = i or 1
  if i < #tb then
    return tb[i], Table.unpack(tb, i + 1)
  end
  if i == #tb then
    return tb[i]
  end
end

Table.join = function(tb, str)
  return table.concat(tb, str)
end

Table.contains = function(tb, x)
  local found = false
  for _, v in pairs(tb) do
    if v == x then
      found = true
    end
  end
  return found
end

Table.assign = function(tb1, tb2)
  for key, value in pairs(tb2) do
    tb1[key] = value
  end
  return tb1
end

Table.toString = function(tb)
  local str = "{"
  for key, value in pairs(tb) do
    value = "'" .. tostring(value) .. "'"
    str = str .. key .. "=" .. value .. ";"
  end
  str = str .. "}"
  return str
end

return Table
