--[[
  File: config/init.lua
  Description: Entry point file for configuration
]]

require("config.globals")
require("config.options")
require("config.keymaps")
require("config.autocmd")

-- Set associating between turned on plugins and filetype
vim.cmd([[filetype plugin on]])

-- Disable comments on pressing Enter
-- vim.cmd([[autocmd FileType * setlocal formatoptions-=r]])
