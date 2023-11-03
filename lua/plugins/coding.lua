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
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      -- TODO: Sort cmp-nvim-lsp entries with arguments first
      -- TODO: Configure snippets
      -- TODO: install surround.nvim
      -- TODO: Deactivate pyright diagnostics and leave that to ruff

      "LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "FelipeLema/cmp-async-path",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "JMarkin/cmp-diag-codes",

      "onsails/lspkind.nvim",
    },
    opts = function()
      -- Options {{{
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local luasnip = require("luasnip")

      local buf_is_big = function(bufnr)
        local max_filesize = 200 * 1024 -- 200 KB
        ---@diagnostic disable-next-line: undefined-field
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
        if ok and stats and stats.size > max_filesize then
          return true
        else
          return false
        end
      end
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      return {
        -- Enable completion in certain contexts
        enabled = true,
        preselect = cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        -- window = {},
        formatting = {
          format = lspkind.cmp_format({
            preset = "default",
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
        mapping = {
          ["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
          ["<Esc>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.abort()
            else
              fallback()
            end
          end, { "i" }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- that way you will only jump inside the snippet region

            -- elseif luasnip.expand_or_locally_jumpable() then
            --   luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()

            -- elseif luasnip.jumpable(-1) then
            --   luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        },
        view = {
          docs = { auto_open = true },
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp_signature_help" },
          { name = "async_path" },
          { name = "diag-codes" },
        }, {
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" },
        }, {
          {
            name = "buffer",
            option = {
              get_bufnrs = function()
                local buf = vim.api.nvim_get_current_buf()
                if buf_is_big(buf) then
                  return {}
                end
                return { buf }
              end,
            },
          },
        }),
      }
      -- }}}
    end,
    config = function(_, opts)
      -- config {{{
      local cmp = require("cmp")
      cmp.setup(opts)

      -- "/","?" cmdline setup.
      local search_opts = {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "nvim_lsp_document_symbol" },
        }, {
          { name = "buffer" },
        }),
      }

      cmp.setup.cmdline("/", search_opts)
      cmp.setup.cmdline("?", search_opts)
    end,
  },
  --}}}

  -- Snippets
  -- luasnip {{{
  {
    "L3MON4D3/LuaSnip",
    version = "^2.0.0",
    dependencies = {},
    config = false,
  },
  -- }}}
}

-- vim: foldmethod=marker foldmarker={{{,}}}
