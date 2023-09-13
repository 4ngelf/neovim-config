--[[
  File: plugins/extensions/plenary.lua
  Description: Lazy configuration for plenary.nvim
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/nvim-lua/plenary.nvim
]]

local M = {}

M[1] = "nvim-lua/plenary.nvim"
M.name = "plenary.nvim"
M.lazy = true

return M
