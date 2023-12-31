--[[
  File: settings.lua
  Description: Base settings for neovim
  Info: Use <zo> and <zc> to open and close foldings
]]

local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = "\\"

-- Scrolling {{{
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
-- }}}

-- Tabs {{{
opt.expandtab = true -- Use spaces by default
opt.shiftwidth = 4 -- Set amount of space characters, when we press "<" or ">"
opt.tabstop = 2 -- 1 tab equal to so much spaces.
opt.smartindent = true -- Turn on smart indentation. See in the docs for more info
-- }}}

-- Clipboard {{{
-- opt.clipboard = 'unnamed' -- Use system clipboard
opt.fixeol = true -- Turn on appending new line in the end of a file
-- }}}

-- Folding {{{
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = true
opt.foldnestmax = 3
opt.foldlevelstart = 99
-- }}}

-- Search {{{
opt.ignorecase = true -- Ignore case if all characters in lower case
opt.joinspaces = false -- Join multiple spaces in search
opt.smartcase = true -- When there is a one capital letter search for exact match
opt.showmatch = true -- Highlight search instances
opt.hlsearch = false
-- }}}

-- Window {{{
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new vertical splits to right
-- }}}

-- Wild Menu {{{
opt.wildmenu = true
opt.wildmode = "longest:full,full"
-- }}}

-- wrap {{{
opt.wrap = false
opt.termguicolors = true
-- }}}

-- others {{{
opt.formatoptions = "jcroqlnt" -- default: tcqj
opt.spelllang = { "en" }
g.editorconfig = false -- do not interfere with editorconfig plugin
-- }}}

-- providers {{{
g["python3_host_prog"] = vim.fn.stdpath("config") .. "/provider/python/bin/python3"
g["node_host_prog"] = vim.fn.stdpath("config") .. "/provider/node/node_modules/neovim/bin/cli.js"
-- }}}

-- Default Plugins {{{
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end
-- }}}

-- vim: tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=1
