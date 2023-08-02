--[[
  File: mason.lua
  Description: Mason plugin configuration (with lspconfig)
  See: https://github.com/williamboman/mason.nvim
]]

local mason = require("mason")
mason.setup()

local mason_lspconfig = require("mason-lspconfig")
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
local lspconfig = require("lspconfig")
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = lsp_capabilities,
    })
  end,
})
