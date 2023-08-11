--[[
  File: plugins.lua
  Description: This file needed for loading plugin list into lazy.nvim and loading plugins
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/folke/lazy.nvim
]]

require "helpers/globals"

return {

  -- TreeSitter {{{
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "extensions.treesitter"
    end
  },
  -- }}}

  -- Telescope {{{
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ahmedkhalf/project.nvim",
    },
    config = function()
      require "extensions.telescope"
    end
  },
  -- }}}

  -- lsp_zero {{{
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional
      {'jose-elias-alvarez/null-ls.nvim'},   -- Optional
      {'jay-babu/mason-null-ls.nvim'},       -- Optional      

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      {'onsails/lspkind-nvim'},
    },
    config = function()
      require "extensions.lsp_zero"
      require "extensions.cmp"
      require "extensions.null_ls"
    end
  },
  -- }}}

  -- Trouble {{{
  {
    "folke/trouble.nvim",
    lazy = true,
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require "extensions.trouble"
    end,
  },
  -- }}}

  -- neogit {{{
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
    },
    config = true
  },
  -- }}}

  -- Git Signs{{{
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = function()
      require "extensions.gitsigns"
    end
  },
  -- }}}

  -- Theme: Catppuchin {{{
  {
    "catppuccin/nvim",
    name = "catppuccin", 
    lazy = false,
    priority = 1000,
    config = function()
      require "extensions.colorscheme.catppuccin"
    end
  },
  -- }}}

  -- Theme: Sonokai {{{
  {
    "sainnhe/sonokai",
    lazy = false,
    config = function ()
      require "extensions.colorscheme.sonokai"
    end
  },
  -- }}}

  -- [Inactive] Mason {{{
  -- {
  --   "williamboman/mason.nvim",
  --   build = ":MasonUpdate",
  --   dependencies = {
  --     "williamboman/mason-lspconfig.nvim",
  --     "neovim/nvim-lspconfig",
  --   },
  --   config = function()
  --     require "extensions.mason"
  --   end
  -- },
  -- }}}

  -- [Inactive] CMP {{{
  -- {
  --   'hrsh7th/nvim-cmp',
  --   event = "InsertEnter",
  --   dependencies = {
  --     'L3MON4D3/LuaSnip',
  --     'saadparwaiz1/cmp_luasnip',
  --     'hrsh7th/cmp-nvim-lsp',
  --     'hrsh7th/cmp-path',
  --     'hrsh7th/cmp-emoji',
  --     'hrsh7th/cmp-nvim-lsp-signature-help',
  --     'hrsh7th/cmp-nvim-lua',
  --     'rafamadriz/friendly-snippets',
  --   },
  --   config = function()
  --     require "extensions.cmp"
  --   end
  -- },
  -- }}}

  -- [Inactive] Neo Tree {{{
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v2.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   config = function ()
  --     require "extensions.neotree"
  --   end
  -- },
  -- }}}

}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
