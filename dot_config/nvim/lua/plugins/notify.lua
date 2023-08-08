--[[
  File: notify.lua
  Description: Fancy, configurable, notification manager for NeoVim
  See: https://github.com/rcarriga/nvim-notify
]]

local M = {
    "rcarriga/nvim-notify",
    dependencies = {
        "catppuccin/nvim",
    }
}

function M.config()
    local icons = require "core.icons"

    require("notify").setup {
        icons = {
            DEBUG = icons.diagnostics.Debug,
            ERROR = icons.diagnostics.Error,
            INFO = icons.diagnostics.Info,
            TRACE = icons.diagnostics.Trace,
            WARN = icons.diagnostics.Warning
        },
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "fade_in_slide_out",
        timeout = 5000,
        top_down = true,
    }
end

return M