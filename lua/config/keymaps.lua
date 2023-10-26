
cmd = vim.cmd -- Command function
api = vim.api -- Neovim API
lsp = vim.lsp -- LSP API
fn = vim.fn -- Vim function
g = vim.g -- Vim globals
opt = vim.opt -- Vim optionals


-- Alias for function, that set new keybindings
local map = vim.keymap.set

-- Normal mode keybinding setter
function nm(key, command)
  map("n", key, command, { noremap = true })
end

-- Input mode keybinding setter
function im(key, command)
  map("i", key, command, { noremap = true })
end

-- Visual mode keybinding setter
function vm(key, command)
  map("v", key, command, { noremap = true })
end

-- Terminal mode keybinding setter
function tm(key, command)
  map("t", key, command, { noremap = true })
end


-- Normal mode {{{
nm("J", "mzJ`z")       -- Join Lines without moving the cursor
nm("<C-u>", "<C-u>zz") -- Scroll up with cursor in the middle
nm("<C-d>", "<C-d>zz") -- Scroll down with cursor in the middle
nm("n", "nzz")         -- Next find with cursor in the middle
nm("N", "Nzz")         -- Previous find with cursor in the middle

-- System clipboard {{{
nm("<leader>p", '"+p') -- paste forward with system clipboard
nm("<leader>P", '"+P') -- paste backward with system clipboard
nm("<leader>y", '"+y') -- Yank forward with system clipboard
nm("<leader>Y", '"+Y') -- Yank backward with system clipboard
--- }}}

-- Complex operations {{{
nm("<leader>F", lsp.buf.format) -- Format buffer with Formatter

nm("<leader>s", lsp.buf.rename)  -- Substitute all references under cursor
-- Sustitute all coincidences with word under cursor
nm("<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

nm("<leader>xx", "<cmd>silent !chmod +x %<CR>") -- Make current editing file executable
nm("<leader>x", "<cmd>!$(realpath %)<CR>")                  -- Run current editing file

nm("<leader>zo", "<cmd>%foldopen<CR>")          -- Open all folds
nm("<leader>zc", "<cmd>%foldclose<CR>")         -- Close all folds

nm("<leader>hl", function()                     -- Change treesitter highlighting
  local bufn = vim.api.nvim_get_current_buf()
  local language = vim.fn.input("treesitter-highlighting: ")
  vim.treesitter.stop(bufn)
  vim.treesitter.start(bufn, language)
end)
--- }}}

-- }}}

-- Visual mode {{{
vm("<leader>y", '"+y')   -- Copy selected text into system clipboard

vm("J", ":m '>+1<CR>gv") -- Move selected line Down
vm("K", ":m '<-2<CR>gv") -- Move selected line Up
-- }}}

-- LSP {{{
nm("K", "<cmd>lua vim.lsp.buf.hover()<CR>")        -- Hover object
nm("ga", "<cmd>lua vim.lsp.buf.code_action()<CR>") -- Code actions
nm("gR", "<cmd>lua vim.lsp.buf.rename()<CR>")      -- Rename an object
nm("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>") -- Go to declaration
-- }}}
-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0