--[[
  File: dressing.lua
  Description: Improved vim.ui interfaces
  See: https://github.com/goolord/alpha-nvim
]]

local M = {
  'stevearc/dressing.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim'
  },
  event = 'VeryLazy'
}

function M.config()
  require('dressing').setup {
    input = {
      -- Default prompt string
      default_prompt = '>',

      -- Can be 'left', 'right', or 'center'
      title_pos = 'left',

      -- These are passed to nvim_open_win
      border = 'rounded',
      -- 'editor' and 'win' will default to being centered
      relative = 'cursor',

      max_width = { 140, 0.9 },
      min_width = { 20, 0.2 },

      win_options = {
        -- Window transparency (0-100)
        winblend = 0,
        -- Disable line wrapping
        wrap = false,
        -- Indicator for when text exceeds window
        list = true,
        listchars = 'precedes:…,extends:…',
        -- Increase this for more context when text scrolls off the window
        sidescrolloff = 0,
      },

      -- Set to `false` to disable
      mappings = {
        n = {
          ['<Esc>'] = 'Close',
          ['<CR>'] = 'Confirm',
        },
        i = {
          ['<C-c>'] = 'Close',
          ['<CR>'] = 'Confirm',
          ['<Up>'] = 'HistoryPrev',
          ['<Down>'] = 'HistoryNext',
        },
      },
    },
    select = {
      backend = { 'telescope' },

      -- Trim trailing `:` from prompt
      trim_prompt = true,

      -- Options for telescope selector
      -- These are passed into the telescope picker directly. Can be used like:
      -- telescope = require('telescope.themes').get_ivy({...})
      telescope = require('telescope.themes').get_dropdown(),
    },
  }
end

return M