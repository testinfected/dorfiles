--[[
  File: lazy.lua
  Description: Bootstraps lazy.nvim and loads all plugins
  See: https://github.com/folke/lazy.nvim
]]

-- Bootstrap lazy.nvim
local function bootstrap()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)

    return require "lazy"
end

local disabled_builtins = {
    'netrw',
    "netrwPlugin", -- Handles file transfers and remote directory listing across a network
    'netrwSettings',
    'netrwFileHandlers',
    "gzip", -- Plugin for editing compressed files.
    'zip',
    "zipPlugin", -- Handles browsing zipfiles
    'tar',
    "tarPlugin", -- Plugin for browsing tar files
    'getscript',
    'getscriptPlugin',
    'vimball',
    'vimballPlugin',
    '2html_plugin',
    'logipat',
    'rrhelper',
    'spellfile_plugin',
    "matchparen", -- Plugin for showing matching parens
    "matchit", -- What is it?
    "tohtml", -- Converting a syntax highlighted file to HTML
    "tutor", -- Teaching
}

local lazy = bootstrap()

lazy.setup("plugins", {
    defaults = {
        lazy = true
    } ,
    ui = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        size = { width = 0.7, height = 0.7 },
        wrap = "true"
    },
    change_detection = {
        enabled = true
    },
    debug = false,
    install = {
        colorscheme = {
            require("plugins.colorscheme").name
        }
    },
    performance = {
        rtp = {
            disabled_plugins = disabled_builtins
        }
    }
})

-- Might as well set up an easy-access keybinding
local keys = require "core.utils".keys
keys.register {
    ["<leader>p"] = {
        name = "+plugins",
        s = { "<cmd>Lazy<CR>", "Show" }
    }
}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0