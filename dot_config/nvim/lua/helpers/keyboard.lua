-- Alias for function, that set new keybindings
local map = vim.api.nvim_set_keymap 

-- Normal mode keybinding setter
function nm(key, command) 
  map('n', key, command, {noremap = true})
end

-- Input mode keybinding setter
function im(key, command)
  map('i', key, command, {noremap = true})
end

-- Visual and select mode keybinding setter
function vm(key, command)
  map('v', key, command, {noremap = true})
end

-- Visual mode only keybinding setter
function xm(key, command)
  map('x', key, command, {noremap = true})
end

-- Select mode only keybinding setter
function sm(key, command)
  map('s', key, command, {noremap = true})
end

-- Terminal mode keybinding setter
function tm(key, command)
  map('t', key, command, {noremap = true})
end

