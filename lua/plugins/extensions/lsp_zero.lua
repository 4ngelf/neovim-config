--[[
  File: plugins/extensions/lsp_zero.lua
  Description: Lazy configuration for lsp-zero.nvim
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/VonHeikemen/lsp-zero.nvim
]]

local M = {}

M[1] = "VonHeikemen/lsp-zero.nvim"
M.name = "lsp-zero.nvim"
M.branch = "v2.x"
M.dependencies = {
  -- LSP Support
  "nvim-lspconfig",
  "mason.nvim",
  "mason-lspconfig.nvim",

  -- null-ls (linters and formatters) support
  "null-ls.nvim",
  "mason-null-ls.nvim",

  -- Autocompletion
  "nvim-cmp",
  "cmp-nvim-lsp",
  "LuaSnip",
}
M.config = function()
  local lsp = require("lsp-zero").preset({})

  lsp.on_attach(function(_, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({
      buffer = bufnr,
      omit = { "gr", "<F2>", "<F3>", "<F4>", "gl", "[d", "]d" }
    })

  end)

  lsp.ensure_installed({
    -- Replace these with whatever servers you want to install
    "lua_ls",
    "bashls",
    "jsonls",
    "eslint",
    "ruff",
    "ruff-lsp",
    "rust_analyzer",
  })

  if vim.fn.getcwd() == vim.fn.stdpath("config") then
    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
    print("lua_ls specific neovim configuration applied!")
  end

  lsp.setup()
end

return M
