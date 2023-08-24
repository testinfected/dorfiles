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
  event = 'Bufenter'
}

function M.config()
  require('barbecue').setup {
    create_autocmd = false, -- prevent barbecue from updating itself automatically
    theme = 'catppuccin',
    kinds = require('core.icons').kind
  }

  vim.api.nvim_create_autocmd({
    'WinResized',
    'BufWinEnter',
    'CursorHold',
    'InsertLeave',
  }, {
    group = vim.api.nvim_create_augroup('barbecue.updater', {}),
    callback = function()
      require('barbecue.ui').update()
    end,
  })
end

return M