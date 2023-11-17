![Preview nvim](https://github.com/4ngelf/neovim-config/assets/32184965/568faae0-ffdf-4e1a-8f55-8179aae04a1a)

This are my neovim configuration files.

## Inspiration

- [tokiory/neovim-boilerplate](https://github.com/tokiory/neovim-boilerplate/)
- [LazyVim/LazyVim](https://github.com/LazyVim/LazyVim)

## Use it

You can use this template with the following command:

```bash
[ -d $HOME/.config/nvim ] && mv $HOME/.config/{nvim,nvim.old}; \
    git clone https://github.com/4ngelf/neovim-config $HOME/.config/nvim
```

## Dependencies

<!-- dependency -->

<!-- TODO: Make a list of dependencies -->

<!-- dependency-end -->

# Structure

```
.
├── init.lua                  -- Entry point
├── makefile                  -- List of tasks for configuration management
│
├── lua/
│  ├── config/                -- Neovim configuration
│  │  ├── autocmd.lua         -- Custom autocommands
│  │  ├── globals.lua         -- Global variables
│  │  ├── init.lua            -- Configuration entry point
│  │  ├── keymaps.lua         -- Custom keyboard helpers
│  │  └── options.lua         -- Settings for Neovim
│  │
│  ├── plugins/               -- Plugin configurations by category
│  │
│  ├── util/                  -- Utility modules
│  │
│  ├── lazy-bootstrap.lua     -- Lazy bootstrapper
│  └── postconfig.lua         -- Execute after configuration
├── README.md
└── lazy-lock.json
```

# Packed Plugins

<!-- plugins -->

- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [lsp_zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [lspkind](https://github.com/onsails/lspkind.nvim)
- [Neogit](https://github.com/NeogitOrg/neogit)
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [Tree Sitter](https://github.com/tree-sitter/tree-sitter)
- [sonokai](https://github.com/sainnhe/sonokai)
- [Catppuchin](https://github.com/catppuccin/nvim)

<!-- plugins-end -->

# License

[MIT License](./LICENSE)
