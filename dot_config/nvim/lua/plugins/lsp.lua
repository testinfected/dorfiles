--[[
  File: lsp.lua
  Description: Quickstart configs for Nvim LSP
  See: https://github.com/neovim/nvim-lspconfig
]]

local M = {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre" },
    dependencies = {
        {
            "hrsh7th/cmp-nvim-lsp",
            -- Description: VSCode-like pictograms for neovim built-in lsp
            -- See: https://github.com/onsails/lspkind.nvim
            "onsails/lspkind.nvim"
        },
    },
}

local symbols_flavors = {
    default = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
    },
    codicons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
    },
}

local function register_keybindings(buffer)
    local keys = require "core.utils".keys
    local telescope = require "telescope.builtin"

    keys.register({
        ['K'] = { vim.lsp.buf.hover, "Quick documentation" },
        ['g'] = {
            name = "+goto",
            --d = { vim.lsp.buf.definition, "Definition" },
            d = { telescope.lsp_definitions, "Definition" },
            --i = { vim.lsp.buf.implementation, "Implementation" },
            i = { telescope.lsp_implementations, "Implementation" },
            --o = { vim.lsp.buf.type_definition, "Type definition" },
            o = { telescope.lsp_type_definitions, "Type definition" },
            --r = { vim.lsp.buf.references, "References" },
            r = { telescope.lsp_references, "References" },
            s = { vim.lsp.buf.signature_help, "Signature" },
        },
        [']d'] = { function()
            vim.diagnostic.goto_next({ severity = nil })
        end, "Next diagnostic" },
        ['[d'] = { function()
            vim.diagnostic.goto_prev({ severity = nil })
        end, "Previous diagnostic" },
        [']e'] = { function()
            vim.diagnostic.goto_next({ severity = "ERROR" })
        end, "Next error" },
        ['[e'] = { function()
            vim.diagnostic.goto_prev({ severity = "ERROR" })
        end, "Previous error" },
        [']w'] = { function()
            vim.diagnostic.goto_next({ severity = "WARN" })
        end, "Next warning" },
        ['[w'] = { function()
            vim.diagnostic.goto_prev({ severity = "WARN" })
        end, "Previous warning" },

        -- Code actions
        ['<leader>c'] = {
            name = "+code",
            a = { vim.lsp.buf.code_action, "Code action" },
            f = { function()
                vim.lsp.buf.format({ async = true })
            end, "Format document" },
            l = { vim.lsp.codelens.run, "CodeLens Action" },
            q = { telescope.quickfix, "Quickfix" },
            r = { vim.lsp.buf.rename, "Rename..." },
            s = { telescope.lsp_document_symbols, "Document symbols" },
            S = { telescope.lsp_dynamic_workspace_symbols, "Workspace Symbols" },
            d = {
                name = "+diagnostics",
                l = { function()
                    vim.diagnostic.open_float(nil, { scope = "buffer", border = "rounded" })
                end, "Line diagnostics" },
                f = { function()
                    telescope.diagnostics { bufnr = 0 }
                end, "File diagnostics" },
                w = { telescope.diagnostics, "Workspace diagnostics" }
            },
        }

    }, { buffer = buffer })

    keys.vmap('<leader>ca', vim.lsp.buf.code_action, { desc = "Range code action" })
    keys.vmap('<leader>cf', vim.lsp.buf.format, { desc = "Format selection" })
end

function M.config()
    -- I like rounded borders obviously
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
                border = 'rounded'
            }
    )
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help, {
                border = 'rounded'
            }
    )
    vim.diagnostic.config {
        float = { border = 'rounded' }
    }

    -- When lsp server activates...
    vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
            -- setup LSP symbols
            require('lspkind').init {
                mode = 'symbol',
                preset = 'default',
                symbol_map = symbols_flavors.codicons
            }

            -- bind keys
            register_keybindings(event.buf)
        end
    })
end

return M
