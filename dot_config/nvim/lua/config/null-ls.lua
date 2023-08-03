local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
    sources = {
        formatting.stylua,
        formatting.prettier.with({
            filetypes = {
                "yaml",
                "markdown",
            },
            extra_filetypes = { "toml" },
            extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote"  }
        }),
        formatting.black.with({ extra_args = { "--fast" } }),
        completion.spell,
        diagnostics.markdownlint,
        code_actions.gitsigns,
    },
})