--[[
  Module: plugins.lsp
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
          vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
          vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

          vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
          vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
          vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
        end,
      })

      require("neodev").setup({})

      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "dockerls",
          "jsonls",
          "lua_ls",
          "ruff_lsp",
          "rust_analyzer",
        },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
        },
        -- If required put custom server configuration below
        -- lua_ls = function()
        --   require('lspconfig').lua_ls.setup({
        --     This is where you place
        --     your custom config
        --   })
        -- end,
      })
    end,
  },
  -- }}}

  -- Fromatters and linters as language server
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
        ensure_installed = {
          "actionlint",
          "black",
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
    opts = {
      PATH = "append",
    },
    config = true,
  },
  -- }}}
}

-- vim: foldmethod=marker foldmarker={{{,}}}
