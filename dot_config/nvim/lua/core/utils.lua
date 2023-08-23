--[[
  File: utils.lua
  Description: Utility functions, e.g. to help with keybindings
]]

local Keys = {}

function Keys.map(modes, key, cmd, opts)
  vim.keymap.set(modes, key, cmd, opts)
end

-- Normal mode keybinding setter
function Keys.nmap(key, cmd, opts)
  Keys.map('n', key, cmd, opts)
end

-- Insert mode keybinding setter
function Keys.imap(key, cmd, opts)
  Keys.map('i', key, cmd, opts)
end

-- Operator pending mode keybinding setter
function Keys.omap(key, cmd, opts)
  Keys.map('o', key, cmd, opts)
end

-- Visual and select mode keybinding setter
function Keys.vmap(key, cmd, opts)
  Keys.map('v', key, cmd, opts)
end

-- Visual mode only keybinding setter
function Keys.xmap(key, cmd, opts)
  Keys.map('x', key, cmd, opts)
end

-- Select mode only keybinding setter
function Keys.smap(key, cmd, opts)
  Keys.map('s', key, cmd, opts)
end

-- Terminal mode keybinding setter
function Keys.tmap(key, cmd, opts)
  Keys.map('t', key, cmd, opts)
end

return {
  keys = Keys
}