local Keys = {}

local function merge(opts, overrides)
    for k, v in pairs(overrides) do
        opts[k] = v
    end
    return opts
end

-- Normal mode keybinding setter
Keys.map = function(modes, key, command, opts)
    vim.keymap.set(modes, key, command, merge({ noremap = true }, opts or {}))
end

-- Normal mode keybinding setter
Keys.nmap = function(key, command, opts)
    Keys.map('n', key, command, opts or {})
end

-- Insert mode keybinding setter
Keys.imap = function(key, command, opts)
    Keys.map('i', key, command, opts or {})
end

-- Operator mode keybinding setter
Keys.omap = function(key, command, opts)
    Keys.map('o', key, command, opts or {})
end

-- Visual and select mode keybinding setter
Keys.vmap = function(key, command, opts)
    Keys.map('v', key, command, opts or {})
end

-- Visual mode only keybinding setter
Keys.xmap = function(key, command, opts)
    Keys.map('x', key, command, opts or {})
end

-- Select mode only keybinding setter
Keys.smap = function(key, command, opts)
    Keys.map('s', key, command, opts or {})
end

-- Terminal mode keybinding setter
Keys.tmap = function(key, command, opts)
    Keys.map('t', key, command, opts or {})
end

Keys.set_leader = function(key)
    vim.g.mapleader = key
    vim.g.maplocalleader = key
    Keys.map({ 'n', 'v' }, key, "<nop>")
end

return Keys