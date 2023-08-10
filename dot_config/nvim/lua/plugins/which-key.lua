--[[
  File: which-key.lua
  Description: Displays a popup with possible key bindings
  See: https://github.com/folke/which-key.nvim
]]

local M = {
    "folke/which-key.nvim",
    event = "VeryLazy"
}

function M.init()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
end

function M.config()
    local wk = require "which-key"

    wk.setup {
        window = {
            border = "rounded", -- none, single, double, shadow
            align = 'center',
            margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
            padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
            winblend = 0,
        },
        layout = {
            height = { min = 4, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
            align = "left", -- align columns left, center or right
        },
    }

    wk.register {
        ['='] = {
            name = "+Unimpaired"
        },
        ['['] = {
            name = "+Navigate (backward)"
        },
        [']'] = {
            name = "+Navigate (forward)"
        },
        ['g'] = {
            name = "+Goto",
        },
        z = {
            name = "+Fold",
        },
        ['<c-w>'] = {
            name = "+Window",
        },
        ['<leader>'] = {
            name = "+User",
            b = {
                name = "+Buffer",
            },
            c = {
                name = "+Code",
                d = {
                    name = "+Diagnostics",
                },
            },
            d = {
                name = "+Debug",
                b = {
                    name = "+Breakpoint"
                }
            },
            f = {
                name = "+File",
            },
            g = {
                name = "+Git",
                g = {
                    name = "+Show",
                },
                t = {
                    name = "+Toggle",
                },
            },
            h = {
                name = "+Help",
            },
            k = {
                name = "+Keymaps",
                s = { function() vim.cmd "WhichKey" end, "Show", },
                l = { function() local input = vim.fn.input "WhichKey: " vim.cmd("WhichKey " .. input) end, "Lookup..." }
            },
            l = {
                name = "+Plugins"
            },
            p = {
                name = "+Projects",
            },
            s = {
                name = "+Search",
            },
            t = {
                name = "+Tweak",
            },
            x = {
                name = "+Trouble",
            },
        }
    }
end

return M
