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

<!-- dependency -->

## Dependencies

- [git]()
- [gnu make]()
- [gcc]()
- [unzip]()
- [wget]()
- [curl]()
- [gzip]()
- [tar]()
- [nnn]()
- [sh]() or [bash]()
- One of these: [xclip](), [xsel](), [tmux](), [waycopy]()
- [fd]() or [ripgrep]()
- [python]()
- [node.js]()

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

- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [catppuccin](https://github.com/catppuccin/nvim)
- [cmp-async-path](https://github.com/FelipeLema/cmp-async-path)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [cmp-diag-codes](https://github.com/JMarkin/cmp-diag-codes)
- [cmp-nvim-lsp-document-symbol](https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol)
- [cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [conform.nvim](https://github.com/stevearc/conform.nvim)
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [dressing.nvim](https://github.com/stevearc/dressing.nvim)
- [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [leap.nvim](https://github.com/ggandor/leap.nvim)
- [lspkind.nvim](https://github.com/onsails/lspkind.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [mason-null-ls.nvim](https://github.com/jay-babu/mason-null-ls.nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [neodev.nvim](https://github.com/folke/neodev.nvim)
- [neogit](https://github.com/NeogitOrg/neogit)
- [nnn.nvim](https://github.com/luukvbaal/nnn.nvim)
- [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-origami](https://github.com/chrisgrieser/nvim-origami)
- [nvim-surround](https://github.com/kylechui/nvim-surround)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [onedark](https://github.com/navarasu/onedark.nvim)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [presence.nvim](https://github.com/andweeb/presence.nvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
<!-- plugins-end -->

# License

[MIT License](./LICENSE)
