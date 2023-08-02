local toggleterm = require('toggleterm')

toggleterm.setup {
    open_mapping = [[<c-\>]],
    direction = 'float',
    shade_terminals = true,
    float_opts = {
        border = 'curved'
    }
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

local keys = require("helpers.keys")
keys.register({
    ['<leader>g'] = {
        c = { function() lazygit:toggle() end, "Commit" }
    }
})
