--[[
  File: plugins/extensions/telescope_nvim.lua
  Description: Lazy configuration file telescope.nvim
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/nvim-telescope/telescope.nvim
]]

local M = {}

M[1] = "nvim-telescope/telescope.nvim"
M.name = "telescope.nvim"
M.tag = "0.1.2"
M.lazy = true
M.cmd = "Telescope"
M.dependencies = {
  "plenary.nvim",
}
M.config = function()
  local telescope = require("telescope")
  telescope.setup()
end

return M
