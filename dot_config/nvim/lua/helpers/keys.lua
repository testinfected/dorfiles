local wk = require("which-key")

local Keys = {}

local function merge(opts, overrides)
    for k, v in pairs(overrides) do
        opts[k] = v
    end
    return opts
end

Keys.register = function(spec)
    wk.register(spec)
end

Keys.map = function(modes, key, cmd, opts)
    vim.keymap.set(modes, key, cmd, merge({ noremap = true }, opts or {}))
end

-- Normal mode keybinding setter
Keys.nmap = function(key, cmd, opts)
    Keys.map('n', key, cmd, opts or {})
end

-- Insert mode keybinding setter
Keys.imap = function(key, cmd, opts)
    Keys.map('i', key, cmd, opts or {})
end

-- Operator mode keybinding setter
Keys.omap = function(key, cmd, opts)
    Keys.map('o', key, cmd, opts or {})
end

-- Visual and select mode keybinding setter
Keys.vmap = function(key, cmd, opts)
    Keys.map('v', key, cmd, opts or {})
end

-- Visual mode only keybinding setter
Keys.xmap = function(key, cmd, opts)
    Keys.map('x', key, cmd, opts or {})
end

-- Select mode only keybinding setter
Keys.smap = function(key, cmd, opts)
    Keys.map('s', key, cmd, opts or {})
end

-- Terminal mode keybinding setter
Keys.tmap = function(key, cmd, opts)
    Keys.map('t', key, cmd, opts or {})
end

return Keys