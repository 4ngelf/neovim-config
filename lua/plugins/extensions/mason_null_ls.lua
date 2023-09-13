--[[
  File: plugins/extensions/mason_null_ls.lua
  Description: Lazy configuration for mason-null-ls.nvim
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/jay-babu/mason-null-ls.nvim
]]

local M = {}

M[1] = "jay-babu/mason-null-ls.nvim"
M.name = "mason-null-ls.nvim"
M.lazy = true

return M
