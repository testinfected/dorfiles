--[[
  File: init.lua
  Description: Entry point file for neovim
]]

-- Fennel code goes to fnl/
require "hotpot"

require "settings"
require "plugins"
require "keybindings"
require "theme"

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
