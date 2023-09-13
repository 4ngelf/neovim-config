--[[
  File: plugins/extensions/null_ls.lua
  Description: Lazy configuration for null-ls.nvim
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/jose-elias-alvarez/null-ls.nvim
]]

local M = {}

M[1] = "jose-elias-alvarez/null-ls.nvim"
M.name = "null-ls.nvim"
M.lazy = true

return M
