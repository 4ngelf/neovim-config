--[[
  File: postconfig.lua
  Description: Commands to run after defined settings
]]

-- Set colorscheme
vim.cmd("colorscheme " .. COLORSCHEME)

-- Set keymaps with which-key
for _, keymaps in ipairs(WHICH_KEY_MAPS_GROUPS) do
  require("which-key").register(keymaps)
end
