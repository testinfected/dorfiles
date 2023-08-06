--[[
  File: colorscheme.lua
  Description: Catppuccin theme for (Neo)vim
  See: https://github.com/catppuccin/nvim
]]

local M = {
    "catppuccin/nvim",
    name = "catppuccin",
    -- Load immediately to make it available for lazy
    lazy = false,
    -- Load before anything else since this is our main theme
    priority = 1000,
}

function M.config()
    local catppuccin = require "catppuccin"

    catppuccin.setup {
        flavor = "mocha",
        term_colors = true,
        --transparent_background = true,
        --native_lsp = {
        --    enabled = true,
        --    underlines = {
        --        errors = { "undercurl" },
        --        hints = { "undercurl" },
        --        warnings = { "undercurl" },
        --        information = { "undercurl" },
        --    },
        --},
    }

    vim.cmd [[colorscheme catppuccin]]
end

return M