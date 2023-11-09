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
          theme = DEFAULT_COLORSCHEME,
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

  -- Blankline
  -- indent-blankline {{{
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = {
        highlight = "iblContext",
      },
      exclude = {
        filetypes = {
          "lspinfo",
          "packer",
          "checkhealth",
          "help",
          "man",
          "gitcommit",
          "TelescopePrompt",
          "TelescopeResults",
          "dashboard",
          "''",
        },
      },
    },
    config = function(_, opts)
      vim.api.nvim_set_hl(0, "iblContext", { fg = "#5865F2" })
      require("ibl").setup(opts)
    end,
  },
  -- }}}

  -- Startup screen
  -- dashboard-nvim {{{
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        -- config
      })
    end,
    dependencies = { "nvim-web-devicons" },
  },
  -- }}}

  -- Improve ui components
  -- dressing.nvim {{{
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  --}}}
}
-- vim:foldmethod=marker foldmarker={{{,}}} foldlevel=0
