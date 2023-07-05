# Nvim

## Install

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
   git clone -b nvim git@github.com:LexeyKhom/configs.git ~/.config/nvim/lua/custom ||
   git clone -b nvim https://github.com/LexeyKhom/configs ~/.config/nvim/lua/custom
   ```

3. Use `:MasonInstallAll` to install Mason.
