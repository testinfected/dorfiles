--[[
  File: telescope.lua
  Description: Fuzzy finder over lists
  See: https://github.com/nvim-telescope/telescope.nvim
]]

local M = {
  'nvim-telescope/telescope.nvim',
  version = '0.1.2',
  dependencies = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    {
      -- much faster fzf than its lua counterpart
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  event = 'VeryLazy'
}

local function setup_keymaps()
  local keys = require('core.utils').keys
  local builtin = require('telescope.builtin')

  keys.nmap('<leader> ', builtin.find_files, { desc = "Find files" })
  keys.nmap('<leader>,', builtin.buffers, { desc = "Select buffer" })
  keys.nmap('<leader>/', builtin.current_buffer_fuzzy_find, { desc = "Search current buffer" })
  keys.nmap("<leader>'", builtin.live_grep, { desc = "Search everywhere" })
  keys.nmap('<leader>;', builtin.command_history, { desc = "Search recent commands" })
  keys.nmap('<leader>*', builtin.grep_string, { desc = "Find word under cursor" })

  -- +buffers
  keys.nmap('<leader>bs', function() builtin.buffers({ show_all_buffers = true }) end, { desc = "Select" })
  keys.nmap('<leader>bf', builtin.current_buffer_fuzzy_find, { desc = "Find text" })

  -- +file
  keys.nmap('<leader>fo', builtin.git_files, { desc = "Open from project" })
  keys.nmap('<leader>ff', builtin.find_files, { desc = "Find" })
  keys.nmap('<leader>fr', builtin.oldfiles, { desc = "Recently opened" })

  -- +help
  keys.nmap('<leader>hc', builtin.commands, { desc = "Show available commands" })
  keys.nmap('<leader>hk', builtin.keymaps, { desc = "Show keymaps" })
  keys.nmap('<leader>ho', builtin.vim_options, { desc = "Show options" })
  keys.nmap('<leader>hh', builtin.help_tags, { desc = "Show help tags" })
  keys.nmap('<leader>hH', builtin.highlights, { desc = "Show highlight groups" })

  -- +search
  keys.nmap('<leader>sb', builtin.current_buffer_fuzzy_find, { desc = "Current buffer" })
  keys.nmap('<leader>sc', builtin.command_history, { desc = "Commands history" })
  keys.nmap('<leader>se', builtin.live_grep, { desc = "Everywhere" })
  keys.nmap('<leader>sm', builtin.marks, { desc = "Marks" })
  keys.nmap('<leader>sr', builtin.resume, { desc = "Resume previous search" })
  keys.nmap('<leader>sw', builtin.grep_string, { desc = "Word under cursor" })

  keys.nmap('<leader>v', builtin.registers, { desc = "Registers" })
end

function M.config()
  local telescope = require('telescope')

  telescope.setup {
    defaults = require('telescope.themes').get_dropdown {
      -- Default configuration for telescope goes here:
      -- config_key = value,
    },
    pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
    },
    extensions = {
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key =: value,
      -- }
      -- please take a look at the readme of the extension you want to configure
    }
  }

  -- Super fast fuzzy find
  telescope.load_extension('fzf')

  -- Keybindings
  setup_keymaps()
end

return M