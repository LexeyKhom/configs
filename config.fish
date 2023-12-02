# Commands to run in interactive sessions can go here
if status is-interactive
    set -gx fish_greeting ''
    set -gxa PATH "$HOME/.local/bin/"

    # HuggingFace
    set -gx LLM_NVIM_API_TOKEN (cat ~/GDrive/.hfcc)

    # For DENO
    # Run '/home/lexey/.deno/bin/deno --help' to get started
    set -gx DENO_INSTALL "$HOME/.deno"
    set -gxa PATH "$DENO_INSTALL/bin"
end
