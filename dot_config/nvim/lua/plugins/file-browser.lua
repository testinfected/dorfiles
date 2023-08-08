--[[
  File: file-browser.lua
  Description: File browser extension for telescope.nvim
  See: https://github.com/nvim-telescope/telescope-file-browser.nvim
]]

local M = {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    event = { "Bufenter" },
    cmd = { "Telescope" },
}

function M.config()
    local telescope = require "telescope"
    telescope.load_extension "file_browser"
end

return M