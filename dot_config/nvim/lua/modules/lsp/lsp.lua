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
      'smjonas/inc-rename.nvim', -- incremental rename with preview
      'kevinhwang91/nvim-ufo', -- super nice folds
    },
  },
}

local function setup_keymaps(bufnr)
  local function opts(values)
    values.buffer = bufnr
    return values
  end

  local telescope = require('telescope.builtin')
  local ufo = require('ufo')

  local map, prefix = vim.keymap.set, '<leader>c'

  --- Hover
  map('n', 'K', function()
    if not ufo.peekFoldedLinesUnderCursor() then vim.lsp.buf.hover() end
  end, opts { desc = "Quick documentation" })

  -- Code references
  --d = { vim.lsp.buf.definition, "Definition" },
  map('n', 'gd', telescope.lsp_definitions, opts { desc = "Definition" })
  --D = { vim.lsp.buf.type_definition, "Type definition" },
  map('n', 'gD', telescope.lsp_type_definitions, opts { desc = "Type definition" })
  --i = { vim.lsp.buf.implementation, "Implementation" },
  map('n', 'gI', telescope.lsp_implementations, opts { desc = "Implementation" })
  --r = { vim.lsp.buf.references, "References" },
  map('n', 'gr', telescope.lsp_references, opts { desc = "References" })
  map('n', 'gs', vim.lsp.buf.signature_help, opts { desc = "Signature" })

  -- Diagnostics
  map('n', ']d', function() vim.diagnostic.goto_next { severity = nil } end, opts { desc = "Next diagnostic" })
  map('n', '[d', function() vim.diagnostic.goto_prev { severity = nil } end, opts { desc = "Previous diagnostic" })
  map('n', ']E', function() vim.diagnostic.goto_next { severity = 'ERROR' } end, opts { desc = "Next error" })
  map('n', '[E', function() vim.diagnostic.goto_prev { severity = 'ERROR' } end, opts { desc = "Previous error" })
  map('n', ']w', function() vim.diagnostic.goto_next { severity = 'WARN' } end, opts { desc = "Next warning" })
  map('n', '[w', function() vim.diagnostic.goto_prev { severity = 'WARN' } end, opts { desc = "Previous warning" })

  -- Code actions
  map('n', prefix .. 'a', vim.lsp.buf.code_action, opts { desc = "Code action" })
  map('n', prefix .. 'f', function() vim.lsp.buf.format { async = true } end, opts { desc = "Format document" })
  map('n', prefix .. 'l', vim.lsp.codelens.run, opts { desc = "CodeLens Action" })
  map('n', prefix .. 'q', telescope.quickfix, opts { desc = "Quickfix" })
  --map('n', prefix .. 'r', vim.lsp.buf.rename, opts { desc = "Rename..." })
  map('n', prefix .. 'r', ":IncRename ", opts { desc = "Rename...", silent = true })
  map('n', prefix .. 's', telescope.lsp_document_symbols, opts { desc = "Document symbols" })
  map('n', prefix .. 'S', telescope.lsp_dynamic_workspace_symbols, opts { desc = "Workspace Symbols" })
  map('n', prefix .. 'dl', function() vim.diagnostic.open_float(nil, { scope = 'buffer', border = 'rounded' }) end, opts { desc = "Line diagnostics" })
  map('n', prefix .. 'df', function() telescope.diagnostics { bufnr = 0 } end, opts { desc = "File diagnostics" })
  map('n', prefix .. 'dw', telescope.diagnostics, opts { desc = "Workspace diagnostics" })

  -- Visual mode range actions
  map('v', prefix .. 'a', vim.lsp.buf.code_action, opts { desc = "Act on selection" })
  map('v', prefix .. 'f', vim.lsp.buf.format, opts { desc = "Format selection" })
  map('v', prefix .. 'z', function() require('go.codeaction').run_range_code_action() end, opts { desc = "Code action" })
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
        symbol_map = require('config.icons').kind
      }

      -- bind keys
      setup_keymaps(event.buf)
    end
  })
end

return M
