--[[
  File: config/autocmd.lua
  Description: Defined autocommands
]]

-- Disable comments on pressing Enter
-- vim.cmd([[autocmd FileType * setlocal formatoptions-=r]])

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight on yank",
  callback = function()
    vim.highlight.on_yank({
      higroup = "@text.todo",
      timeout = 600,
    })
  end,
})
