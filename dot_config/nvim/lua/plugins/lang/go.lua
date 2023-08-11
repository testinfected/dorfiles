--[[
  File: go.lua
  Description: Feature-rich Go development plugin
  See: https://github.com/ray-x/go.nvim
]]

local M = {
    "ray-x/go.nvim",
    dependencies = {
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}

function M.config()
    -- TODO:
    -- [] configure ginkgo binary
    -- [] configure test coverage
    -- [] configure symbols outline
    -- [] configure lsp to use go.nvim cmp
    -- [] use lsp snippets from go.nvim
    -- [] move dap support to individual languages
    -- [] move treesitter parsers inclusion to individual languages
    -- [] configure treesitter textobjects
    -- [] integrate with mason-lspconfig
    -- [] integrate null-ls
    -- [] add key mappings

    -- [] add https://github.com/jeniasaigak/goplay.nvim plugin
    -- [] consider https://github.com/ray-x/navigator.lua plugin

    require("go").setup {

    }
end

return M