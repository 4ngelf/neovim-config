--[[
  Module: plugins.ui
  Description: Modifications of default UI like lualine, bufferline, etc
]]
return {
  -- Better bottom status line
  -- lualine {{{
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      "nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({
        options = {
          theme = COLORSCHEME
        },
      })
    end,
  },
  -- }}}
}

-- vim: foldmethod=marker foldmarker={{{,}}}
