# Nvim

## Setup

0. Install dependencies:

   ```bash
   sudo dnf install noevim clang clang-check ripgrep sed tree-sitter-cli
   ```

1. Install [NvChad](https://nvchad.com/docs/quickstart/install).

   ```bash
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
   ```

2. Install this config:

   ```bash
   {
   git clone git@github.com:LexeyKhom/configs.git
       ~/.config/nvim/lua/custom --depth 1 ||
   git clone https://github.com/LexeyKhom/configs
       ~/.config/nvim/lua/custom --depth 1
   } &&
   cd ~/.config/nvim/lua/custom &&
   git checkout nvim
   ```

3. Use `:MasonInstallAll` to install Mason.
