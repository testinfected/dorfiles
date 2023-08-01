--[[
  File: settings.lua
  Description: Base settings for neovim
  Info: Use <zo> and <zc> to open and close foldings
]]

-- Set associating between turned on plugins and filetype
vim.cmd [[filetype plugin on]]

-- Disable comments on pressing Enter
vim.cmd [[autocmd FileType * setlocal formatoptions-=cro]]

local function set_options(opts)
    for opt, val in pairs(opts) do
        vim.o[opt] = val
    end
end

set_options {
    -- Tabs {{{
    expandtab = true, -- Use spaces by default
    shiftwidth = 2, -- Set amount of space characters, when we press "<" or ">"
    tabstop = 2, -- 1 tab equal 2 spaces
    smartindent = true, -- Turn on smart indentation. See in the docs for more info
    -- }}}

    -- Useful options {{{
    number = true,
    mouse = 'a',
    -- }}}

    -- Clipboard {{{
    clipboard = 'unnamed,unnamedplus', -- Use system clipboard
    fixeol = false, -- Turn off appending new line in the end of a file
    -- }}}

    -- Folding {{{
    foldmethod = 'syntax',
    -- }}}

    -- Search {{{
    ignorecase = true, -- Ignore case if all characters in lower case
    joinspaces = false, -- Join multiple spaces in search
    smartcase = true, -- When there is a one capital letter search for exact match
    showmatch = true, -- Highlight search instances
    -- }}}

    -- Term {{{
    termguicolors = true,
    -- }}}

    -- Window {{{
    splitbelow = true, -- Put new windows below current
    splitright = true, -- Put new vertical splits to right
    -- }}}

    -- Wild Menu {{{
    wildmenu = true,
    wildmode = "longest:full,full",
    -- }}}
}

-- Default Plugins {{{
local function disable_built_ins(plugins)
    for _, plugin in pairs(plugins) do
        vim.g["loaded_" .. plugin] = 1
    end
end

disable_built_ins {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}
-- }}}

-- Set theme
local colorscheme = 'catppuccin'
vim.cmd.colorscheme(colorscheme)

-- vim: tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=1
