--[[
  File: toggleterm.lua
  Description: Easily manage multiple terminal window
  See: https://github.com/akinsho/toggleterm.nvim
]]


local M = {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
}

function M.config()
  local toggleterm = require('toggleterm')
  toggleterm.setup {
    open_mapping = [[<leader>\]],
    direction = 'float',
    shade_terminals = true,
    float_opts = {
      border = 'curved'
    }
  }

  -- Keymaps
  local keys = require('core.utils').keys
  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }
  keys.nmap('<leader>gc', function() lazygit:toggle() end, { desc = "Commit" })
end

return M
