--[[
  File: lsp.lua
  Description: Quickstart configs for Nvim LSP
  See: https://github.com/neovim/nvim-lspconfig
]]

local M = {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre' },
  dependencies = {
    {
      -- Description: VSCode-like pictograms for neovim built-in lsp
      -- See: https://github.com/onsails/lspkind.nvim
      'onsails/lspkind.nvim',
      'nvim-telescope/telescope.nvim',
      'smjonas/inc-rename.nvim' -- incremental rename with preview
    },
  },
}

local function setup_keymaps(bufnr)
  function opts(values)
    values.buffer = bufnr
    return values
  end

  local keys = require('core.utils').keys
  local telescope = require('telescope.builtin')

  --- Hover
  keys.nmap('K', vim.lsp.buf.hover, opts { desc = "Quick documentation" })

  -- Code references
  --d = { vim.lsp.buf.definition, "Definition" },
  keys.nmap('gd', telescope.lsp_definitions, opts { desc = "Definition" })
  --D = { vim.lsp.buf.type_definition, "Type definition" },
  keys.nmap('gD', telescope.lsp_type_definitions, opts { desc = "Type definition" })
  --i = { vim.lsp.buf.implementation, "Implementation" },
  keys.nmap('gI', telescope.lsp_implementations, opts { desc = "Implementation" })
  --r = { vim.lsp.buf.references, "References" },
  keys.nmap('gr', telescope.lsp_references, opts { desc = "References" })
  keys.nmap('gs', vim.lsp.buf.signature_help, opts { desc = "Signature" })

  -- Diagnostics
  keys.nmap(']d', function() vim.diagnostic.goto_next { severity = nil } end, opts { desc = "Next diagnostic" })
  keys.nmap('[d', function() vim.diagnostic.goto_prev { severity = nil } end, opts { desc = "Previous diagnostic" })
  keys.nmap(']E', function() vim.diagnostic.goto_next { severity = 'ERROR' } end, opts { desc = "Next error" })
  keys.nmap('[E', function() vim.diagnostic.goto_prev { severity = 'ERROR' } end, opts { desc = "Previous error" })
  keys.nmap(']w', function() vim.diagnostic.goto_next { severity = 'WARN' } end, opts { desc = "Next warning" })
  keys.nmap('[w', function() vim.diagnostic.goto_prev { severity = 'WARN' } end, opts { desc = "Previous warning" })

  -- Code actions
  local prefix = '<leader>c'
  keys.nmap(prefix .. 'a', vim.lsp.buf.code_action, opts { desc = "Code action" })
  keys.nmap(prefix .. 'f', function() vim.lsp.buf.format { async = true } end, opts { desc = "Format document" })
  keys.nmap(prefix .. 'l', vim.lsp.codelens.run, opts { desc = "CodeLens Action" })
  keys.nmap(prefix .. 'q', telescope.quickfix, opts { desc = "Quickfix" })
  --keys.nmap(prefix .. 'r', vim.lsp.buf.rename, opts { desc = "Rename..." })
  keys.nmap(prefix .. 'r', ":IncRename ", opts { desc = "Rename...", silent = true })
  keys.nmap(prefix .. 's', telescope.lsp_document_symbols, opts { desc = "Document symbols" })
  keys.nmap(prefix .. 'S', telescope.lsp_dynamic_workspace_symbols, opts { desc = "Workspace Symbols" })
  keys.nmap(prefix .. 'dl', function() vim.diagnostic.open_float(nil, { scope = 'buffer', border = 'rounded' }) end, opts { desc = "Line diagnostics" })
  keys.nmap(prefix .. 'df', function() telescope.diagnostics { bufnr = 0 } end, opts { desc = "File diagnostics" })
  keys.nmap(prefix .. 'dw', telescope.diagnostics, opts { desc = "Workspace diagnostics" })
  -- Visual mode range actions
  keys.vmap(prefix .. 'a', vim.lsp.buf.code_action, opts { desc = "Act on selection" })
  keys.vmap(prefix .. 'f', vim.lsp.buf.format, opts { desc = "Format selection" })
  keys.vmap(prefix .. 'z', function() require('go.codeaction').run_range_code_action() end, opts { desc = "Code action" })
end

function M.config()
  -- I like rounded borders obviously
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
      border = 'rounded'
    }
  )
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
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
        symbol_map = require('core.icons').kind
      }

      -- bind keys
      setup_keymaps(event.buf)
    end
  })
end

return M
