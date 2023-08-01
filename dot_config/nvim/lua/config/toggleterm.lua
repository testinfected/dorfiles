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

function _lazygit_toggle()
    lazygit:toggle()
end

local keys = require("helpers.keys")
keys.nmap("<leader>g", "<cmd>lua _lazygit_toggle()<CR>")
