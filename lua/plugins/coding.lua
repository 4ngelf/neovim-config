--[[
  Module: plugins.coding
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

      vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#232634" })

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
        window = {
          completion = {
            winhighlight = "Normal:CmpNormal",
          },
          documentation = {
            winhighlight = "Normal:CmpNormal",
          },
        },
        formatting = {
          format = lspkind.cmp_format({
            preset = "default",
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
        mapping = {
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
          ["<Esc>"] = cmp.mapping(function(fallback)
            local is_selected = cmp.get_active_entry() ~= nil
            if cmp.visible() and is_selected then
              cmp.abort()
            else
              fallback()
            end
          end, { "i" }),
          ["<C-s>"] = cmp.mapping.complete({
            ---@diagnostic disable-next-line:missing-fields
            config = {
              sources = { { name = "luasnip" } },
            },
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- that way you will only jump inside the snippet region
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
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

      ---@diagnostic disable-next-line:missing-fields
      cmp.setup.cmdline(":", { enabled = false })

      -- Fix undesired <Tab> mapping by cmp when using ":" command mode
      vim.keymap.set("c", "<Tab>", "<C-z>", { silent = false, noremap = false })
      --}}}
    end,
  },
  --}}}

  -- Snippets
  -- luasnip {{{
  {
    "L3MON4D3/LuaSnip",
    version = "^2.0.0",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  -- }}}

  -- Automatic pairs
  -- nvim-autopairs {{{
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
      "nvim-cmp",
    },
    opts = {
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      disable_in_macro = true,
      disable_in_visualblock = false,
      disable_in_replace_mode = true,
      ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
      enable_moveright = true,
      enable_afterquote = true,
      enable_check_bracket_line = true,
      enable_bracket_in_quote = true, --,
      enable_abbr = false, -- trigger abbreviation
      break_undo = true, -- switch for basic rule break undo sequence
      check_ts = false,
      map_cr = true,
      map_bs = true, -- map the <BS> key
      map_c_h = false, -- Map the <C-h> key to delete a pair
      map_c_w = false, -- map <c-w> to delete a pair if possible
    },
    config = function(_, opts)
      local autopairs = require("nvim-autopairs")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")

      autopairs.setup(opts)
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  --}}}

  -- helpers to manually surround text
  -- nvim-surround {{{
  {
    "kylechui/nvim-surround",
    version = "^2.1.2",
    event = "InsertEnter",
    config = true,
  },
  --}}}

  -- faster motions
  -- leap.nvim {{{
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  -- }}}

  -- Toggle comment
  -- Comment.nvim {{{
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  -- }}}

  -- Enhanced folding keymaps
  -- origami.nvim {{{
  {
    "chrisgrieser/nvim-origami",
    event = "BufReadPost",
    opts = {
      keepFoldsAcrossSessions = false,
      pauseFoldsOnSearch = true,
      setupFoldKeymaps = true,
    },
    config = true,
  },
  -- }}}

  -- Discord Rich presence
  -- presence.nvim {{{
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    opts = {
      -- General options
      auto_update = true,
      neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
      main_image = "file", -- Main image display (either "neovim" or "file")
      blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
      -- NOTE: Consider making button for github.com/4ngelf
      buttons = false, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
      show_time = true,

      -- Rich Presence text options
      editing_text = function(filename) -- string or function(filename: string): string
        local split_path = vim.split(filename:lower(), ".", { plain = true })
        local ext = split_path[#split_path]
        return "Editing ." .. ext .. " file"
      end,
      file_explorer_text = "Browsing files", -- string or function(file_explorer_name: string): string
      git_commit_text = "Committing changes", -- string or function(filename: string): string
      reading_text = "Reading", -- string or function(filename: string): string
      workspace_text = "Working on repository", -- string or function(project_name: string|nil, filename: string): string
    },
  },
  -- }}}
}
-- vim:foldmethod=marker foldmarker={{{,}}} foldlevel=0
