--[[
  File: keybindings.lua
  Description: Defines custom keybindings
]]

local keys = require('core.utils').keys

keys.nmap('x', '_x') -- don't put cut characters in register
keys.map({ 'i', 'n' }, '<ESC>', [[<Cmd>noh<CR><ESC>]], { desc = "Escape and clear search highlighting" })

-- Break the habit of using arrow keys in normal mode. Not for the faint of heart!
for _, arrow_key in ipairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
  keys.nmap(arrow_key, '<Nop>')
end

--The & command repeats the last substitution (synonym for :s).
-- Unfortunately, it disregards flags, so make & trigger the :&& command which preserves flags
keys.map({'n', 'x'}, '&', '<Cmd>&&<CR>', { desc = "Repeat last substitution" })

keys.nmap('<leader>sv', '<C-w>v', { desc = "Vertically" })
keys.nmap('<leader>sh', '<C-w>s', { desc = "Horizontally" })
keys.nmap('<leader>ss', '<C-w>w', { desc = "Switch" })
keys.nmap('<leader>sx', '<C-w>q', { desc = "Close" })
keys.nmap('<leader>se', '<C-w>=', { desc = "Equal width" })

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
