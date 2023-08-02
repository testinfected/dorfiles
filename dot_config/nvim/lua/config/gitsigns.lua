--[[
  File: gitsigns.lua
  Description: Configuration of gitsigns
  See: https://github.com/lewis6991/gitsigns.nvim
]]

local gitsigns = require('gitsigns')

gitsigns.setup {
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'right_align',
    delay = 1000,
    ignore_whitespace = false,
  },
  preview_config = {
    -- Options passed to nvim_open_win
    border = "rounded",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  on_attach = function(buffer)
    local next_hunk = function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return '<Ignore>'
    end

    local prev_hunk = function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return '<Ignore>'
    end

    local keys = require("helpers.keys")

    -- Navigation
    keys.register({
      [']h'] = { next_hunk, "Next hunk"},
      ['[h'] = { prev_hunk, "Previous hunk"},
    }, { expr = true, buffer = buffer })

    local git = package.loaded.gitsigns
    local telescope = require("telescope.builtin")

    -- Actions
    keys.register({
      ['<leader>g'] = {
        name = "+git",
        s = { git.stage_hunk, "Stage hunk"},
        r = { git.reset_hunk, "Reset hunk" },
        u = { git.undo_stage_hunk, "Undo stage hunk" },
        S = { git.stage_buffer, "Stage buffer"},
        R = { git.reset_buffer, "Reset buffer" },
        p = { git.preview_hunk, "Preview hunk" },
        d = { git.diffthis, "View diff" },
        D = { function() git.diffthis('~') end, "View diff to head" },
        b = { git.blame_line, "Blame" },
        B = { function() git.blame_line { full = true } end, "Full blame" },
        h = { telescope.git_bcommits, "File history" },
        g = {
          name = "+show",
          c = { telescope.git_commits, "Commits" },
          b = { telescope.git_branches, "Branches" },
          m = { telescope.git_status, "Changes" },
          s = { telescope.git_stash, "Stash" },
        },
        t = {
          name = "+toggle",
          b = { git.toggle_current_line_blame, "Current line blame" },
          d = { git.toggle_deleted, "Deleted" },
        },
      },
    })

    -- Text object
    keys.map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Select hunk" })
  end
}
