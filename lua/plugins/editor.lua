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
      -- keys {{{
      { "<leader>fa", "<cmd>Telescope<CR>", desc = "Telescope commands" },
      {
        "<leader>ff",
        require("util.telescope").fd,
        -- "<cmd>Telescope find_files find_command=rg,--iglob,!.git,--hidden,--files<CR>",
        desc = "Find files (.gitignore)",
      },
      {
        "<leader>fF",
        require("util.telescope").fd_all,
        -- "<cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files<CR>",
        desc = "Find all files",
      },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>fr", "<cmd>Telescope lsp_references<CR>", desc = "Find references" },
      { "<leader>fc", "<cmd>Telescope colorscheme enable_preview=true<CR>", desc = "Preview colorschemes" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      -- }}}
    },
    config = function()
      -- config {{{
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          preview = {
            mime_hook = function(filepath, bufnr, opts)
              local is_image = function(path)
                local image_extensions = { "png", "jpg", "svg" } -- Supported image formats
                local split_path = vim.split(path:lower(), ".", { plain = true })
                local extension = split_path[#split_path]
                return vim.tbl_contains(image_extensions, extension)
              end
              if is_image(filepath) then
                require("util.telescope").image_previewer(filepath, bufnr, opts)
              else
                require("telescope.previewers.utils").set_preview_message(
                  bufnr,
                  opts.winid,
                  "Binary cannot be previewed"
                )
              end
            end,
          },
        },
        extensions = {},
      })

      telescope.load_extension("fzf")
      -- }}}
    end,
  },
  --- }}}

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
      { "<leader>uR", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>ur", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    },
  },
  -- }}}

  -- Listing TODO, FIX, NOTE comments
  -- todo-comments {{{
  {
    "folke/todo-comments.nvim",
    version = "^1.1.0",
    event = "BufReadPre",
    keys = {
      { "<leader>uT", "<CMD>TodoTrouble<CR>", desc = "TODO comments (Trouble)" },
    },
    dependencies = {
      "plenary.nvim",
    },
    config = true,
  },
  -- }}}

  -- Better git manipulation
  -- Neogit {{{
  {
    "NeogitOrg/neogit",
    commit = "69482aa8404bf8b4775110393c8248e784fccbf1",
    cmd = { "Neogit", "NeogitMessages", "NeogitResetState" },
    keys = {
      { "<leader>ug", "<cmd>Neogit<CR>", desc = "Neogit" },
    },
    dependencies = {
      "plenary.nvim",
      "telescope.nvim",
      "sindrets/diffview.nvim",
    },
    config = true,
  },
  -- }}}

  -- File explorer.
  -- NOTE: I chose nnn over neotree because nnn is my default terminal file explorer
  -- nnn {{{
  {
    "luukvbaal/nnn.nvim",
    cmd = { "NnnPicker" },
    keys = {
      { "<leader>un", "<cmd>NnnPicker<CR>", desc = "nnn file explorer" },
    },
    cond = function()
      if not vim.fn.executable("nnn") then
        vim.api.nvim_err_write("nnn executable not found on PATH")
        vim.api.nvim_err_writeln("See also: https://github.com/jarun/nnn")
        return false
      end
      return true
    end,
    config = function()
      require("nnn").setup({
        picker = {
          cmd = "nnn -H", -- command override (-p flag is implied)
          style = {
            width = 0.9, -- percentage relative to terminal size when < 1, absolute otherwise
            height = 0.8, -- ^
            xoffset = 0.5, -- ^
            yoffset = 0.5, -- ^
            border = "rounded", -- border decoration for example "rounded"(:h nvim_open_win)
          },
          session = "shared",
          tabs = false, -- separate nnn instance per tab
          fullscreen = false, -- whether to fullscreen picker window when current tab is empty
        },
      })
    end,
  },
  -- }}}

  -- Terminal toggler
  -- toggleterm.nvim {{{
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<leader>ut", "<cmd>ToggleTerm direction=float name=vimterm<CR>", desc = "Toggle terminal" },
    },
    opts = {
      close_on_exit = true,
      shell = vim.o.shell,
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      end,
      float_opts = {
        border = "rounded",
      },
      winbar = {
        enabled = true,
        name_formatter = function(t)
          return t.name
        end,
      },
    },
  },
  -- }}}
}
-- vim:foldmethod=marker foldmarker={{{,}}} foldlevel=0
