--[[
  File: plugins/extensions/nvim_treesitter.lua
  Description: Lazy configuration file nvim-treesitter
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/nvim-treesitter/nvim-treesitter
]]

local M = {}

M[1] = "nvim-treesitter/nvim-treesitter"
M.name = "nvim-treesitter"
M.lazy = false
M.build = ":TSUpdate"
M.event = { "BufReadPost", "BufNewFile" }
M.config = function()
  require("nvim-treesitter.configs").setup({

    -- Needed parsers
    ensure_installed = {
      -- spec formats
      "ini",
      "json",
      "yaml",
      "toml",
      "dockerfile",
      "html",
      "htmldjango",
      "css",
      "markdown",
      "gitignore",

      -- interpreted languages
      "bash",
      "lua",
      "typescript",
      "javascript",
      "python",

      -- systems languages
      "go",
      "c",
      "c_sharp",
      "rust",
    },

    -- Install all parsers synchronously
    sync_install = false,

    -- Highlighting
    highlight = {
      -- Enabling highlight for all files
      enable = true,
      disable = {},
    },

    indent = {
      -- Disabling indentation for all files
      enable = false,
      disable = { "python" },
    },
  })
end

return M
