if status is-interactive
    if test -n "$TERMUX_VERSION"
        if ! test -d /tmp
            command termux-chroot ||
                { pkg install proot && termux-chroot }
        end
    end
end
