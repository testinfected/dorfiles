--[[
  File: options.lua
  Description: Base settings for neovim
  Info: Use <zo> and <zc> to open and close foldings
]]

-- Set associating between turned on plugins and filetype
vim.cmd [[filetype plugin on]]

-- Disable comments on pressing Enter
vim.cmd [[autocmd FileType * setlocal formatoptions-=cro]]

vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set({ 'n', 'v' }, '<leader>', "<Nop>", { silent = true, remap = false })

local function vim_options(opts)
    for opt, val in pairs(opts) do
        vim.o[opt] = val
    end
end

vim_options {
    -- Tabs {{{
    expandtab = true, -- Use spaces by default
    shiftwidth = 2, -- Set amount of space characters, when we press "<" or ">"
    tabstop = 2, -- 1 tab equal 2 spaces
    smartindent = true, -- Turn on smart indentation. See in the docs for more info
    -- }}}

    -- Useful options {{{
    showmode = false, -- Don't show mode anymore
    number = true, -- Show line numbers
    cursorline = true,
    cursorlineopt = 'number',
    mouse = 'a', -- Enable mouse in all modes,
    -- }}}

    -- Clipboard {{{
    -- Let's use registers explicitly
    -- clipboard = 'unnamed,unnamedplus', -- Use system clipboard
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

    -- Sessions {{{
    sessionoptions = "buffers,curdir,globals,tabpages,winpos,winsize", -- Save these in session
    backup = false, -- Don't create a backup file
    -- }}}

    -- Term {{{
    -- Adding true color
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

vim.g.VM_set_statusline = 0 -- disable VM's statusline updates to prevent clobbering
vim.g.VM_silent_exit = 1    -- because the status line already tells me the mode

-- vim: tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=1
