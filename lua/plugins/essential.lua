--[[
  Module: plugins.essential
  Description: Group of dependencies and utility plugins
]]

return {
  -- Keymap legend and manager
  -- which-key {{{
  {
    "folke/which-key.nvim",
    version = "^1.6.0",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1000
    end,
    opts = {
      plugins = {},
      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>u"] = {
          name = "+ui",
          mode = "n",
          l = { "<cmd>Lazy<CR>", "Lazy.nvim" },
        },
        -- ["<leader><tab>"] = { name = "+tabs" },
        -- ["<leader>b"] = { name = "+buffer" },
        -- ["<leader>g"] = { name = "+git" },
        -- ["<leader>gh"] = { name = "+hunks" },
        -- ["<leader>q"] = { name = "+quit/session" },
        -- ["<leader>s"] = { name = "+search" },
        -- ["<leader>w"] = { name = "+windows" },
        -- ["<leader>x"] = { name = "+diagnostics/quickfix" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
  -- }}}

  -- Utility functions
  -- Plenary {{{
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  -- }}}

  -- Pretty icons for tuis
  -- nvim-web-devicons {{{
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  -- }}}
}
-- vim:foldmethod=marker foldmarker={{{,}}} foldlevel=0
