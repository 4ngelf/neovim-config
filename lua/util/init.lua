--[[
description: utilities commands
]]

local M = {}

local function au(subname)
  return vim.api.nvim_create_augroup("utility-" .. subname, { clear = true })
end

---Lazily execute a command or lua function after {plugin} loads
---@param plugin string the name of the plugin set in Lazy configuration
---@param callback function() Lua function called after {plugin} loads.
function M.lazy_execute(plugin, callback)
  vim.api.nvim_create_autocmd("User", {
    group = au("lazy-execute"),
    pattern = "LazyLoad",
    desc = "Execute after " .. plugin .. " loads.",
    callback = function(ev)
      if ev.data == plugin then
        callback()
        return true
      end
    end,
  })
end

---Verify if a plugin is installed
---@param plugin string
function M.has(plugin)
  return require("lazy.core.config").spec.plugins[plugin] ~= nil
end

return M
