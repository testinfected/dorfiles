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

    function opts(desc)
        return { desc = desc, buffer = buffer }
    end

    --- Hover
    keys.nmap('K', vim.lsp.buf.hover, opts("Quick documentation"))

    -- Code references
    --d = { vim.lsp.buf.definition, "Definition" },
    keys.nmap('gd', vim.lsp.buf.hover, opts("Quick documentation"))
    keys.nmap('gd', telescope.lsp_definitions, opts("Definition"))
    --i = { vim.lsp.buf.implementation, "Implementation" },
    keys.nmap('gi', telescope.lsp_implementations, opts("Implementation"))
    --o = { vim.lsp.buf.type_definition, "Type definition" },
    keys.nmap('go', telescope.lsp_type_definitions, opts("Type definition"))
    --r = { vim.lsp.buf.references, "References" },
    keys.nmap('gr', telescope.lsp_references, opts("References"))
    keys.nmap('gs', vim.lsp.buf.signature_help, opts("Signature"))

    -- Diagnostics
    keys.nmap(']d', function() vim.diagnostic.goto_next({ severity = nil }) end, opts("Next diagnostic"))
    keys.nmap('[d', function() vim.diagnostic.goto_prev({ severity = nil }) end, opts("Previous diagnostic"))
    keys.nmap(']E', function() vim.diagnostic.goto_next({ severity = "ERROR" }) end, opts("Next error"))
    keys.nmap('[E', function() vim.diagnostic.goto_prev({ severity = "ERROR" }) end, opts("Previous error"))
    keys.nmap(']w', function() vim.diagnostic.goto_next({ severity = "WARN" }) end, opts("Next warning"))
    keys.nmap('[w', function() vim.diagnostic.goto_prev({ severity = "WARN" }) end, opts("Previous warning"))

    -- Code actions
    local prefix = '<leader>c'
    keys.nmap(prefix .. 'a', vim.lsp.buf.code_action, opts("Code action"))
    keys.nmap(prefix .. 'f', function() vim.lsp.buf.format({ async = true }) end, opts("Format document"))
    keys.nmap(prefix .. 'l', vim.lsp.codelens.run, opts("CodeLens Action"))
    keys.nmap(prefix .. 'q', telescope.quickfix, opts( "Quickfix"))
    keys.nmap(prefix .. 'r', vim.lsp.buf.rename, opts("Rename..."))
    keys.nmap(prefix .. 's', telescope.lsp_document_symbols, opts("Document symbols"))
    keys.nmap(prefix .. 'S', telescope.lsp_dynamic_workspace_symbols, opts("Workspace Symbols"))
    keys.nmap(prefix .. 'dl', function() vim.diagnostic.open_float(nil, { scope = "buffer", border = "rounded" }) end, opts("Line diagnostics" ))
    keys.nmap(prefix .. 'df', function() telescope.diagnostics { bufnr = 0 } end, opts("File diagnostics" ))
    keys.nmap(prefix .. 'dw', telescope.diagnostics, opts("Workspace diagnostics"))
    -- Visual mode range actions
    keys.vmap(prefix .. 'a', vim.lsp.buf.code_action, opts("Act on selection"))
    keys.vmap(prefix .. 'f', vim.lsp.buf.format, opts("Format selection"))
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
