--[[
  File: gitsigns.lua
  Description: Super fast git decorations
  See: https://github.com/lewis6991/gitsigns.nvim
]]

local M = {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' }
}

function M.config()
  local git = require('gitsigns')

  git.setup {
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'right_align',
      delay = 1000,
      ignore_whitespace = false,
    },
    preview_config = {
      -- Options passed to nvim_open_win
      border = 'rounded',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1,
    },
    on_attach = function(bufnr)
      local keys = require('core.utils').keys
      -- Key mappings
      local function opts(values)
        values.buffer = bufnr
        return values
      end

      -- Navigation
      local next_hunk = function()
        if vim.wo.diff then return ']c' end vim.schedule(function() git.next_hunk() end)
        return '<Ignore>'
      end

      local prev_hunk = function()
        if vim.wo.diff then return '[c' end vim.schedule(function() git.prev_hunk() end)
        return '<Ignore>'
      end

      keys.nmap(']h', next_hunk, opts { desc = "Next hunk", expr = true })
      keys.nmap('[h', prev_hunk, opts { desc = "Previous hunk", expr = true })

      local telescope = require('telescope.builtin')
      local prefix = '<leader>g'
      -- +git actions
      keys.nmap(prefix .. 's', git.stage_hunk, opts { desc = "Stage hunk" })
      keys.nmap(prefix .. 'r', git.reset_hunk, opts { desc = "Reset hunk" })
      keys.nmap(prefix .. 'u', git.undo_stage_hunk, opts { desc = "Undo stage hunk" })
      keys.nmap(prefix .. 'S', git.stage_buffer, opts { desc = "Stage buffer" })
      keys.nmap(prefix .. 'R', git.reset_buffer, opts { desc = "Reset buffer" })
      keys.nmap(prefix .. 'p', git.preview_hunk, opts { desc = "Preview hunk" })
      keys.nmap(prefix .. 'd', git.diffthis, opts { desc = "View diff" })
      keys.nmap(prefix .. 'd', function() git.diffthis('~') end, opts { desc = "View diff to head" })
      keys.nmap(prefix .. 'b', git.blame_line, opts { desc = "Blame" })
      keys.nmap(prefix .. 'B', function() git.blame_line { full = true } end, opts { desc = "Full blame" })
      keys.nmap(prefix .. 'h', telescope.git_bcommits, opts { desc = "File history" })
      -- +show
      keys.nmap(prefix .. 'gc', telescope.git_commits, { buffer = bufnr, desc = "Commits" })
      keys.nmap(prefix .. 'gb', telescope.git_branches, { buffer = bufnr, desc = "Branches" })
      keys.nmap(prefix .. 'gm', telescope.git_status, { buffer = bufnr, desc = "Changes" })
      keys.nmap(prefix .. 'gs', telescope.git_stash, { buffer = bufnr, desc = "Stash" })
      -- +toggle
      keys.nmap(prefix .. 'tb', git.toggle_current_line_blame, { buffer = bufnr, desc = "Current line blame" })
      keys.nmap(prefix .. 'td', git.toggle_deleted, { buffer = bufnr, desc = "Deleted" })
      -- Text objects
      keys.map({ 'o', 'x' }, 'ih', [[<Cmd>Gitsigns select_hunk]], { buffer = bufnr, desc = "Select hunk" })
    end
  }
end

return M
