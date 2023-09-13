--[[
  File: plugins/extensions/mason.lua
  Description: Lazy configuration for mason.nvim
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/williamboman/mason.nvim
]]

local M = {}

M[1] = "williamboman/mason.nvim"
M.name = "mason.nvim"
M.lazy = true

return M
