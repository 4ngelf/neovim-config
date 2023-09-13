--[[
  File: plugins/extensions/project.nvim
  Description: Lazy configuration for project.nvim
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/ahmedkhalf/project.nvim
]]

local lazy_execute = require("utils").lazy_execute

local M = {}

M[1] = "ahmedkhalf/project.nvim"
M.name = "project.nvim"
M.lazy = true
M.dependencies = { "telescope.nvim" }
M.config = function (opts)
  require("project_nvim").setup(opts)

  lazy_execute("telescope.nvim", function()
    -- Erase this and the next line after testing `lazy_execute`
    print("lazy executed command after telescope.nvim")
    -- require("telescope").load_extension("projects")
  end)
end

return M
