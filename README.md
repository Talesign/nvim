# nvim configs

My personal config for nvim. Simple yet effective. Low memory consumption even on Windows.

## Plugins in use
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [nvim-telescope](https://github.com/nvim-telescope/telescope.nvim)
- [tabby-nvim](https://github.com/nanozuki/tabby.nvim)
- [lspzero](https://github.com/VonHeikemen/lsp-zero.nvim)

## Colorscheme
- [rosepine](https://github.com/rose-pine/neovim)

## Keymaps
I have some basic keymaps. Most notably <Leader>h, <Leader>j, <Leader>k, <Leader>l for creating buffers around the active buffer, and <C-j>... to move around buffers. Then I use F2 to create a new tab, F3/F4 to switch before after and F5 to close.

## file structure
~/.config/nvim
├── lua
│   ├── core
│   │   ├── init.lua
│   │   ├── keymaps.lua
│   │   ├── options.lua
│   └── plugins
│       ├── manager.lua
│       ├── init.lua
│       └── config/[plugin-name].lua
└── init.lua

## Planning to
- [ ] Add plugin: Treesitter
- [ ] Add plugin: Fugitive
