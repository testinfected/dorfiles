--[[
  File: mason.lua
  Description: Mason plugin configuration (with lspconfig)
  See: https://github.com/williamboman/mason.nvim
]]

require("helpers/keyboard")

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local fmt = function(cmd)
  return function(str)
    return cmd:format(str)
  end
end

local bind_keys = function(event)
  local lsp = fmt('<cmd>lua vim.lsp.%s<cr>')
  local diagnostic = fmt('<cmd>lua vim.diagnostic.%s<cr>')
  local opts = {buffer = event.buf}

  nm('K', lsp 'buf.hover()', opts)                                       -- Hover object
  nm('ga', lsp 'buf.code_action()', opts)                                -- Code actions
  xm('ga', lsp 'buf.code_action()', opts)                                -- Code actions
  -- nm('gA', lsp 'buf.range_code_action()', opts)                             -- Code actions
  -- xm('gA', lsp 'buf.range_code_action()', opts)                             -- Code actions
  nm('gR', lsp 'buf.rename()', opts)                                     -- Rename an object
  nm('gD', lsp 'buf.declaration()', opts)                                -- Go to declaration
  nm('gi', lsp 'buf.implementation()', opts)
  nm('go', lsp 'buf.type_definition()', opts)
  nm('gh', lsp 'buf.references()', opts)
  nm('gs', lsp 'buf.signature_help()', opts)
  nm('gF', lsp 'buf.format({async = true})', opts)

  -- Diagnostic {{{
  nm('gl', diagnostic 'open_float()')
  nm('[d', diagnostic 'goto_prev()')
  nm(']d', diagnostic 'goto_next()')
end

-- Keybindings when lsp server is active
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = bind_keys
})

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

mason.setup()
mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",                 -- LSP for Lua language
    "tsserver",               -- LSP for Typescript and Javascript
    "emmet_ls",               -- LSP for Emmet (Vue, HTML, CSS)
    "cssls",                  -- LSP for CSS
    "pyright",                -- LSP for Python
    "volar",                  -- LSP for Vue
    "gopls",                  -- LSP for Go
    "bashls",                 -- LSP for Bash
    "dagger",                 -- LSP for CUE
    "dockerls",               -- LSP for Docker (exl. Docker Compose)
    --- "fennel_language_server", -- LSP for Fennel
    "gradle_ls",              -- LSP for Gradle
    "html"    ,               -- LSP for HTML
    "marksman",               -- LSP for Markdown
    -- "ruby_ls",                -- LSP for Ruby
    -- "rust_analyzer",          -- LSP for Rust
    "sqlls",                  -- LSP for SQL
    "taplo",                  -- LSP for TOML
    "lemminx",                -- LSP for XML
    "yamlls",                 -- LSP for YAML
  }
});

-- Setup every needed language server in lspconfig
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = lsp_capabilities,
    })
  end,
})
