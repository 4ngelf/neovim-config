--[[
  Module: plugins.ui
  Description: Modifications of default UI like lualine, bufferline, etc
]]
return {
  -- Better bottom status line
  -- lualine {{{
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      "nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({
        options = {
          theme = DEFAULT_COLORSCHEME,
        },
      })
    end,
  },
  -- }}}

  -- Git blame
  -- gitsigns {{{
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost" },
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          -- 'eol' | 'overlay' | 'right_align'
          virt_text_pos = "right_align",
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
      })
    end,
  },
  -- }}}

  -- Hex codes colorized
  -- nvim-colorizer {{{
  {
    "norcalli/nvim-colorizer.lua",
    version = "*",
    main = "colorizer",
    opts = {
      ["*"] = { mode = "background" },
      ["lua"] = { mode = "foreground" },
      ["python"] = { mode = "foreground" },
      ["rust"] = { mode = "foreground" },
      ["css"] = { rgb_fn = true },
      ["html"] = { names = false },
    },
    config = true,
  },
  -- }}}

  -- Blankline
  -- indent-blankline {{{
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = {
        highlight = "iblContext",
      },
      exclude = {
        filetypes = {
          "lspinfo",
          "packer",
          "checkhealth",
          "help",
          "man",
          "gitcommit",
          "TelescopePrompt",
          "TelescopeResults",
          "dashboard",
          "text",
          "''",
        },
      },
    },
    config = function(_, opts)
      vim.api.nvim_set_hl(0, "iblContext", { fg = "#5865F2" })
      require("ibl").setup(opts)
    end,
  },
  -- }}}

  -- Startup screen
  -- dashboard-nvim {{{
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-web-devicons" },
    main = "dashboard",
    opts = function()
      local fd = function(cwd)
        return function()
          cwd = cwd or "."
          vim.fn.chdir(cwd)
          require("telescope.builtin").find_files({
            cwd = cwd,
            find_command = { "rg", "--iglob", "!.git", "--hidden", "--files" },
          })
        end
      end

      local function footer()
        local quote = require("util.dashboard").get_quote()
        return {
          "",
          quote[1] or "",
          quote[2] or "",
          "",
          "cwd:[" .. vim.fn.getcwd() .. "]",
        }
      end

      return {
        ---@type "hyper"|"doom"
        theme = "hyper",
        ---@type "letter"|"number"
        shortcut_type = "letter",
        change_to_vcs_root = true,
        hide = {
          statusline = true,
          tabline = true,
          winbar = true,
        },
        config = {
          header = {
            "",
            "  ██╗    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗ ██╗███╗   ███╗    ██╗      ██╗ ████╗ ██╗",
            " ██╔╝    ████╗  ██║██╔════╝██╔═████╗██║   ██║███║████╗ ████║    ╚██╗     ████████████║",
            "██╔╝     ██╔██╗ ██║█████╗  ██║██╔██║██║   ██║╚██║██╔████╔██║     ╚██╗    ████████████║",
            "╚██╗     ██║╚██╗██║██╔══╝  ████╔╝██║╚██╗ ██╔╝ ██║██║╚██╔╝██║     ██╔╝     ╚████████╔═╝",
            " ╚██╗    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝  ██║██║ ╚═╝ ██║    ██╔╝     ████████████╗",
            "  ╚═╝    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝   ╚═╝╚═╝     ╚═╝    ╚═╝      ╚═══════════╝",
            "",
          },
          disable_move = true,
          shortcut = {
            -- action can be a function type
            { desc = " update", group = "DashboardUpdate", key = "u", action = "Lazy update" },
            { desc = " profiler", group = "DashboardProfiler", key = "p", action = "Lazy profile" },
            { desc = " files", group = "DashboardFindfiles", key = "f", action = fd() },
            {
              desc = " nvim-conf",
              group = "DashboardNvimConfig",
              key = "n",
              action = fd(vim.fn.stdpath("config")),
            },
            { desc = " dotfiles", group = "DashboardDotFiles", key = "d", action = fd(DOTFILES_DIR) },
          },
          packages = { enable = false },
          project = {
            enable = true,
            limit = 6,
            icon = " ",
            label = " Last projects",
            action = fd(),
          },
          mru = { limit = 4, icon = " ", label = " Most recent files" },
          footer = footer(),
        },
      }
    end,
    config = function(_, opts)
      require("dashboard").setup(opts)

      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#a6d189" })
      vim.api.nvim_set_hl(0, "DashboardMruTitle", { fg = "#8caaee" })
      vim.api.nvim_set_hl(0, "DashboardProjectTitle", { fg = "#8caaee" })
      vim.api.nvim_set_hl(0, "DashboardFiles", { fg = "#838ba7" })
      vim.api.nvim_set_hl(0, "DashboardShortCut", { fg = "#ca9ee6", bold = true })
      vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#e5c890" })

      vim.api.nvim_set_hl(0, "DashboardUpdate", { fg = "#babbf1", bold = true })
      vim.api.nvim_set_hl(0, "DashboardProfiler", { fg = "#ca9ee6", bold = true })
      vim.api.nvim_set_hl(0, "DashboardFindfiles", { fg = "#33A5C8", bold = true })
      vim.api.nvim_set_hl(0, "DashboardNvimConfig", { fg = "#719a56", bold = true })
      vim.api.nvim_set_hl(0, "DashboardDotFiles", { fg = "#e78284", bold = true })
    end,
  },
  -- }}}

  -- Improve ui components
  -- dressing.nvim {{{
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  --}}}
}
-- vim:foldmethod=marker foldmarker={{{,}}} foldlevel=0
