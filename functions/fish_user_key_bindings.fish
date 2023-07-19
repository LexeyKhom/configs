function fish_user_key_bindings
    # Switch to normal mode (like <ESC>)
    bind -s --preset -M insert kj "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char repaint-mode; end"

    # INSERT MODE

    # Ctrl + jklh
    bind -M insert \ch backward-char
    bind -M insert \cl forward-char

    # Alt + jklh
    bind -M insert \ej history-search-forward
    bind -M insert \ek history-search-backward
    bind -M insert \eh backward-delete-char
    bind -M insert \el execute

    # NORMAL MODE

    bind -M default j history-search-forward
    bind -M default k history-search-backward
    bind -M default h backward-char
    bind -M default l forward-char

    # Alt + jklh
    bind -M default \ej history-search-forward
    bind -M default \ek history-search-backward
    bind -M default \eh backward-delete-char
    bind -M default \el execute
end
