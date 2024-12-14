# Commands to run in interactive sessions can go here
if status is-interactive
    set -gx fish_greeting ''
    set -gxa PATH "$HOME/.local/bin/"

    # Load .env
    set -gx ENV_PATH "$HOME/GDrive/.env"
    load_dotenv $ENV_PATH
end

# Deno
set -gx DENO_INSTALL "$HOME/.deno"
set -gxa PATH "$DENO_INSTALL/bin"

# Bun
set -gx BUN_INSTALL "$HOME/.bun"
set -gxa PATH "$BUN_INSTALL/bin"

# Ethereum/Solidity
set -gx FOUNDRY_INSTALL "$HOME/.foundry"
set -gxa PATH "$FOUNDRY_INSTALL/bin"
