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
    local gs = package.loaded.gitsigns
    local keys = require("helpers.keys")

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

    -- Navigation
    keys.register({
      [']h'] = { next_hunk, "Next hunk"},
      ['[h'] = { prev_hunk, "Previous hunk"},
    }, { expr = true, buffer = buffer })

    -- Actions
    keys.register({
      ['<leader>g'] = {
        name = "+git",
        s = { gs.stage_hunk, "Stage hunk"},
        r = { gs.reset_hunk, "Reset hunk" },
        u = { gs.undo_stage_hunk, "Undo stage hunk" },
        S = { gs.stage_buffer, "Stage buffer"},
        R = { gs.reset_buffer, "Reset buffer" },
        p = { gs.preview_hunk, "Preview hunk" },
        d = { gs.diffthis, "Diff" },
        D = { function() gs.diffthis('~') end, "Diff to head" },
        b = { gs.blame_line, "Blame" },
        B = { function() gs.blame_line { full = true } end, "Full blame" },
        t = {
          name = "+toggle",
          b = { gs.toggle_current_line_blame, "Current line blame" },
          d = { gs.toggle_deleted, "Deleted" },
        }
      },
    })

    -- Text object
    keys.map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
