--[[
  File: cmp.lua
  Description: Configuration file for nvim-cmp
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/hrsh7th/nvim-cmp
]]

local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text", -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    }),
  },
})
