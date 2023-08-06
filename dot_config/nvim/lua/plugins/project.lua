--[[
  File: project.lua
  Description: Project management solution for neovim
  See: https://github.com/ahmedkhalf/project.nvim
]]

local M = {
    "ahmedkhalf/project.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    event = "Bufenter",
    cmd = { "Telescope" },
}

function M.config()
    local project = require "project_nvim"

    project.setup {
        -- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
        detection_methods = { "pattern" },

        -- patterns used to detect root dir, when **"pattern"** is in detection_methods
        patterns = { ".git", "Makefile", "package.json", "go.mod", "cargo.toml" },
    }

    local telescope = require "telescope"
    telescope.load_extension "projects"
end

return M