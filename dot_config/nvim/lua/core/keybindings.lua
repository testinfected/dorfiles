--[[
  File: keybindings.lua
  Description: Defines custom keybindings
]]

local keys = require('core.utils').keys

keys.map({ 'i', 'n' }, '<esc>', [[<Cmd>noh<CR><ESC>]], { desc = "Escape and clear search highlighting" })

-- Break the habit of using arrow keys in normal mode. Not for the faint of heart!
for _, arrow_key in ipairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
  keys.nmap(arrow_key, '<Nop>')
end

--The & command repeats the last substitution (synonym for :s).
-- Unfortunately, it disregards flags, so make & trigger the :&& command which preserves flags
keys.map({'n', 'x'}, '&', '<Cmd>&&<CR>', { desc = "Repeat last substitution" })

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
