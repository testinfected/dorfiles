--[[
  File: telescope.lua
  Description: Telescope plugin configuration
  See: https://github.com/nvim-telescope/telescope.nvim
]]
local telescope = require("telescope")
telescope.setup()

-- Keybindings
local keys = require("helpers.keys")

keys.nmap('gd', '<cmd>Telescope lsp_definitions<CR>')                                   -- Goto declaration
keys.nmap('<leader>p', '<cmd>Telescope oldfiles<CR>')                                   -- Show recent files
keys.nmap('<leader>O', '<cmd>Telescope git_files<CR>')                                  -- Search for a file in project
keys.nmap('<leader>o', '<cmd>Telescope find_files<CR>')                                 -- Search for a file (ignoring git-ignore)
keys.nmap('<leader>i', '<cmd>Telescope jumplist<CR>')                                   -- Show jumplist (previous locations)
keys.nmap('<leader>b', '<cmd>Telescope git_branches<CR>')                               -- Show git branches
keys.nmap('<leader>f', '<cmd>Telescope live_grep<CR>')                                  -- Find a string in project
keys.nmap('<leader>q', '<cmd>Telescope buffers<CR>')                                    -- Show all buffers
keys.nmap('<leader>a', '<cmd>Telescope<CR>')                                            -- Show all commands
keys.nmap('<leader>t', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')              -- Search for dynamic symbols
