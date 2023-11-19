--[[
  File: postconfig.lua
  Description: Commands to run after defined settings
]]

-- Ensure colorscheme is used if not installed before
vim.cmd("colorscheme " .. DEFAULT_COLORSCHEME)
