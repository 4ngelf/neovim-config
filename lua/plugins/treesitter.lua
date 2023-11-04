--[[
  Module: plugins.treesitter
  Description: Plugins for TUIs like telescope, neogit, etc
]]

return {
  -- Optimized syntax parser
  -- treesitter {{{
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      ---@diagnostic disable-next-line:missing-fields
      require("nvim-treesitter.configs").setup({
        -- modules = {},
        ensure_installed = {
          "bash",
          "c",
          "c_sharp",
          "go",
          "html",
          "javascript",
          "json",
          "lua",
          "luadoc",
          "markdown",
          "python",
          "rust",
          "toml",
          "typescript",
          "yaml",
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = false,

        -- List of parsers to ignore installing (or "all")
        ignore_install = {},

        highlight = {
          enable = true,

          -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
          -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
          -- the name of the parser)
          -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
          disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
      })
    end,
  },
  -- }}}
}
-- vim:foldmethod=marker foldmarker={{{,}}} foldlevel=0
