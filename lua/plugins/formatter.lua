--[[
  module: plugins.formatter
  description: all plugins and configuration related to formatters (language server protocol)
]]

return {

  -- Performant formatting
  -- conform {{{
  {
    "stevearc/conform.nvim",
    version = "^4.0.0",
    cmd = "ConformInfo",
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
          python = { { "ruff_format", "black" } },
          javascript = { { "prettierd", "prettier" } },
          ["*"] = { "codespell" },
        },
        format_after_save = {
          -- These options will be passed to conform.format()
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
-- vim:foldmethod=marker foldmarker={{{,}}} foldlevel=0
