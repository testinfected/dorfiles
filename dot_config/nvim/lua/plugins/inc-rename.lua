--[[
  File: inc-rename.lua
  Description: Incremental LSP renaming with preview
  See: https://github.com/smjonas/inc-rename.nvim
]]

local M = {
  'smjonas/inc-rename.nvim',
  event = 'LspAttach'
}

function M.config()
  require('inc_rename').setup()
end

return M
