--[[
  module: plugins.coding
  description: all plugins and configuration to aid coding
]]

local lazy_tables = {
  "plugins.coding.formatter",
  "plugins.coding.lsp",
}

local M = {}

for _, lazy_table in ipairs(lazy_tables) do
  M[#M + 1] = require(lazy_table)
end

return M
