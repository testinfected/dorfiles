--[[
  File: trouble.lua
  Description: Configuration of trouble.nvim
  See: https://github.com/folke/trouble.nvim
]]

local trouble = require("trouble")
trouble.setup()

-- Keybindings
local keys = require("helpers.keys")
keys.nmap('<leader>x', '<cmd>TroubleToggle')                                         -- Show all problems in project (with help of LSP)
keys.nmap('gr', '<cmd>Trouble lsp_references')                                       -- Show use of object in project

-- Signs
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

set_sign_icons({
    error = '',
    warn = '',
    hint = '',
    info = ''
})
