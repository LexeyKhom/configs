local CONFIG = {
  color_square_width = 1,
}

local SQUARE = " 󰝤 " -- █

local DUPLICATES_DEFAULT = 0
local DUPLICATES = {
  buffer = 1,
  path = 1,
  nvim_lsp = 0,
  luasnip = 1,
}

local setColor = function(item, color)
  local hl_group = "lsp_documentColor_mf_" .. color
  vim.api.nvim_set_hl(0, hl_group, { fg = "#" .. color })
  item.kind_hl_group = hl_group
  -- make the color square 2 chars wide
  local box = string.rep(SQUARE, CONFIG.color_square_width)
  item.kind = string.format("%s %s", box, "Color")
  return item
end

local formatter = function(entry, item)
  item.dup = DUPLICATES[entry.source.name] or DUPLICATES_DEFAULT

  local ICONS = require "plugins.cmp.icons"
  local icon = ICONS[item.kind] or " "
  icon = " " .. icon .. " "
  item.kind = string.format("%s %s", icon, item.kind or "")

  if vim.tbl_contains({ "nvim_lsp" }, entry.source.name) then
    local words = {}
    for word in string.gmatch(item.word, "[^-]+") do
      table.insert(words, word)
    end

    local color_name, color_number
    if
        words[2] == "x"
        or words[2] == "y"
        or words[2] == "t"
        or words[2] == "b"
        or words[2] == "l"
        or words[2] == "r"
    then
      color_name = words[3]
      color_number = words[4]
    else
      color_name = words[2]
      color_number = words[3]
    end

    if color_name == "white" or color_name == "black" then
      local color
      if color_name == "white" then
        color = "ffffff"
      else
        color = "000000"
      end

      setColor(item, color)

      return item
    elseif #words < 3 or #words > 4 then
      -- doesn't look like this is a tailwind css color
      return item
    end

    if not color_name or not color_number then
      return item
    end

    local color_index = tonumber(color_number)
    local tailwindcss_colors =
        require("tailwindcss-colorizer-cmp.colors").TailwindcssColors

    if not tailwindcss_colors[color_name] then
      return item
    end

    if not tailwindcss_colors[color_name][color_index] then
      return item
    end

    local color = tailwindcss_colors[color_name][color_index]

    setColor(item, color)

    return item
  end

  return item
end

return formatter
