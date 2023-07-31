--[[
  File: init.lua
  Description: Entry point file for neovim
]]

-- Fennel code goes to fnl/
require "hotpot"

-- Bootstrap plugin manager and load plugins
require "plugins"

require "keybindings"

require "settings"

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
