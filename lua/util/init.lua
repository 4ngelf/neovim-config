--[[
description: utilities commands
]]

local M = {}

local function au(subname)
  return vim.api.nvim_create_augroup("utility-" .. subname, { clear = false })
end

---Lazily execute a command or lua function after {plugin} loads
---@param plugin string the name of the plugin set in Lazy configuration
---@param callback function Lua function called after {plugin} loads.
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

---Register mappings using which-key.nvim
---@param mappings Mappings|any
---@param opts MappingOptions|nil
function M.wk_register(mappings, opts)
  M.lazy_execute("which-key.nvim", function()
    require("which-key").register(mappings, opts)
  end)
  -- local has_wk, wk = pcall(require, "which-key")
  -- if not has_wk then
  --   vim.api.nvim_err_writeln("[lsp] Which-key module not found.")
  --   return
  -- end
  --
  -- wk.register(mappings, opts)
end

return M
