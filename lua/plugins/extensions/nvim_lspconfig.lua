--[[
  File: plugins/extensions/nvim_lspconfig.lua
  Description: Lazy configuration for nvim-lspconfig
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/neovim/nvim-lspconfig
]]

local M = {}

M[1] = "neovim/nvim-lspconfig"
M.name = "nvim-lspconfig"
M.lazy = true

return M
