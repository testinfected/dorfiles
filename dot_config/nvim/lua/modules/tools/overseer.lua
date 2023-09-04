--[[
  Description: Task runner and job management
  See: https://github.com/stevearc/overseer.nvim
]]

local M = {
  'stevearc/overseer.nvim',
  event = 'VeryLazy',
}

function M.config()
  require('overseer').setup {
  }
end

return M