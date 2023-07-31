local Keys = {}

-- Alias for function that set new keybindings
local map = vim.api.nvim_set_keymap 

-- Normal mode keybinding setter
Keys.nmap = function(key, command, desc)
  map('n', key, command, {noremap = true, desc = desc})
end

-- Input mode keybinding setter
Keys.imap = function(key, command, desc)
  map('i', key, command, {noremap = true, desc = desc})
end

-- Visual and select mode keybinding setter
Keys.vmap = function(key, command, desc)
  map('v', key, command, {noremap = true, desc = desc})
end

-- Visual mode only keybinding setter
Keys.xmap = function(key, command, desc)
  map('x', key, command, {noremap = true, desc = desc})
end

-- Select mode only keybinding setter
Keys.smap = function(key, command, desc)
  map('s', key, command, {noremap = true, desc = desc})
end

-- Terminal mode keybinding setter
Keys.tmap = function(key, command, desc)
  map('t', key, command, {noremap = true, desc = desc})
end

Keys.set_leader = function(key)
  vim.g.mapleader = key
  vim.g.maplocalleader = key
  Keys.nmap(key, "<nop>")
  Keys.vmap(key, "<nop>")
end

return Keys