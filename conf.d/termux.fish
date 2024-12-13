if status is-interactive
    if test -n "$TERMUX_VERSION"
        set -gx IS_TERMUX true
    end

    if test "$IS_TERMUX" = true
        if ! test -d /tmp
            if ! command termux-chroot
                command pkg install proot
                command termux-chroot
            end
        end
    end
end
