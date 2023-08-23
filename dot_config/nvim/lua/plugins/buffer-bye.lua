--[[
  File: buffer-by.lua
  Description: Close buffers but not windows
  See: https://github.com/moll/vim-bbye
]]

local M = {
  'moll/vim-bbye',
  event = { 'Bufenter' }
}

function M.config()
  local keys = require('core.utils').keys
  keys.nmap('<leader>q', [[<Cmd>Bdelete<CR>]], { desc = "Delete buffer" })
end

return M