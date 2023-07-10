if status is-interactive
    if test -n "$TERMUX_VERSION"
        set -gx isTermux true
    end

    if test "$isTermux" = true
        if ! test -d /tmp
            if ! command termux-chroot
                command pkg install proot
                command termux-chroot
            end
        end
    end
end
