--[[
  File: neotree.lua
  Description: Browse the file system and other tree like structures
  See: https://github.com/nvim-neo-tree/neo-tree.nvim
]]

local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    -- Lua functions you don't want to write twice
    "nvim-lua/plenary.nvim",
    -- UI Component Library for Neovim
    "MunifTanjim/nui.nvim",
  },
  event = 'VeryLazy'
}

local function register_keybindings()
  local keys = require "core.utils".keys
  keys.register {
    ['<leader>e'] = { '<cmd>Neotree toggle<CR>', "File explorer" }
  }
end

function M.config()
  local neo_tree = require "neo-tree"

  neo_tree.setup{
    close_if_last_window = true,
    name = {
      trailing_slash = true,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName",
    },
    window = {
      width = 50,
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
      }
    },
    filesystem = {
      follow_current_file = true,
    },
  }

  register_keybindings()
end

return M
