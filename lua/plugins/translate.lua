local function translate(to_lang, input_type)
  return function()
    require("translate").translate {
      get_command = function(input)
        return {
          "trans",
          "-e",
          "google",
          "-b",
          ":" .. to_lang,
          input,
        }
      end,
      -- input | clipboard | selection
      input = input_type,
      -- open_float | notify | copy | insert | replace
      output = { "open_float", "copy" },
      resolve_result = function(result)
        if result.code ~= 0 then
          return nil
        end
        return string.match(result.stdout, "(.*)\n")
      end,
    }
  end
end

return {
  "niuiic/translate.nvim",
  dependencies = { "niuiic/omega.nvim" },
  keys = function()
    require("utils.loader").mappings {
      n = {
        ["<leader>tr"] = {
          translate("ru", "input"),
          "Translate to RU",
        },
        ["<leader>te"] = {
          translate("en", "input"),
          "Translate to EN",
        },
      },

      v = {
        ["<leader>tr"] = {
          translate("ru", "selection"),
          "Translate to RU",
        },

        ["<leader>te"] = {
          translate("en", "selection"),
          "Translate to EN",
        },
      },
    }
  end,
}
