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

local register_key_bindings = function(event)
    local keys = require("helpers.keys")

    keys.register({
        ['K'] = { vim.lsp.buf.hover, "Quick documentation" },
        ['g'] = {
            name = "+goto",
            d = { vim.lsp.buf.definition, "Definition" },
            i = { vim.lsp.buf.implementation, "Implementation" },
            o = { vim.lsp.buf.type_definition, "Type definition" },
            r = { vim.lsp.buf.references, "References" },
            s = { vim.lsp.buf.signature_help, "Signature" },
            D = { function() vim.diagnostic.open_float(nil, { scope = "buffer", border = "rounded" }) end, "Diagnostics" },
        },
        [']d'] = { function() vim.diagnostic.goto_next({ severity = nil}) end, "Next diagnostic" },
        ['[d'] = { function() vim.diagnostic.goto_prev({ severity = nil}) end, "Previous diagnostic" },
        [']e'] = { function() vim.diagnostic.goto_next({ severity = "ERROR"}) end, "Next error" },
        ['[e'] = { function() vim.diagnostic.goto_prev({ severity = "ERROR"}) end, "Previous error" },
        [']w'] = { function() vim.diagnostic.goto_next({ severity = "WARN"}) end, "Next warning" },
        ['[w'] = { function() vim.diagnostic.goto_prev({ severity = "WARN"}) end, "Previous warning" },

        -- Code actions
        ['<leader>c'] = {
            name = "+code",
            r = { vim.lsp.buf.rename, "Rename..." },
            a = { vim.lsp.buf.code_action, "Code action" },
            f = { function() vim.lsp.buf.format({async = true}) end, "Format document" },
        }
    }, { buffer = event.buf })

    -- For some reason I can't make it work with keys.register
    keys.vmap('<leader>ca', vim.lsp.buf.code_action, { desc = "Range code action" })
    keys.vmap('<leader>cf', vim.lsp.buf.format, { desc = "Format selection" })
end

-- Bind keys when lsp server is active
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = register_key_bindings
})
