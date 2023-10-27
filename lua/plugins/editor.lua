--[[
  Module: plugins.editor
  Description: Plugins for TUIs like telescope, neogit, etc
]]

return {
  -- Fuzzy finder
  -- Telescope {{{
  {
    "nvim-telescope/telescope.nvim",
    version = "^0.1.2",
    cmd = "Telescope",
    dependencies = {
      "plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { "<leader>fa", "<cmd>Telescope<CR>", desc = "Telescope commands" },
      {
        "<leader>ff",
        "<cmd>Telescope find_files find_command=rg,--iglob,!.git,--hidden,--files<CR>",
        desc = "Find files (.gitignore)",
      },
      {
        "<leader>fF",
        "<cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files<CR>",
        desc = "Find all files",
      },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>fr", "<cmd>Telescope lsp_references<CR>", desc = "Find references" },
      { "<leader>fc", "<cmd>Telescope colorscheme enable_preview=true<CR>", desc = "Preview colorschemes" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        extensions = {},
      })

      telescope.load_extension("fzf")
    end,
  },
  --- }}}

  -- Keymap legend and manager
  -- which-key {{{
  {
    "folke/which-key.nvim",
    version = "^1.6.0",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1000
    end,
    opts = {
      plugins = {},
      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gs"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>u"] = { name = "+ui" },
        -- ["<leader><tab>"] = { name = "+tabs" },
        -- ["<leader>b"] = { name = "+buffer" },
        -- ["<leader>g"] = { name = "+git" },
        -- ["<leader>gh"] = { name = "+hunks" },
        -- ["<leader>q"] = { name = "+quit/session" },
        -- ["<leader>s"] = { name = "+search" },
        -- ["<leader>w"] = { name = "+windows" },
        -- ["<leader>x"] = { name = "+diagnostics/quickfix" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
  -- }}}

  -- Better list diagnostics
  -- Trouble {{{
  {
    "folke/trouble.nvim",
    version = "^2.10.0",
    dependencies = {
      "nvim-web-devicons",
    },
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      -- { "gr", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "gr", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    },
  },
  -- }}}

  -- Better git manipulation
  -- Neogit {{{
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit", "NeogitMessages", "NeogitResetState" },
    keys = {
      { "<leader>ug", "<cmd>Neogit<CR>", desc = "Open Neogit" },
    },
    dependencies = {
      "plenary.nvim",
      "telescope.nvim",
      "sindrets/diffview.nvim",
    },
    config = true,
  },
  -- }}}
}

-- vim: foldmethod=marker foldmarker={{{,}}}
