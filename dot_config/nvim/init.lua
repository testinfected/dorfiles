--[[
  File: init.lua
  Description: Entry point file for neovim
]]

require 'core.fennel' -- Fennel code goes to fnl/
require 'core.options' -- set before loading plugins, so that leader key is defined
require 'core.lazy'
require 'core.keymaps'

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0