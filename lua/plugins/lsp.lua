--[[
  Module: plugins.coding.lsp
  Description: All plugins and configuration related to LSP (Language Server Protocol)
]]

return {
  -- LSP configuration
  -- nvim-lspconfig {{{
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "LspInstall", "LspInfo" },
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      -- config {{{
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
          vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
          vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
          vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
          vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
          vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
          vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
          vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        end,
      })

      require("neodev").setup({})

      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local lsp_capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {}
      )

      local default_setup = function(server_name)
        lspconfig[server_name].setup({
          capabilities = lsp_capabilities,
        })
      end

      mason_lspconfig.setup({
        ensure_installed = {
          "bashls",
          "dockerls",
          "jsonls",
          "lua_ls",
          "ruff_lsp",
          "pyright",
          "rust_analyzer",
        },
        handlers = {
          default_setup,
          ["ruff_lsp"] = function()
            lspconfig["ruff_lsp"].setup({
              capabilities = lsp_capabilities,
              on_attach = function(client, _)
                -- Disable in favor of pyright
                client.server_capabilities.hoverProvider = false
              end,
            })
          end,
          -- If required put custom server configuration below
          -- lua_ls = function()
          --   require('lspconfig').lua_ls.setup({
          --     This is where you place
          --     your custom config
          --   })
          -- end,
        },
      })

      -- }}}
    end,
  },
  -- }}}

  -- Formatters and linters as language server
  -- null-ls {{{
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "plenary.nvim",
      "mason.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        automatic_installation = false,
        ensure_installed = {
          "actionlint",
          "black",
          "codespell",
          "flake8",
          "isort",
          "prettier",
          "prettierd",
          "ruff",
          "shellcheck",
          "stylua",
        },
        handlers = {
          -- example:
          -- function() end, -- disables automatic setup of all null-ls sources
          -- stylua = function(source_name, methods)
          -- null_ls.register(null_ls.builtins.formatting.stylua)
          -- end,
        },
      })

      require("null-ls").setup({
        sources = {
          -- Anything not supported by mason here
        },
      })
    end,
  },
  -- }}}

  -- LSP, LINTER, DAP & FORMATTER installer
  -- mason {{{
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {
      { "<leader>um", "<cmd>Mason<CR>", desc = "Mason" },
    },
    ---@class MasonSettings
    opts = {
      PATH = "append",
    },
    config = true,
  },
  -- }}}
}

-- vim: foldmethod=marker foldmarker={{{,}}}
