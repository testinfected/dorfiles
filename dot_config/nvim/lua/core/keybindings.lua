--[[
  File: keybindings.lua
  Description: Defines custom keybindings
]]

local keys = require "core.utils".keys

keys.map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear search highlighting" })

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
