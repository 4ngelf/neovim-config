require "helpers/globals"
require "helpers/keyboard"

g.mapleader = ' '                                                                 -- Use Space, like key for alternative hotkeys

-- LSP {{{
nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>' )                                      -- Hover object
nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')                                -- Code actions
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')                                     -- Rename an object
nm('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')                                -- Go to declaration
-- }}}

-- Telescope {{{
nm('gd', '<cmd>Telescope lsp_definitions<CR>')                                   -- Goto declaration
nm('<leader>ff', '<cmd>Telescope git_files<CR>')                                 -- Search for a file in project
nm('<leader>fF', '<cmd>Telescope find_files<CR>')                                -- Search for a file (ignoring git-ignore)
nm('<leader>fb', '<cmd>Telescope git_branches<CR>')                              -- Show git branches
nm('<leader>fg', '<cmd>Telescope live_grep<CR>')                                 -- Find a string in project
nm('<leader>a', '<cmd>Telescope<CR>')                                            -- Show all commands
-- nm('<leader>p', '<cmd>Telescope oldfiles<CR>')                                -- Show recent files
-- nm('<leader>i', '<cmd>Telescope jumplist<CR>')                                -- Show jumplist (previous locations)
-- nm('<leader>q', '<cmd>Telescope buffers<CR>')                                 -- Show all buffers
-- nm('<leader>t', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')           -- Search for dynamic symbols
-- }}}

-- Trouble {{{
nm('<leader>x', '<cmd>TroubleToggle<CR>')                                         -- Show all problems in project (with help of LSP)
nm('gr', '<cmd>Trouble lsp_references<CR>')                                       -- Show use of object in project
-- }}}

-- Normal mode {{{
nm("J", "mzJ`z")
nm("<C-u>", "<C-u>zz")
nm("<C-d>", "<C-d>zz")
nm("n", "nzz")
nm("N", "Nzz")

-- }}}

-- Visual mode {{{
vm("J", ":m '>+1<CR>gv")
vm("K", ":m '<-2<CR>gv")
-- }}}

-- Neo Tree {{{ 
-- nm('<leader>v', '<cmd>NeoTreeFocusToggle<CR>')                                        -- Toggle file explorer
-- }}}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
