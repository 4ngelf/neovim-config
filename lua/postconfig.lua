--[[
  File: postconfig.lua
  Description: Commands to run after defined settings
]]

local G = require("config.globals")

-- Ensure colorscheme is used if not installed before
vim.cmd("colorscheme " .. G.DEFAULT_COLORSCHEME)
