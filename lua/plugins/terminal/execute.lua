local execute = function(onError, onSuccess)
  -- (https://vimdoc.sourceforge.net/htmldoc/cmdline.html#filename-modifiers)
  local fileName = vim.fn.expand "%:p:~:."
  local fileType = vim.bo.filetype

  local execute = {}

  execute.javascript = function(name)
    onSuccess("node " .. name)
  end

  execute.typescript = function(name)
    onSuccess("bun " .. name)
  end

  execute.html = function(name)
    onSuccess("firefox '" .. name .. "'")
  end

  execute.gdscript = function()
    onSuccess "godot"
  end

  execute.python = function(name)
    onSuccess("python " .. name)
  end

  execute.php = function(name)
    onSuccess("php " .. name)
  end

  execute.go = function(name)
    onSuccess("go run " .. name)
  end

  execute.c = function(name)
    local join = require("utils.table").join
    local basename = vim.fn.expand "%:r"
    local compile = "gcc -Wall -g -lm ${name} -o ${basename}"
        % { name = name, basename = basename }
    local separator = "echo -----"
    local run = "./" .. basename
    onSuccess(join({ compile, separator, run }, " && "))
  end

  execute.pascal = function(name)
    local join = require("utils.table").join
    local basename = vim.fn.expand "%:r"
    local compile = "fpc " .. name
    local separator = "clear"
    local run = "./" .. basename
    onSuccess(join({ compile, separator, run }, "&&"))
  end

  execute.asm = function(name)
    local join = require("utils.table").join
    local basename = vim.fn.expand "%:r"
    local compile = "nasm -f elf -g -o ${basename}.o ${name}"
        % { name = name, basename = basename }
    local compile2 = "ld -m elf_i386 ${basename}.o -o ${basename}"
        % { name = name, basename = basename }
    local separator = "clear"
    local run = "./" .. basename
    onSuccess(join({ compile, compile2, separator, run }, "&&"))
  end

  execute.sh = function(name)
    onSuccess("./" .. name)
  end

  execute.terminal = function(_)
    onSuccess "clear"
  end

  execute.err = function(type)
    return function(name)
      onError(
        "No execute defined. Type: '" .. type .. "', File: '" .. name .. "'"
      )
    end
  end

  local fn = execute[fileType] or execute.err(fileType)
  fn(fileName)
end

return execute
