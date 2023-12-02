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

local getCurDir = require("utils.fs").getCurDir

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  opts = {
    options = {
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      globalstatus = true,
    },
    sections = {
      lualine_a = { { "mode", color = { gui = "bold" } } },
      lualine_b = { "filename" },
      lualine_c = { "branch", "diff", "diagnostics" },
      lualine_x = { { recording }, "selectioncount", "searchcount" },
      lualine_y = { "filetype" },
      lualine_z = { "progress" },
    },
  },
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
