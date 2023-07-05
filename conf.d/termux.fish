if status is-interactive
    if test -n "$TERMUX_VERSION"
        if ! test -d
            command pkg install proot && termux-chroot
        end
    end
end
