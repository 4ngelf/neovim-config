--[[
  File: init.lua
  Description: Entry point file for neovim
]]

-- Bootsraping plugin manager
require("lazy-bootstrap")

-- Configuration, globals, options
require("config")

-- Plugin management 
local lazy = require("lazy")
lazy.setup("plugins")

-- Post configuration
require("postconfig")

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
