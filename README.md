# Neovim configuration ![Lua version][lua-badge]

![Preview nvim](https://github.com/4ngelf/neovim-config/assets/32184965/568faae0-ffdf-4e1a-8f55-8179aae04a1a)

This are my neovim configuration files.

[lua-badge]: https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2F4ngelf%2Fneovim-config%2Fmain%2F.luarc.json&query=%24.runtime.version&logo=lua&label=runtime.version&labelColor=%23222222

## Inspiration

- [tokiory/neovim-boilerplate](https://github.com/tokiory/neovim-boilerplate/)
- [LazyVim/LazyVim](https://github.com/LazyVim/LazyVim)

# Use it

You can use this template with the following command:

```bash
[ -d "$HOME/.config/nvim" ] && mv $HOME/.config/{nvim,nvim.old}; \
    git clone https://github.com/4ngelf/neovim-config $HOME/.config/nvim
```

## Setup provider

You can install plugins and setup providers automatically with this command

```bash
cd "$HOME/.config/nvim" && make
```

<!-- dependency -->

# Dependencies

- [git](https://git-scm.com/)
- [gnu make](https://www.gnu.org/software/make/)
- [gcc](https://www.gnu.org/software/gcc/)
- [unzip](https://packages.debian.org/sid/unzip)
- [wget](https://www.gnu.org/software/wget/) or [curl](https://curl.se/)
- [gzip](https://www.gnu.org/software/gzip/)
- [tar](https://www.gnu.org/software/tar/)
- [sh](https://en.wikipedia.org/wiki/Bourne_shell) or [bash](https://www.gnu.org/software/bash/)
- One of these: [xclip](https://github.com/astrand/xclip), [xsel](https://github.com/kfish/xsel), [tmux](https://github.com/tmux/tmux), [waycopy](https://github.com/noocsharp/wayclip)

## This configuration dependencies

- [chafa](https://hpjansson.org/chafa/) (for image previewing)
- [nnn](https://github.com/jarun/nnn)
- [fd](https://github.com/sharkdp/fd) or [ripgrep](https://github.com/BurntSushi/ripgrep)
- [python](https://www.python.org/)
- [node.js](https://nodejs.org/en)

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
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
<!-- plugins-end -->

# License

[MIT License](./LICENSE)
