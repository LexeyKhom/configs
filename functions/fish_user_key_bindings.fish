function fish_user_key_bindings
    # Switch to normal mode (like <ESC>)
    bind -s --preset -M insert kj "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char repaint-mode; end"

    # Enter / Backspace
    bind -M default \ef execute
    bind -M insert \ef execute
    bind -M default \ea backward-delete-char
    bind -M insert \ea backward-delete-char
    bind -M default \es delete-char
    bind -M insert \es delete-char

    # Navigation
    bind -M default \ej history-search-forward
    bind -M insert \ej history-search-forward
    bind -M default j history-search-forward

    bind -M default \ek history-search-backward
    bind -M insert \ek history-search-backward
    bind -M default k history-search-backward

    bind -M default \eh backward-char
    bind -M insert \eh backward-char
    bind -M default h backward-char

    bind -M default \el forward-char
    bind -M insert \el forward-char
    bind -M default l forward-char

    # Other
    bind -M default \ed exit
    bind -M insert \ed exit
    bind -M default \ec cancel-commandline
    bind -M insert \ec cancel-commandline
end
