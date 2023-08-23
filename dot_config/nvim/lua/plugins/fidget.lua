--[[
  File: fidget.lua
  Description: Standalone UI for nvim-lsp progress
  See: https://github.com/j-hui/fidget.nvim
]]

local M = {
  'j-hui/fidget.nvim',
  tag = 'legacy',
  event = 'LspAttach',
}

function M.config()
  require('fidget').setup {
    window = {
      blend = 0,
    },
  }
end

return M