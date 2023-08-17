--[[
  File: template.lua
  Description: Template plugin configuration to create templates files
  See: https://github.com/nvimdev/template.nvim
]]

local template = require("template")

grep_program = vim.fn.executable(grep_program) and "rg" or "grep"

local gitconfig_path = "$HOME/.gitconfig"
local git_author = "[[user]]"
local git_email = "[[email]]"

if vim.fn.filereadable(gitconfig_path) then
  git_author = vim.fn.split(vim.fn.system(grep_program .. " name " .. gitconfig_path), "=")
  git_email = vim.fn.split(vim.fn.system(grep_program .. " email " .. gitconfig_path), "=")
end

template.setup({
  temp_dir = vim.fn.stdpath("config") .. "/templates",
  author = git_author,
  email = git_email,
})
