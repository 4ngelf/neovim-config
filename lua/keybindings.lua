require("helpers/globals")
require("helpers/keyboard")

g.mapleader = " " -- Use Space, like key for alternative hotkeys

-- Normal mode {{{
nm("J", "mzJ`z") -- Join Lines without moving the cursor
nm("<C-u>", "<C-u>zz") -- Scroll up with cursor in the middle
nm("<C-d>", "<C-d>zz") -- Scroll down with cursor in the middle
nm("n", "nzz") -- Next find with cursor in the middle
nm("N", "Nzz") -- Previous find with cursor in the middle

-- System clipboard {{{
nm("<leader>d", '"+d') -- delete forward with system clipboard
nm("<leader>D", '"+D') -- delete backward with system clipboard
nm("<leader>p", '"+p') -- paste forward with system clipboard
nm("<leader>P", '"+P') -- paste backward with system clipboard
nm("<leader>y", '"+y') -- Yank forward with system clipboard
nm("<leader>Y", '"+Y') -- Yank backward with system clipboard
--- }}}

-- Complex operations {{{
nm("<leader>F", function() -- Format buffer with Formatter
  lsp.buf.format()
end)

-- Sustitute all coincidences with word under cursor
nm("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
nm("<leader>xx", "<cmd>silent !chmod +x %<CR>") -- Make current file executable

nm("<leader>zo", "<cmd>%foldopen<CR>") -- Open all folds
nm("<leader>zc", "<cmd>%foldclose<CR>") -- Close all folds

nm("<leader>hl", function () -- Change treesitter highlighting 
  local bufn = vim.fn.bufnr("%")
  local language = vim.fn.input("treesitter-highlighting: ")
  vim.treesitter.stop(bufn)
  vim.treesitter.start(bufn, language)
end)
--- }}}

-- }}}

-- Visual mode {{{
vm('<leader>y', '"+y')   -- Copy selected text into system clipboard

vm("J", ":m '>+1<CR>gv") -- Move selected line Down
vm("K", ":m '<-2<CR>gv") -- Move selected line Up
-- }}}

-- LSP {{{
nm("K", "<cmd>lua vim.lsp.buf.hover()<CR>") -- Hover object
nm("ga", "<cmd>lua vim.lsp.buf.code_action()<CR>") -- Code actions
nm("gR", "<cmd>lua vim.lsp.buf.rename()<CR>") -- Rename an object
nm("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>") -- Go to declaration
-- }}}

-- Telescope {{{
nm("gd", "<cmd>Telescope lsp_definitions<CR>") -- Goto declaration
nm("<leader>f", function() -- Search for a file (ignoring .gitignore)
  local items = fn.systemlist("fd -H -I -E '/.git' -tf")
  table.sort(items, function(a, b)
    return a > b
  end)
  require("telescope.builtin").find_files({ search_dirs = items })
end)

nm("<leader>ff", function() -- Search for a file in project (with .gitignore)
  local items = fn.systemlist("fd -H -E '/.git' -tf | head -n 4000")
  table.sort(items, function(a, b)
    return a > b
  end)
  require("telescope.builtin").find_files({ search_dirs = items })
end)

nm("<leader>fb", "<cmd>Telescope git_branches<CR>") -- Show git branches
nm("<leader>fg", "<cmd>Telescope live_grep<CR>") -- Find a string in project
nm("<leader>fd", "<cmd>Telescope diagnostics<CR>") -- Show diagnostics
nm("<leader>fa", "<cmd>Telescope<CR>") -- Show all commands

-- nm('<leader>p', '<cmd>Telescope oldfiles<CR>')                                -- Show recent files
-- nm('<leader>i', '<cmd>Telescope jumplist<CR>')                                -- Show jumplist (previous locations)
-- nm('<leader>q', '<cmd>Telescope buffers<CR>')                                 -- Show all buffers
-- nm('<leader>t', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')           -- Search for dynamic symbols
-- }}}

-- Neogit {{{
nm("<leader>ng", "<cmd>Neogit<CR>") -- Open Neogit
-- }}}

-- Trouble {{{
nm("gr", "<cmd>TroubleToggle<CR>") -- Show all problems in project (with help of LSP)
-- }}}

-- Neo Tree {{{
nm("<leader>nt", "<cmd>Neotree focus toggle<CR>") -- Toggle file explorer
-- }}}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
