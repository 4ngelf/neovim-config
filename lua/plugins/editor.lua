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
                local term = vim.api.nvim_open_term(bufnr, {})
                local function send_output(_, data, _)
                  for _, d in ipairs(data) do
                    vim.api.nvim_chan_send(term, d .. "\r\n")
                  end
                end
                local h = vim.api.nvim_win_get_height(opts.winid)
                local w = vim.api.nvim_win_get_width(opts.winid)
                vim.fn.jobstart({
                  "chafa",
                  "--size=" .. w .. "x" .. h,
                  filepath,
                }, { on_stdout = send_output, stdout_buffered = true, pty = true })
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
        ["ys"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>u"] = {
          name = "+ui",
          mode = "n",
          l = { "<cmd>Lazy<CR>", "Lazy.nvim" },
        },
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
    cmd = { "TodoTrouble" },
    keys = {
      { "<leader>ut", "<CMD>TodoTrouble<CR>", desc = "TODO comments (Trouble)" },
    },
    dependencies = {
      "plenary.nvim",
      "trouble.nvim",
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
}

-- vim: foldmethod=marker foldmarker={{{,}}} foldlevelstart=1
