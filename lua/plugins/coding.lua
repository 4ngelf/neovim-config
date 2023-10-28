--[[
  Module: plugins.coding.completion
  Description: Plugins to aid in coding experience
]]

return {
  -- Code completions
  -- nvim-cmp {{{
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
      "nvim-lspconfig",
      "LuaSnip",

      -- TODO: Configure all this
      -- TODO: Configure snippets
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "FelipeLema/cmp-async-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      -- Options {{{
      local cmp = require("cmp")
      return {
        -- Enable completion in certain contexts
        enabled = function()
          -- disable completion if the cursor is `Comment` syntax group.
          -- return not cmp.config.context.in_treesitter_capture("@comment")
          return true
        end,
        snippet = {},
        mapping = {
          ["<C-f>"] = cmp.mapping.scroll_docs(-4),
          ["<C-b>"] = cmp.mapping.scroll_docs(4),
          ["<C-[>"] = cmp.mapping.select_next_item(),
          ["<C-]>"] = cmp.mapping.select_prev_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        window = {
          completion = {
            col_offset = 2,
          },
        },
        sources = cmp.config.sources({
          {
            name = "nvim_lsp",
            entry_filter = function(entry, ctx)
              return true
            end,
          },
        }, {
          { name = "buffer" },
        }),
      }
      -- }}}
    end,
    config = function(_, opts)
      -- config {{{
      require("cmp").setup(opts)
      -- }}}
    end,
  },
  --}}}

  -- Snippets
  -- luasnip {{{
  {
    "L3MON4D3/LuaSnip",
    version = "^2.0.0",
    dependencies = {},
  },
  -- }}}
}

-- vim: foldmethod=marker foldmarker={{{,}}}
