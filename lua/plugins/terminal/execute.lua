local execute = function(on_error, on_success)
  -- (https://vimdoc.sourceforge.net/htmldoc/cmdline.html#filename-modifiers)
  local fileName = vim.fn.expand "%:p:~:."
  local fileType = vim.bo.filetype

  local execute = {}

  execute.javascript = function(name)
    on_success("node " .. name)
  end

  execute.typescript = function(name)
    on_success("bun " .. name)
  end

  execute.html = function(name)
    on_success("firefox '" .. name .. "'")
  end

  execute.gdscript = function(name)
    if name:match "%test.gd$" then
      on_success(
        'godot --headless --path "$PWD" -s "res://addons/gut/gut_cmdln.gd" -gexit -gdir="" -gtest="res://'
        .. name
        .. '"'
      )
      return
    end
    local basename = vim.fn.expand "%:.:r"
    on_success('godot "res://' .. basename .. '.tscn"')
  end

  execute.python = function(name)
    on_success("python " .. name)
  end

  execute.php = function(name)
    on_success("php " .. name)
  end

  execute.go = function(name)
    on_success("go run " .. name)
  end

  execute.c = function(name)
    local join = require("utils.table").join
    local basename = vim.fn.expand "%:r"
    local compile = "gcc -Wall -g -lm ${name} -o ${basename}"
      % { name = name, basename = basename }
    local separator = "echo -----"
    local run = "./" .. basename
    on_success(join({ compile, separator, run }, " && "))
  end

  execute.pascal = function(name)
    local join = require("utils.table").join
    local basename = vim.fn.expand "%:r"
    local compile = "fpc " .. name
    local separator = "clear"
    local run = "./" .. basename
    on_success(join({ compile, separator, run }, "&&"))
  end

  execute.asm = function(name)
    local extension = vim.fn.expand "%:e"
    if extension == "inc" then
      print "It is forbidden to execute '.inc' files"
      return
    end
    local join = require("utils.table").join
    local basename = vim.fn.expand "%:r"
    local macroprocessing = "nasm -E -dOS_LINUX ${name} > ${basename}.expanded.asm"
        % { name = name, basename = basename }
    local compile = "nasm -f elf -dOS_LINUX -g -o ${basename}.o ${name}"
        % { name = name, basename = basename }
    local compile2 = "ld -m elf_i386 ${basename}.o -o ${basename}"
        % { basename = basename }
    local separator = "clear"
    local run = "./" .. basename
    on_success(
      join({ macroprocessing, compile, compile2, separator, run }, "&&")
    )
  end

  execute.sh = function(name)
    on_success("./" .. name)
  end

  execute.terminal = function(_)
    on_success "clear"
  end

  execute.err = function(type)
    return function(name)
      on_error(
        "No execute defined. Type: '" .. type .. "', File: '" .. name .. "'"
      )
    end
  end

  local fn = execute[fileType] or execute.err(fileType)
  fn(fileName)
end

return execute
