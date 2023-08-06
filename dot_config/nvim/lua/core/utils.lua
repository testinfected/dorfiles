--[[
  File: utils.lua
  Description: Utility functions, e.g. to help with keybindings
]]

local wk = require "which-key"

local function merge(opts, overrides)
    for k, v in pairs(overrides) do
        opts[k] = v
    end
    return opts
end

local Keys = {}

function Keys.register(spec)
    wk.register(spec)
end

function Keys.map(modes, key, cmd, opts)
    vim.keymap.set(modes, key, cmd, merge({ noremap = true }, opts or {}))
end

-- Normal mode keybinding setter
function Keys.nmap(key, cmd, opts)
    Keys.map('n', key, cmd, opts or {})
end

-- Insert mode keybinding setter
function Keys.imap(key, cmd, opts)
    Keys.map('i', key, cmd, opts or {})
end

-- Operator pending mode keybinding setter
function Keys.omap(key, cmd, opts)
    Keys.map('o', key, cmd, opts or {})
end

-- Visual and select mode keybinding setter
function Keys.vmap(key, cmd, opts)
    Keys.map('v', key, cmd, opts or {})
end

-- Visual mode only keybinding setter
function Keys.xmap(key, cmd, opts)
    Keys.map('x', key, cmd, opts or {})
end

-- Select mode only keybinding setter
function Keys.smap(key, cmd, opts)
    Keys.map('s', key, cmd, opts or {})
end

-- Terminal mode keybinding setter
function Keys.tmap(key, cmd, opts)
    Keys.map('t', key, cmd, opts or {})
end

return {
    keys = Keys
}