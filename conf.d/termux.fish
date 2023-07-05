if status is-interactive
    if test -n "$TERMUX_VERSION"
        set -gx isTermux true
    else
        set -gx isTermux false
    end

    if test "$isTermux" = true
        echo hello
        if ! test -d /tmp
            if ! command termux-chroot
                command pkg install proot
                command termux-chroot
            end
        end
    end
end
