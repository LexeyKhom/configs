function fish_user_key_bindings
    fish_vi_key_bindings

    # Normal Mode
    bind -M insert -m default kj backward-char repaint

    # Paste
    bind -M default \ep fish_clipboard_paste
    bind -M insert \ep fish_clipboard_paste
    bind -M default p fish_clipboard_paste

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

    bind -M default \el forward-char
    bind -M insert \el forward-char
    bind -M default l forward-char

    bind -M default \eh backward-char
    bind -M insert \eh backward-char
    bind -M default h backward-char

    bind -M default \ew forward-word forward-char
    bind -M insert \ew forward-word forward-char
    bind -M default w forward-word forward-char

    bind -M default \ee forward-word
    bind -M insert \ee forward-word
    bind -M default e forward-word

    bind -M default \eb backward-word
    bind -M insert \eb backward-word
    bind -M default b backward-word

    bind -M default \e0 beginning-of-line
    bind -M insert \e0 beginning-of-line

    bind -M default \e4 end-of-line
    bind -M insert \e4 end-of-line

    # Other
    bind -M default \ed exit
    bind -M insert \ed exit
    bind -M default \ec cancel-commandline
    bind -M insert \ec cancel-commandline
end
