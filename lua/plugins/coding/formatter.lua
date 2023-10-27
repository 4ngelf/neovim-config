--[[
  module: plugins.coding.formatter
  description: all plugins and configuration related to formatters (language server protocol)
]]

return {

  -- Performant formatting
  -- conform {{{
  {
    "stevearc/conform.nvim",
    version = "^4.0.0",
    event = "BufWritePre",
    keys = {
      {
        "<leader>F",
        function()
          require("conform").format()
        end,
        desc = "Format document",
      },
    },
    opts = {},
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = { "isort", "black" },
          -- Use a sub-list to run only the first available formatter
          javascript = { { "prettierd", "prettier" } },
        },
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },
  -- }}}

  -- Minimum rules between editors
  -- editorconfig {{{
  {
    "editorconfig/editorconfig-vim",
    lazy = false,
  },
  -- }}}
}

-- vim: foldmethod=marker foldmarker={{{,}}}
