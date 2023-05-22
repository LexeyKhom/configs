if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx fish_greeting ''
    # Run '/home/lexey/.deno/bin/deno --help' to get started
    set -gx DENO_INSTALL "/home/lexey/.deno"
    set -gxa PATH "$DENO_INSTALL/bin"
end
