--[[
  File: symbols-outline.lua
  Description: tree like view for symbols using LSP
  See: https://github.com/simrat39/symbols-outline.nvim
]]

local M = {
    'simrat39/symbols-outline.nvim',
    keys = {
        { '<leader>co', '<Cmd>SymbolsOutline<CR>', desc = "Symbols outline" }
    }
}

function M.config()
    require("symbols-outline").setup {
    }
end

return M