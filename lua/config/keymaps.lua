--[[
  File: config/keymap.lua
  Description: Keymap definitions
]]

WHICH_KEY_MAPS_GROUPS = {

  -- Normal mode commands
  {
    mode = "n",
    noremap = true,
    ["J"] = { "mzJ`z", "Join lines without moving the cursor" },
    ["<C-u>"] = { "<C-u>zz", "Scroll up with cursor in the middle" },
    ["<C-d>"] = { "<C-d>zz", "Scroll down with cursor in the middle" },
    ["n"] = { "nzz", "Next find with cursor in the middle" },
    ["N"] = { "Nzz", "Previous find with cursor in the middle" },

    ["<leader>S"] = {
      [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
      "Sustitute all coincidences with word under cursor",
    },
    ["<leader>zo"] = { "<cmd>%foldopen<CR>", "Open all folds" },
    ["<leader>zc"] = { "<cmd>%foldclose<CR>", "Close all folds" },

    ["<leader>hl"] = {
      function()
        local bufn = vim.api.nvim_get_current_buf()
        local language = vim.fn.input("treesitter-highlighting: ")
        vim.treesitter.stop(bufn)
        vim.treesitter.start(bufn, language)
      end,
      "Change treesitter highlighting",
    },
  },

  -- visual mode keymaps
  {
    mode = "v",
    noremap = true,
    ["J"] = { ":m '>+1<CR>gv", "Move selected line Down" },
    ["K"] = { ":m '<-2<CR>gv", "Move selected line Up" },
  },
}

--TODO: Improve clipboard management
-- nm("<leader>p", '"+p') -- paste forward with system clipboard
-- nm("<leader>P", '"+P') -- paste backward with system clipboard
-- nm("<leader>y", '"+y') -- Yank forward with system clipboard
-- nm("<leader>Y", '"+Y') -- Yank backward with system clipboard
-- vm("<leader>y", '"+y') -- Copy selected text into system clipboard

-- nm("<leader>xx", "<cmd>silent !chmod +x %<CR>") -- Make current editing file executable
-- nm("<leader>x", "<cmd>!$(realpath %)<CR>") -- Run current editing file

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
