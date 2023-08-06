--[[
  File: trouble.lua
  Description: A pretty diagnostics, references, telescope results, quickfix and location list
  See: https://github.com/folke/trouble.nvim
]]

local M = {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "Bufenter",
}

local function set_sign_icons(opts)
    opts = opts or {}

    local sign = function(args)
        if opts[args.name] == nil then
            return
        end

        vim.fn.sign_define(args.hl, {
            texthl = args.hl,
            text = opts[args.name],
            numhl = ''
        })
    end

    sign({name = 'error', hl = 'DiagnosticSignError'})
    sign({name = 'warn', hl = 'DiagnosticSignWarn'})
    sign({name = 'hint', hl = 'DiagnosticSignHint'})
    sign({name = 'info', hl = 'DiagnosticSignInfo'})
end

local function register_keybindings()
    local keys = require "core.utils".keys
    local trouble = require "trouble"

    local prefix = '<leader>x'
    keys.nmap(prefix .. 'x', trouble.open, { desc = "Open" })
    keys.nmap(prefix .. 'w', function() trouble.open("workspace_diagnostics") end, { desc = "Workspace diagnostics" })
    keys.nmap(prefix .. 'd', function() trouble.open("document_diagnostic") end, { desc = "Document diagnostics" })
    keys.nmap(prefix .. 'q', function() trouble.open("quickfix") end, { desc = "Quickfix"})
    keys.nmap(prefix .. 'l', function() trouble.open("loclist") end, { desc = "Locations" })
    keys.nmap(prefix .. 'r', function() trouble.open("lsp_references") end, { desc = "References"} )
end

function M.config()
    local trouble = require "trouble"
    trouble.setup()

    local telescope = require "trouble.providers.telescope"
    require "telescope".setup {
        defaults = {
            mappings = {
                i = { ["<c-t>"] = telescope.open_with_trouble },
                n = { ["<c-t>"] = telescope.open_with_trouble },
            },
        },
    }

    register_keybindings()
    set_sign_icons({
        error = '',
        warn = '',
        hint = '',
        info = ''
    })
end

return M
