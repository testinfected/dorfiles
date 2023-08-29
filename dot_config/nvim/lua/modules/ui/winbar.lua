--[[
  File: barbecue.lua
  Description: LSP-aware winbar
  See: https://github.com/utilyre/barbecue.nvim
]]

local M = {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons',
  },
  event = 'BufEnter'
}

function M.config()
  require('barbecue').setup {
    theme = 'catppuccin',
    kinds = require('config.icons').kind
  }
end

return M