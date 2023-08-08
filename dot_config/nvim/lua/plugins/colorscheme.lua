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
        transparent_background = true,
        term_colors = true,
        dim_inactive = {
            enabled = false, -- dims the background color of inactive window
            shade = "dark",
            percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
            comments = { "italic" }, -- Change the style of comments
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        highlight_overrides = {
            mocha = function(mocha)
                return {
                    -- missing bg highlight for notify
                    NotifyBackground = { bg = mocha.mantle },
                }
            end,
        },
        integrations = {
            cmp = true,
            fidget = true,
            gitsigns = true,
            lsp_trouble = true,
            mason = true,
            neotree = true,
            noice = true,
            notify = true,
            telescope = {
                enabled = true,
            },
            treesitter = true,
            treesitter_context = true,
            which_key = true,
        },
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
            inlay_hints = {
                background = true,
            },
        },
    }
    vim.cmd [[colorscheme catppuccin]]
end

return M