--[[
  File: neotree.lua
  Description: Browse the file system and other tree like structures
  See: https://github.com/nvim-neo-tree/neo-tree.nvim
]]

local M = {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    -- Lua functions you don't want to write twice
    'nvim-lua/plenary.nvim',
    -- UI Component Library for Neovim
    'MunifTanjim/nui.nvim',
  },
  keys = {
    { '<leader>e', [[<Cmd>Neotree toggle<CR>]], desc = "File explorer" }
  }
}

function M.config()
  local neo_tree = require('neo-tree')

  neo_tree.setup {
    -- defaults are fine
  }
end

return M
