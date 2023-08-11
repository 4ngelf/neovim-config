--[[
  File: neotree.lua
  Description: Configuration file for neotree
  Info: Use <zo> and <zc> to open and close foldings
  See: https://github.com/nvim-neo-tree/neo-tree.nvim/
]]

local neotree = require("neo-tree")

neotree.setup({
  close_if_last_window = true,
  name = {
    trailing_slash = true,
    use_git_status_colors = true,
    highlight = "NeoTreeFileName",
  },
  window = {
    width = 30,
    mappings = {
      ["l"] = "open",
      ["h"] = "close_node",
    }
  },
  filesystem = {
      filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = true,
      },
      follow_current_file = {
          enabled = true,
          leave_dirs_open = false
      },
  },
  event_handlers = {
      {
          event = "file_opened",
          handler = function(file_path)
              -- auto close
              -- vimc.cmd("Neotree close")
              -- OR
              require("neo-tree.command").execute({ action = "close" })
          end
      },
  },
})

