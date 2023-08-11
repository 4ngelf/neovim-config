--[[
  File: null_ls.lua
  Description: Configuration file for null-ls & mason-null-ls
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/jose-elias-alvarez/null-ls.nvim
]]

local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    -- Here you can add tools not supported by mason.nvim
    -- make sure the source name is supported by null-ls
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
  }
})

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require('mason-null-ls').setup({
  ensure_installed = nil,
  automatic_installation = false, -- You can still set this to `true`
  handlers = {
      -- Here you can add functions to register sources.
      -- See https://github.com/jay-babu/mason-null-ls.nvim#handlers-usage
      --
      -- If left empty, mason-null-ls will  use a "default handler"
      -- to register all sources
  }
})
