--[[
  File: trouble.lua
  Description: Configuration of trouble.nvim
  See: https://github.com/folke/trouble.nvim
]]

local trouble = require("trouble")
trouble.setup()

require("helpers/keyboard")

-- Keybindings
nm('<leader>x', '<cmd>TroubleToggle')                                         -- Show all problems in project (with help of LSP)
nm('gr', '<cmd>Trouble lsp_references')                                       -- Show use of object in project
