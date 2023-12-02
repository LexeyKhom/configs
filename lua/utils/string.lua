local String = {}

String.split = function(str, splitStr)
  local res = {}
  for s in string.gmatch(str, "[^%" .. splitStr .. "]+") do
    table.insert(res, s)
  end
  return res
end

return String
