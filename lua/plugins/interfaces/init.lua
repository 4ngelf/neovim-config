--[[
  Module: plugins.interfaces.init
  Description: Plugins for TUIs like telescope, lualine, neogit, etc
]]

return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({
        options = {
          theme = THEME
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    version = "^0.1.2",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
   },
    config = function ()
      local telescope = require("telescope")
      local configuration = require("plugins.interfaces.telescope")

      telescope.setup(configuration.setup)
      for _, extension in ipairs(config.TELESCOPE_EXTENSIONS) do
        telescope.load_extension(extension)
      end
    end,
  },
 
}

