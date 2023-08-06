--[[
  File: telescope.lua
  Description: Fuzzy finder over lists
  See: https://github.com/nvim-telescope/telescope.nvim
]]

local M = {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            -- much faster fzf than its lua counterpart
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
    },
    event = "Bufenter",
    cmd = { "Telescope" },
}

local opts = {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key =: value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
}

local function register_keybindings()
    local keys = require "core.utils".keys
    local builtin = require "telescope.builtin"
    local extensions = require "telescope".extensions

    keys.register {
        ['<leader>'] = {
            name = "+prefix",
            [' '] = { builtin.find_files, "Find files" },
            ['.'] = { function() extensions.file_browser.file_browser({ path="%:p:h", select_buffer=true}) end, "Browse project" },
            [','] = { builtin.buffers, "Opened buffers" },
            ['/'] = { builtin.current_buffer_fuzzy_find, "Search current buffer" },
            ["'"] = { builtin.live_grep, "Search everywhere" },
            [';'] = { builtin.command_history, "Search recent commands" },
            ['*'] = { builtin.grep_string, "Find word under cursor" },
            b = {
                name = "+buffer",
                s = { function() builtin.buffers({show_all_buffers=true}) end, "Select" },
                f = { builtin.current_buffer_fuzzy_find, "Find text" },
            },
            f = {
                name = "+file",
                o = {  builtin.git_files, "Open from project" },
                f = {  builtin.find_files, "Find" },
                r = {  builtin.oldfiles, "Recently opened" },
            },
            h = {
                name = "+help",
                c = { builtin.commands, "Show available commands" },
                k = { builtin.keymaps, "Show keymaps" },
                o = { builtin.vim_options, "Show options" },
                h = { builtin.help_tags, "Show help tags" },
                H = { builtin.highlights, "Show highlight groups" },
            },
            s = {
                name = "+search",
                b = { builtin.current_buffer_fuzzy_find, "Current buffer" },
                t = { builtin.live_grep, "Everywhere" },
                c = { builtin.command_history, "Commands history" },
                m = { builtin.marks, "Marks" },
                r = { builtin.resume, "Resume previous search" },
                w = { builtin.grep_string, "Word under cursor" },
            },
            t = {
                name = "+tweak",
                C = { function() builtin.colorscheme({enable_preview = true}) end, "Switch colorscheme" },
            },
            v = {  builtin.registers, "Registers" },
        },
    }
end

function M.config()
    local telescope = require "telescope"
    telescope.setup(opts)
    -- Super fast fuzzy find
    telescope.load_extension "fzf"
    -- Keybindings
    register_keybindings()
end


return M