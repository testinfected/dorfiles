--[[
  File: neotest.lua
  Description: framework for interacting with tests
  See: https://github.com/nvim-neotest/neotest
]]

local M = {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "folke/neodev.nvim",
        "nvim-neotest/neotest-plenary",
        "nvim-neotest/neotest-vim-test",
        "nvim-neotest/neotest-python",
        "nvim-neotest/neotest-go",
    },
    event = { 'BufRead', 'BufNewFile'}
}

local keys = require "core.utils".keys

function M.config()
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
        virtual_text = {
            format = function(diagnostic)
                -- Replace newline and tab characters with space for more compact diagnostics
                local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                return message
            end,
        },
    }, neotest_ns)

    local neotest = require "neotest"
    neotest.setup {
        adapters = {
            require("neotest-python") {
                dap = { justMyCode = false },
            },
            require("neotest-go"),
            require("neotest-plenary"),
            require("neotest-vim-test") {
                ignore_file_types = { "python", "vim", "lua" },
            },
        },
        quickfix = {
            open = function()
                if require("lazyvim.util").has("trouble.nvim") then
                    vim.cmd("Trouble quickfix")
                else
                    vim.cmd("copen")
                end
            end,
        },
    }

    keys.nmap("<leader>tr", function() neotest.run.run() end, { desc = "Run Nearest" })
    keys.nmap("<leader>td", function() neotest.run.run({strategy = "dap"}) end, { desc = "Debug Nearest" })
    keys.nmap("<leader>tt", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run File" })
    keys.nmap("<leader>ta", function() neotest.run.run(vim.loop.cwd()) end, { desc = "Run All Test Files" })
    keys.nmap("<leader>ts", function() neotest.summary.toggle() end, { desc = "Toggle Summary" })
    keys.nmap("<leader>to", function() neotest.output.open({ enter = true, auto_close = true }) end, { desc = "Show Output" })
    keys.nmap("<leader>tO", function() neotest.output_panel.toggle() end, { desc = "Toggle Output Panel" })
    keys.nmap("<leader>tS", function() neotest.run.stop() end, { desc = "Stop" })
end

return M