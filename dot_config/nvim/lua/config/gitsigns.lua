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

    -- Navigation
    keys.nmap(']c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return '<Ignore>'
    end, { expr = true, buffer = buffer })

    keys.nmap('[c', function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return '<Ignore>'
    end, { expr = true, buffer = buffer })

    -- Actions
    keys.nmap('<leader>hs', gs.stage_hunk)
    keys.nmap('<leader>hr', gs.reset_hunk)
    keys.vmap('<leader>hs', function()
      gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
    end)
    keys.vmap('<leader>hr', function()
      gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') }
    end)
    keys.nmap('<leader>hS', gs.stage_buffer)
    keys.nmap('<leader>hu', gs.undo_stage_hunk)
    keys.nmap('<leader>hR', gs.reset_buffer)
    keys.nmap('<leader>hp', gs.preview_hunk)
    keys.nmap('<leader>hb', function()
      gs.blame_line { full = true }
    end)
    keys.nmap('<leader>tb', gs.toggle_current_line_blame)
    keys.nmap('<leader>hd', gs.diffthis)
    keys.nmap('<leader>hD', function()
      gs.diffthis('~')
    end)
    keys.nmap('<leader>td', gs.toggle_deleted)

    -- Text object
    keys.map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
