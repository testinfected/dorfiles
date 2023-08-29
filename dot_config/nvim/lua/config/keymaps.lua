--[[
  Description: Custom keybindings
]]

local map = vim.keymap.set

map('n', 'x', '"_x') -- don't put cut characters in register
map({ 'i', 'n' }, '<ESC>', [[<Cmd>noh<CR><ESC>]], { desc = "Escape and clear search highlighting" })

-- Break the habit of using arrow keys in normal mode. Not for the faint of heart!
for _, arrow_key in ipairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
  map('n', arrow_key, '<Nop>')
end

--The & command repeats the last substitution (synonym for :s).
-- Unfortunately, it disregards flags, so make & trigger the :&& command which preserves flags
map({'n', 'x'}, '&', '<Cmd>&&<CR>', { desc = "Repeat last substitution" })

map('n', '<leader>sv', '<C-w>v', { desc = "Vertically" })
map('n', '<leader>sh', '<C-w>s', { desc = "Horizontally" })
map('n', '<leader>ss', '<C-w>w', { desc = "Switch" })
map('n', '<leader>sx', '<C-w>q', { desc = "Close" })
map('n', '<leader>se', '<C-w>=', { desc = "Equal width" })

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
