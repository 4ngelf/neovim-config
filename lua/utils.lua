--[[
description: utilities commands
]]

local M = {}

---Lazily execute a command or lua function after {plugin} loads
---@param plugin string the name of the plugin set in Lazy configuration
---@param callback function() Lua function called after {plugin} loads.
function M.lazy_execute(plugin, callback)
  vim.api.nvim_create_autocmd("LazyLoad", {
    group = "lazy-execute",
    desc = "Lazy execute after "..plugin.." loads.",
    callback = function (ev)
      if ev.event ~= "LazyLoad" then return true end
      if ev.data == plugin then
        callback()
      end
      return true
    end,
    once = true
  })
end

return M
