--[[
  File: fold-preview.lua
  Description: Preview folds in float window
  See: https://github.com/anuvyklack/fold-preview.nvim
]]

local M = {
  'anuvyklack/fold-preview.nvim',
  dependencies = {
    'anuvyklack/keymap-amend.nvim',
  },
  event = 'BufEnter'
}

function M.config()
  require('fold-preview').setup {
    -- Your configuration goes here.
  }
end

return M