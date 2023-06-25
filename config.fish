if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx fish_greeting ''
    set -gx HUGGING_FACE_HUB_TOKEN (cat ~/GDrive/.hfcc)

    # Run '/home/lexey/.deno/bin/deno --help' to get started
    set -gx DENO_INSTALL "/home/lexey/.deno"
    set -gxa PATH "$DENO_INSTALL/bin"
end

# For NoeVim tests
alias tvim='XDG_DATA_HOME=~/Documents/NeoVim/.local/share XDG_CONFIG_HOME=~/Documents/NeoVim/ nvim'
