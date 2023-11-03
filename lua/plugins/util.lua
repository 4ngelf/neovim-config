--[[
  Module: plugins.util
  Description: Group of dependencies and utility plugins
]]

return {
  -- Discord Rich precense
  -- presence.nvim {{{
  {
    "andweeb/presence.nvim",
    opts = {
      -- General options
      auto_update = true,
      neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
      main_image = "file", -- Main image display (either "neovim" or "file")
      blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
      -- TODO: Consider making button for github.com/4ngelf
      buttons = false, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
      show_time = true,

      -- Rich Presence text options
      editing_text = function(filename) -- string or function(filename: string): string
        local split_path = vim.split(filename:lower(), ".", { plain = true })
        local ext = split_path[#split_path]
        return "Editing ." .. ext .. " file"
      end,
      file_explorer_text = "Browsing files", -- string or function(file_explorer_name: string): string
      git_commit_text = "Committing changes", -- string or function(filename: string): string
      reading_text = "Reading", -- string or function(filename: string): string
      workspace_text = "Working on repository", -- string or function(project_name: string|nil, filename: string): string
    },
  },
  -- }}}

  -- Utility functions
  -- Plenary {{{
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  -- }}}

  -- Pretty icons for tuis
  -- nvim-web-devicons {{{
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  -- }}}
}

-- vim: foldmethod=marker foldmarker={{{,}}}
