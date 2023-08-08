--[[
  File: indentline.lua
  Description: Indent guides for Neovim
  See: https://github.com/lukas-reineke/indent-blankline.nvim
]]

local M = {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
}

function M.config()
    require "indent_blankline".setup {
        char = '▏',
        context_char = '┃', -- pecifies the character to be used for the current context indent line

        show_current_context = true,
        show_current_context_start = true,
        show_trailing_blankline_indent = false,
        show_first_indent_level = true,

        use_treesitter = true,

        buftype_exclude = {
            "terminal",
            "nofile",
        },
        filetype_exclude = {
            "help",
            "lazy",
            "toggleterm",
            "NeoTree",
        },
    }
end

return M