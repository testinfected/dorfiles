--[[
  File: null-ls.lua
  Description: Use Neovim as a language server to inject LSP diagnostics, code actions, and more
  See: https://github.com/jose-elias-alvarez/null-ls.nvim
]]

local M = {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = "BufReadPre"
}

function M.config()
    local null_ls = require "null-ls"

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local completion = null_ls.builtins.completion
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup {
        sources = {
            formatting.stylua,
            formatting.prettier.with {
                filetypes = {
                    "yaml",
                    "markdown",
                },
                extra_filetypes = { "toml" },
                extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" }
            },
            formatting.black.with { extra_args = { "--fast" } },
            completion.spell,
            diagnostics.markdownlint,
            code_actions.gitsigns,
        },
    }
end

return M