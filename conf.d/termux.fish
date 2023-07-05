if status is-interactive
    if test -n "$TERMUX_VERSION"
        command termux-chroot || pkg install proot && termux-chroot
    end
end
