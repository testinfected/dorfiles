--[[
  File: ufo.lua
  Description: Modern looking folds
  See: https://github.com/kevinhwang91/nvim-ufo
]]

local M = {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async'
  },
  event = 'BufEnter'
}

function M.config()
  local ufo = require('ufo')

  vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  vim.o.foldcolumn = '1' -- '0' is not bad
  vim.o.foldlevel = 99 -- start with all folds opened
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true
  vim.o.foldmethod = 'syntax'

  ufo.setup {
    open_fold_hl_timeout = 150,
    close_fold_kinds = { 'imports', 'comment' },
    preview = {
      win_config = {
        border = 'rounded',
        winhighlight = 'Normal:Folded',
        winblend = 0
      },
      mappings = {
        scrollU = '<C-u>',
        scrollD = '<C-d>',
        jumpTop = '[',
        jumpBot = ']'
      }
    },
  }

  local map = vim.keymap.set
  map('n', 'zR', ufo.openAllFolds)
  map('n', 'zM', ufo.closeAllFolds)
  map('n', 'zr', ufo.openFoldsExceptKinds)
  map('n', 'zm', ufo.closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
end

return M