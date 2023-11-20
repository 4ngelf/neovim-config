--[[
description: utilities commands
]]

local M = {}

---Verify if a plugin is installed
---@param plugin string
function M.has(plugin)
  return require("lazy.core.config").spec.plugins[plugin] ~= nil
end

---Lazily execute a callback if plugin is loaded
---@param plugin_name string name of plugin set in Lazy configuration
---@param callback fun(name: string) Lua function called if plugin is loaded
--func function(name: string)
function M.on_load(plugin_name, callback)
  local Plugin = require("lazy.core.config").plugins[plugin_name]
  if Plugin and Plugin._.loaded then
    callback(plugin_name)
  else
    vim.api.nvim_create_autocmd("User", {
      desc = "Execute after " .. plugin_name .. " loads.",
      pattern = "LazyLoad",
      callback = function(ev)
        if ev.data == plugin_name then
          callback(plugin_name)
          return true
        end
      end,
    })
  end
end

---Register mappings using which-key.nvim
---@param mappings table
---@param opts any
function M.wk_register(mappings, opts)
  M.on_load("which-key.nvim", function()
    require("which-key").register(mappings, opts)
  end)
end

return M
