--[[
  Module: plugins.colorscheme
  Description: Plugins for colorscheme including catppuccin, OneDark, etc
  Spec-notes: All plugins should load on VeryLazy event.
]]

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    version = "^1.4.0",
    event = "VeryLazy",
    config = function (opts)
      require("catppuccin").setup({
        flavour = "frappe", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "frappe"
        },
        transparent_background = TRANSPARENT_BACKGROUND,
        integrations = {
          cmp = true,
          dap = { enabled = true, enable_ui = true, },
          dashboard = true,
          fidget = true,
          gitsigns = true,
          harpoon = true,
          lsp_trouble = true,
          markdown = true,
          neotree = true,
          telescope = { enabled = true },
          treesitter = true,
          which_key = true,
        }
      })
    end,
  },
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    event = "VeryLazy",
    config = function ()
      require("onedark").setup({
        style = "dark",
        transparent = TRANSPARENT_BACKGROUND,
        lualine = {
          transparent = TRANSPARENT_BACKGROUND
        }
      })
    end,
  },

}
