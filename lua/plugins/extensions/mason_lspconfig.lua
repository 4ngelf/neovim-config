--[[
  File: plugins/extensions/mason_lspconfig.lua
  Description: Lazy configuration for mason-lspconfig.nvim
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/williamboman/mason-lspconfig.nvim
]]

local M = {}

M[1] = "williamboman/mason-lspconfig.nvim"
M.name = "mason-lspconfig.nvim"
M.lazy = true

return M
