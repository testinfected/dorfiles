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

local function toggle_lazygit()
    lazygit:toggle()
end

local keys = require("helpers.keys")
keys.register({
    ['<leader>g'] = {
        g = { toggle_lazygit, "Lazygit" }
    }
})
