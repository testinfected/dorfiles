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

  keys.nmap('<leader> ', builtin.find_files, { desc = "Find file" })
  keys.nmap('<leader>;', builtin.buffers, { desc = "Select buffer" })
  keys.nmap('<leader>/', builtin.live_grep, { desc = "Search everywhere" })
  keys.nmap('<leader>:', builtin.command_history, { desc = "Search command history" })
  keys.nmap('<leader>*', builtin.grep_string, { desc = "Find word under cursor" })

  -- +buffer
  keys.nmap('<leader>bf', builtin.find_files, { desc = "Open from workspace" })
  keys.nmap('<leader>bo', builtin.git_files, { desc = "Open from project" })
  keys.nmap('<leader>br', builtin.oldfiles, { desc = "Open recent" })
  keys.nmap('<leader>bs', function() builtin.buffers({ show_all_buffers = true }) end, { desc = "Select" })

  -- +Find
  keys.nmap('<leader>fb', builtin.current_buffer_fuzzy_find, { desc = "Text in current buffer" })
  keys.nmap('<leader>fc', builtin.command_history, { desc = "Recent command" })
  keys.nmap('<leader>fm', builtin.marks, { desc = "Mark" })
  keys.nmap('<leader>fr', builtin.resume, { desc = "Resume last search" })
  keys.nmap('<leader>ft', builtin.live_grep, { desc = "Text everywhere" })
  keys.nmap('<leader>fw', builtin.grep_string, { desc = "Word under cursor" })

  -- +help
  keys.nmap('<leader>hc', builtin.commands, { desc = "Show available commands" })
  keys.nmap('<leader>hk', builtin.keymaps, { desc = "Show keymaps" })
  keys.nmap('<leader>ho', builtin.vim_options, { desc = "Show options" })
  keys.nmap('<leader>hh', builtin.help_tags, { desc = "Show help tags" })
  keys.nmap('<leader>hH', builtin.highlights, { desc = "Show highlight groups" })
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