# Neovim

## Language settings

- [Mason](https://mason-registry.dev/registry/list)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages)
- [LSP](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
- [Null-ls](https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md)
- [DAP](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation)

## How to install

0. Install dependencies:

   ```sh
   sudo dnf install neovim
   ```

1. Install this config:

   ```sh
   git clone -b nvim git@github.com:LexeyKhom/configs.git ~/.config/nvim ||
   git clone -b nvim https://github.com/LexeyKhom/configs ~/.config/nvim
   ```

2. Use `:MasonInstallAll` to install Mason packages.
