local execute = function(error, callback)
  -- (https://vimdoc.sourceforge.net/htmldoc/cmdline.html#filename-modifiers)
  local fileName = vim.fn.expand "%:p:~:."
  local fileType = vim.bo.filetype

  local execute = {}

  execute.javascript = function(name)
    callback("node " .. name)
  end

  execute.typescript = function(name)
    callback("deno run " .. name)
  end

  execute.html = function(name)
    callback("firefox '" .. name .. "'")
  end

  execute.python = function(name)
    callback("python " .. name)
  end

  execute.pascal = function(name)
    local join = require("utils.table").join
    local compile = "fpc " .. name
    local separator = "clear"
    local exeFileName = string.sub(name, 1, -5)
    local run = "./" .. exeFileName
    callback(join({ compile, separator, run }, "&&"))
  end

  execute.asm = function(name)
    local join = require("utils.table").join
    local exeFileName = string.sub(name, 1, -5)
    local compile = "nasm -f elf " .. name
    local compile2 = "ld -m elf_i386 " .. exeFileName .. ".o -o " .. exeFileName
    local separator = "clear"
    local run = "./" .. exeFileName
    callback(join({ compile, compile2, separator, run }, "&&"))
  end

  execute.sh = function(name)
    callback("./" .. name)
  end

  execute.terminal = function(_)
    callback "clear"
  end

  execute.err = function(type)
    return function(name)
      error("No execute defined. Type: '" .. type .. "', File: '" .. name .. "'")
    end
  end

  local fn = execute[fileType] or execute.err(fileType)
  fn(fileName)
end

return execute
