--[[
  Module: plugins.libs
  Description: Dependencies needed for some plugins
]]

return {
  -- Utility functions
  -- Plenary {{{
  {
    "nvim-lua/plenary.nvim",
    lazy = true
  },
  -- }}}

  -- Pretty icons for tuis
  -- nvim-web-devicons {{{
  {
      "nvim-tree/nvim-web-devicons",
      lazy = true
  },
  -- }}}
}

-- vim: foldmethod=marker foldmarker={{{,}}}
