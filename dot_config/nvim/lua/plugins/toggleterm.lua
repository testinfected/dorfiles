--[[
  File: toggleterm.lua
  Description: Easily manage multiple terminal window
  See: https://github.com/akinsho/toggleterm.nvim
]]


local M = {
    'akinsho/toggleterm.nvim',
    event = "VeryLazy",
}

local function register_keybindings()
    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    local keys = require "core.utils".keys
    keys.register({
        ['<leader>g'] = {
            c = { function() lazygit:toggle() end, "Commit" }
        }
    })
end

function M.config()
    local toggleterm = require "toggleterm"
    toggleterm.setup {
        open_mapping = [[<c-\>]],
        direction = 'float',
        shade_terminals = true,
        float_opts = {
            border = 'curved'
        }
    }

    register_keybindings()
end

return M
