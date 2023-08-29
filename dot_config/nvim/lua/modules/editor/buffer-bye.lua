--[[
  File: buffer-by.lua
  Description: Close buffers but not windows
  See: https://github.com/moll/vim-bbye
]]

local M = {
  'moll/vim-bbye',
  event = { 'BufEnter' }
}

function M.config()
  vim.keymap.set('n', '<leader>q', [[<Cmd>Bdelete<CR>]], { desc = "Delete buffer" })
end

return M