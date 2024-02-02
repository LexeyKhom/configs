return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  keys = function()
    require("utils.load").mappings {
      n = {
        ["<leader>tu"] = {
          "<cmd> UndotreeToggle <CR> <cmd> UndotreeFocus <CR>",
          "Toggle UndoTree",
        },
      },
    }
  end,
}
