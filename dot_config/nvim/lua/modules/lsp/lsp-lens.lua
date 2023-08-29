--[[
  File: lsp-lens.lua
  Description: Display reference and definition info upon functions
  See: https://github.com/neovim/nvim-lspconfig
]]

local M = {
  'VidocqH/lsp-lens.nvim',
  event = 'BufEnter',
}

function M.config()
  require('lsp-lens').setup {
    enable = true,
    include_declaration = false,      -- Reference include declaration
    sections = {                      -- Enable / Disable specific request
      definition = false,
      references = true,
      implements = true,
    },
    ignore_filetype = {
    },
  }
end

return M
