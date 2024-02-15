local autocmd = vim.api.nvim_create_autocmd
local lualineRefresh = function()
  local timer = vim.loop.new_timer()
  local lualine = require "lualine"
  timer:start(
    0,
    0,
    vim.schedule_wrap(function()
      lualine.refresh { place = { "statusline" } }
    end)
  )
end
autocmd("RecordingEnter", { callback = lualineRefresh })
autocmd("RecordingLeave", { callback = lualineRefresh })

local function recording()
  local record = vim.fn.reg_recording()
  if record == "" then
    return ""
  end
  return "запись @" .. record
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "LexeyKhom/nvconfig",
  },
  lazy = false,
  opts = function()
    local theme = require "plugins.lualine.theme"
    return {
      options = {
        theme = theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "mode", color = { gui = "bold" } } },
        lualine_b = { "tabnine" },
        lualine_c = { "branch", "diff", "diagnostics" },
        lualine_x = { { recording }, "selectioncount", "searchcount" },
        lualine_y = { "filetype" },
        lualine_z = { "progress" },
      },
    }
  end,
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
