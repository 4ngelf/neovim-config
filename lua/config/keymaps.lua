--[[
  File: config/keymap.lua
  Description: Keymap definitions
]]

WHICH_KEY_MAPS_GROUPS = {

  -- Normal mode commands
  {
    mode = "n",
    noremap = true,

    ["<C-h>"] = { "<C-w>h", "Go to left window", noremap = false },
    ["<C-j>"] = { "<C-w>j", "Go to lower window", noremap = false },
    ["<C-k>"] = { "<C-w>k", "Go to upper window", noremap = false },
    ["<C-l>"] = { "<C-w>l", "Go to right window", noremap = false },

    ["<C-Up>"] = { "<cmd>resize +2<cr>", "Increase window height" },
    ["<C-Down>"] = { "<cmd>resize -2<cr>", "Decrease window height" },
    ["<C-Left>"] = { "<cmd>vertical resize -2<cr>", "Decrease window width" },
    ["<C-Right>"] = { "<cmd>vertical resize +2<cr>", "Increase window width" },

    ["<leader><tab>"] = {
      name = "+tabs",
      ["<tab>"] = { "<cmd>tabnew<cr>", "New tab" },
      ["d"] = { "<cmd>tabclose<cr>", "Close tab" },
      ["f"] = { "<cmd>tabfirst<cr>", "Go to first tab" },
      ["l"] = { "<cmd>tablast<cr>", "Go to last tab" },
      ["]"] = { "<cmd>tabnext<cr>", "Go to next tab" },
      ["["] = { "<cmd>tabprevious<cr>", "Go to previous tab" },
    },

    ["J"] = { "mzJ`z", "Join lines without moving the cursor" },
    ["<C-u>"] = { "<C-u>zz", "Scroll up with cursor in the middle" },
    ["<C-d>"] = { "<C-d>zz", "Scroll down with cursor in the middle" },
    ["n"] = { "nzz", "Next find with cursor in the middle" },
    ["N"] = { "Nzz", "Previous find with cursor in the middle" },

    ["<leader>S"] = {
      [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
      "Sustitute all coincidences with word under cursor",
    },

    ["<leader>z"] = { name = "+fold" },
    ["<leader>zo"] = { "zx<cmd>set foldlevel=99<CR>", "Open all folds" },
    ["<leader>zc"] = {
      function()
        local win = vim.api.nvim_get_current_win()
        vim.wo[win].foldmethod = vim.wo[win].foldmethod
        vim.wo[win].foldlevel = vim.wo[win].foldmethod == "marker" and 0 or 1
      end,
      "Close all folds",
    },

    ["<leader>c"] = {
      function()
        vim.fn.setreg("", vim.fn.getreg("+"))
      end,
      "Set system clipboard on neovim",
    },
    ["<leader>C"] = {
      function()
        vim.fn.setreg("+", vim.fn.getreg(""))
      end,
      "Set neovim clipboard on system",
    },

    ["<leader>hl"] = {
      function()
        local bufn = vim.api.nvim_get_current_buf()
        local language = vim.fn.input("treesitter-highlighting: ")
        vim.treesitter.stop(bufn)
        vim.treesitter.start(bufn, language)
      end,
      "Change treesitter highlighting",
    },

    ["<leader>X"] = { "<CMD>!$(realpath %)<CR>", "Run current editing file" },
  },

  -- visual mode keymaps
  {
    mode = "v",
    noremap = true,
    ["J"] = { ":m '>+1<CR>gv", "Move selected line Down" },
    ["K"] = { ":m '<-2<CR>gv", "Move selected line Up" },

    ["<"] = { "<gv", "Better left indenting" },
    [">"] = { ">gv", "Better right indenting" },
  },
}

-- vim:foldmethod=marker foldmarker={{{,}}} foldlevel=0
