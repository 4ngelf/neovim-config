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
          theme = COLORSCHEME,
        },
      })
    end,
  },
  -- }}}

  -- Git blame
  -- gitsigns {{{
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost" },
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          -- 'eol' | 'overlay' | 'right_align'
          virt_text_pos = "right_align",
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
      })
    end,
  },
  -- }}}
}

-- vim: foldmethod=marker foldmarker={{{,}}}
