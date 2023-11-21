--[[
  File: init.lua
  Description: Entry point file for neovim
]]

-- Bootsraping plugin manager
require("lazy-bootstrap")

-- Configuration, globals, options, autocmds
require("config")

-- Plugin management
local lazy = require("lazy")
lazy.setup({
  spec = { import = "plugins" },
  install = {
    colorscheme = { require("config.globals").DEFAULT_COLORSCHEME, "habamax" },
  },
})

-- Post configuration
require("postconfig")

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
