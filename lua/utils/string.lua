local String = {}

String.split = function(str, split_str)
  local res = {}
  for s in string.gmatch(str, "[^%" .. split_str .. "]+") do
    table.insert(res, s)
  end
  return res
end

return String
